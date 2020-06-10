const { v4: uuidv4 } = require('uuid');

const db = require('../../database');
const languageLogic = require('./language.js');

const MAX_UNIQUE_TRIES = 10;
const KEY_BASE = 'results_resources_';

class ResourcesLogic {

    get_test_code () {
        const parts = uuidv4().split('-');
        return parts[0];
    }

    get_help (info, which) {
        let name = '';
        if (info.benefit) {
            name += info.benefit.code;
        } else {
            name += 'common';
        }
        name += ' // ' + info.code;
        let target = 'link text';
        if (which === 'desc') {
            target = 'description text';
        }
        return 'This is the ' + target + ' for a resource (' + name + '). Please use the results admin to edit it';
    }

    async generate_keys (benefit) {
        let cleared = false;
        let tries = 0;
        let code = null;
        while (!cleared && tries < MAX_UNIQUE_TRIES) {
            code = this.get_test_code();
            const sth = await db.query(`
                SELECT COUNT(resource_id) AS found
                FROM resources
                WHERE code = $1`,
                [ code ]
            );
            if (sth.rows[0].found < 1) {
                cleared = true;
            }
            ++tries;
        }
        if (!cleared) {
            return null;
        }
        let text_key = KEY_BASE;
        let desc_key = KEY_BASE;
        if (benefit) {
            text_key += '_' + benefit.code;
            desc_key += '_' + benefit.code;
        }
        text_key += '_' + code;
        desc_key += '_desc_' + code;
        return {
            code: code,
            text_key: text_key,
            desc_key: desc_key
        };
    }

    async getAll (b_code, which) {
        let where = '';
        let params = [];
        if (b_code === 'common') {
            where = `
            WHERE r.benefit_id IS NULL`;
        } else if (b_code) {
            where = `
            WHERE b.code = $1`;
            params.push(b_code);
        }
        const sth = await db.query(`
            SELECT b.abbreviation, r.resource_id,
                r.code, r.lang_key_text, r.lang_key_desc,
                t1.translation AS en_text,
                t2.translation AS en_desc,
                l.language, l.url
            FROM resource_links l
            JOIN resources r USING (resource_id)
            LEFT JOIN benefits b USING (benefit_id)
            LEFT JOIN language_keys k1 ON (r.lang_key_text = k1.key)
            LEFT JOIN language_keys k2 ON (r.lang_key_desc = k2.key)
            LEFT JOIN translations t1 ON (k1.key_id = t1.key_id AND t1.language = 'en')
            LEFT JOIN translations t2 ON (k2.key_id = t2.key_id AND t2.language = 'en')` + where + `
            ORDER BY b.sort_order, r.sort_order, l.language`,
            params
        );
        let order = [];
        let map = {};
        for (const row of sth.rows) {
            if (!(row.resource_id in map)) {
                order.push(row.resource_id);
                map[row.resource_id] = {
                    benefit: row.abbreviation,
                    id: row.resource_id,
                    code: row.code,
                    lang_key_text: row.lang_key_text,
                    lang_key_desc: row.lang_key_desc,
                    en_text: row.en_text,
                    en_desc: row.en_desc,
                    links: {}
                };
            }
            if (row.url) {
                map[row.resource_id].links[row.language] = row.url;
            }
        }
        let all = [];
        for (const id of order) {
            all.push(map[id]);
        }
        return { ok: true, data: { all: all } };
    }

    async getDetails (id) {
        const sth = await db.query(`
            SELECT b.benefit_id, b.code AS b_code, b.abbreviation,
                r.resource_id, r.code, r.lang_key_text, r.lang_key_desc,
                t1.translation AS en_text, t2.translation AS en_desc,
                l.language, l.url
            FROM resource_links l
            JOIN resources r USING (resource_id)
            LEFT JOIN benefits b USING (benefit_id)
            LEFT JOIN language_keys k1 ON (r.lang_key_text = k1.key)
            LEFT JOIN language_keys k2 ON (r.lang_key_desc = k2.key)
            LEFT JOIN translations t1 ON (k1.key_id = t1.key_id AND t1.language = 'en')
            LEFT JOIN translations t2 ON (k2.key_id = t2.key_id AND t2.language = 'en')
            WHERE r.resource_id = $1`,
            [ id ]
        );
        if (sth.rows.length < 1) {
            return { ok: false, data: { status: 404, code: 'NOT_FOUND' } };
        }
        let info = null;
        for (const row of sth.rows) {
            if (info === null) {
                info = {
                    benefit: null,
                    id: row.resource_id,
                    code: row.code,
                    lang_key_text: row.lang_key_text,
                    lang_key_desc: row.lang_key_desc,
                    en_text: row.en_text,
                    en_desc: row.en_desc,
                    links: {}
                };
                if (row.benefit_id) {
                    info.benefit = {
                        id: row.benefit_id,
                        code: row.b_code,
                        abbreviation: row.abbreviation
                    };
                }
            }
            if (row.url) {
                info.links[row.language] = row.url;
            }
        }
        return { ok: true, data: { resource: info } };
    }

    async saveResource (info) {

        // Are we updating or inserting?
        let old = null;
        if (info.id) {
            const found = await this.getDetails(info.id);
            if (found.ok) {
                old = found.data.resource;
            }
        }

        // Start the transaction
        await db.query('BEGIN TRANSACTION');

        // Main resource row
        let id = null
        if (old !== null) {
            id = old.id;
        } else {
            const keys = await this.generate_keys(info.benefit);
            if (keys === null) {
                return { ok: false, data: { status: 500, code: 'COULD_NOT_CREATE_CODE' } };
            }
            let binds = [
                info.benefit ? info.benefit.id : null,
                keys.code,
                keys.text_key,
                keys.desc_key
            ];
            let test = 'IS NULL';
            if (info.benefit !== null) {
                test = '= $5';
                binds.push(info.benefit.id);
            }
            const sth1 = await db.query(`
                INSERT INTO resources (benefit_id, code,
                    lang_key_text, lang_key_desc, sort_order)
                SELECT $1, $2, $3, $4,
                    CASE WHEN MAX(sort_order) IS NULL
                        THEN 0
                    ELSE MAX(sort_order) END
                    FROM resources
                    WHERE benefit_id ${test}
                RETURNING resource_id`,
                binds
            );
            if (sth1.rows.length < 1) {
                return { ok: false, data: { status: 500, code: 'INSERT_FAILED' } };
            }
            id = sth1.rows[0].resource_id;
            info.id = id;
            info.code = keys.code;
            info.lang_key_text = keys.text_key;
            info.lang_key_desc = keys.desc_key;
        }

        // Links
        let updated = {};
        if (old !== null) {
            for (const lang in old.links) {
                updated[lang] = false;
            }
        }
        for (const lang in info.links) {
            if (old !== null && lang in old.links) {
                await db.query(`
                    UPDATE resource_links
                    SET url = $1
                    WHERE resource_id = $2
                        AND language = $3`,
                    [ info.links[lang], id, lang ]
                );
                updated[lang] = true;
            } else {
                await db.query(`
                    INSERT INTO resource_links (resource_id, language, url)
                    VALUES ($1, $2, $3)`,
                    [ id, lang, info.links[lang] ]
                );
            }
        }

        // Handle language
        const text = await languageLogic.saveInfo({
            key: info.lang_key_text,
            section: 'results_resources',
            help: this.get_help(info, 'text'),
            token_replace: true,
            markdown_allowed: false,
            translations: {
                en: info.en_text
            }
        });
        if (!text.ok) {
            return { ok: false, data: { status: text.status, code: text.code } };
        }
        const desc = await languageLogic.saveInfo({
            key: info.lang_key_desc,
            section: 'results_resources',
            help: this.get_help(info, 'desc'),
            token_replace: true,
            markdown_allowed: true,
            translations: {
                en: info.en_desc
            }
        });
        if (!desc.ok) {
            return { ok: false, data: { status: desc.status, code: desc.code } };
        }

        // Commit
        await db.query('COMMIT');

        return { ok: true, msg: 'Saved', data: { info: info } };
    }

}

module.exports = new ResourcesLogic();

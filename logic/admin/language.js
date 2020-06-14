const md5 = require('md5');

const db = require('../../database');

class LanguageLogic {

    async getAllKeysBySection () {
        const sth = await db.query(`
            SELECT section, key, help, token_replace,
                markdown_allowed, en.translation AS english
            FROM language_keys k
            JOIN translations en ON (en.key_id = k.key_id
                AND en.language = 'en')
            ORDER BY section, key`
        );
        let all = {};
        for (const row of sth.rows) {
            if (!(row.section in all)) {
                all[row.section] = [];
            }
            all[row.section].push({
                key: row.key,
                english: row.english,
                help: row.help,
                token_replace: row.token_replace,
                markdown_allowed: row.markdown_allowed
            });
        }
        return { ok: true, data: { all: all } };
    }

    async getAllKeys (section) {
        let where = '';
        let params = [];
        if (section) {
            where = `
            WHERE section = $1`;
            params.push(section);
        }
        const sth = await db.query(`
            SELECT section, key, help, token_replace,
                markdown_allowed, en.translation AS english
            FROM language_keys k
            JOIN translations en ON (en.key_id = k.key_id
                AND en.language = 'en')` + where + `
            ORDER BY section, key`,
            params
        );
        return { ok: true, data: { all: sth.rows } };
    }

    async getInfo (key) {
        const sth = await db.query(`
            SELECT section, key, help, markdown_allowed,
                token_replace, language, translation
            FROM translations t
            JOIN language_keys k ON (t.key_id = k.key_id)
            WHERE key = $1`,
            [ key ]
        );
        if (sth.rows.length < 1) {
            return { ok: false, data: { code: 'NOT_FOUND', status: 403 } };
        }
        let info = {
            section: sth.rows[0].section,
            key: sth.rows[0].key,
            help: sth.rows[0].help,
            token_replace: sth.rows[0].token_replace,
            markdown_allowed: sth.rows[0].markdown_allowed
        };
        let translations = {};
        for (let row of sth.rows) {
            translations[row.language] = row.translation;
        }
        return { ok: true, data: { ...translations, info: info } };
    }

    async saveTranslation (key, language, translation) {
        const sth1 = await db.query(`
            SELECT key_id
            FROM language_keys
            WHERE key = $1`,
            [ key ]
        );
        if (sth1.rows.length < 1) {
            return { ok: false, data: { code: 'NOT_FOUND', status: 403 } };
        }
        const key_id = sth1.rows[0].key_id;
        const sth2 = await db.query(`
            INSERT INTO translations (key_id, language, translation)
            VALUES ($1, $2, $3)
            ON CONFLICT (key_id, language)
            DO UPDATE SET translation = EXCLUDED.translation
            RETURNING translation_id`,
            [ key_id, language, translation ]
        );
        const translation_id = sth2.rows[0].translation_id;
        return { ok: true, data: { translation_id: translation_id } };
    }

    async saveInfo (info) {

        // Get current info
        let current = {};
        const sth1 = await db.query(`
            SELECT k.key, k.key_id, t.language,
                t.translation, t.translation_id
            FROM language_keys k
            LEFT JOIN translations t USING (key_id)
            WHERE key = $1`,
            [ info.key ]
        );
        for (const row of sth1.rows) {
            if (!('key_id' in current)) {
                current.key = row.key;
                current.key_id = row.key_id;
                current.translations = {};
            }
            if (row.translation_id) {
                current.translations[row.language] = {
                    translation_id: row.translation_id,
                    translation: row.translation,
                };
            }
        }

        // Key insert, if necessary
        if (!current.key_id) {
            const sth2 = await db.query(`
                INSERT INTO language_keys (key, section, help, token_replace, markdown_allowed)
                VALUES ($1, $2, $3, $4, $5)
                RETURNING key_id`,
                [ info.key, info.section, info.help, info.token_replace, info.markdown_allowed ]
            );
            if (sth2.rows.length < 1) {
                return { ok: false, data: { status: 500, code: 'KEY_INSERT_FAILED' } };
            }
            current.key_id = sth2.rows[0].key_id
        }

        // Insert or update translations
        for (const language in info.translations) {
            await db.query(`
                INSERT INTO translations (key_id, language, translation)
                VALUES ($1, $2, $3)
                ON CONFLICT (key_id, language)
                DO UPDATE SET translation = EXCLUDED.translation`,
                [
                    current.key_id,
                    language,
                    info.translations[language]
                ]
            );
        }

        return { ok: true, data: { msg: 'Saved' } };
    }

}

module.exports = new LanguageLogic();

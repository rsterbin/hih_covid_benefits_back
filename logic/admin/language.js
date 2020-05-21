const md5 = require('md5');

const db = require('../../database');

module.exports = {

    getAllKeysBySection: async () => {
        const sth = await db.query(`
            SELECT section, key, help, markdown_allowed,
                en.translation AS english
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
                markdown_allowed: row.markdown_allowed
            });
        }
        return { ok: true, data: { all: all } };
    },

    getInfo: async (key) => {
        const sth = await db.query(`
            SELECT section, key, help, markdown_allowed,
                language, translation
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
            markdown_allowed: sth.rows[0].markdown_allowed
        };
        let translations = {};
        for (let row of sth.rows) {
            translations[row.language] = row.translation;
        }
        return { ok: true, data: { ...translations, info: info } };
    },

    saveTranslation: async (key, language, translation) => {
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

};

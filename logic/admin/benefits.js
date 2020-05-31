const db = require('../../database');

module.exports = {

    getAll: async () => {
        const sth = await db.query(`
            SELECT code, name, abbreviation
            FROM benefits
            ORDER BY sort_order`
        );
        return { ok: true, data: { all: sth.rows } };
    },

    getBenefitDetails: async (code) => {
        const sth = await db.query(`
            SELECT code, name, abbreviation
            FROM benefits
            WHERE code = $1`,
            [ code ]
        );
        if (sth.rows.length < 1) {
            return { ok: false, data: { status: 404, code: 'NOT_FOUND' } };
        }
        return { ok: true, data: { benefit: sth.rows[0] } };
    },

    getConditions: async (code) => {
        const sth = await db.query(`
            SELECT c.name, c.key_name, c.options
            FROM conditions c
            JOIN benefits b USING (benefit_id)
            WHERE b.code = $1
            ORDER BY c.sort_order`,
            [ code ]
        );
        const conditions = sth.rows.map(row => {
            return {
                name: row.name,
                key_name: row.key_name,
                options: JSON.parse(row.options)
            };
        });
        return { ok: true, data: { conditions: conditions } };
    },

    getScenarios: async (code) => {
        const sth = await db.query(`
            SELECT s.scenario_id, s.condition_map, s.help, s.enabled,
                s.lang_key_result, s.lang_key_expanded,
                t.translation AS en_result
            FROM scenarios s
            JOIN benefits b USING (benefit_id)
            LEFT JOIN language_keys k ON (s.lang_key_result = k.key)
            LEFT JOIN translations t ON (t.key_id = k.key_id AND t.language = 'en')
            WHERE b.code = $1`,
            [ code ]
        );
        const scenarios = sth.rows.map(row => {
            return {
                id: row.scenario_id,
                condition_map: JSON.parse(row.condition_map),
                help: row.help,
                enabled: row.enabled,
                lang_key_result: row.lang_key_result,
                lang_key_expanded: row.lang_key_expanded,
                en_result: row.en_result,
                en_expanded: row.en_expanded
            };
        });
        return { ok: true, data: { scenarios: scenarios } };
    },

    getScenario: async (code, id) => {
        const sth = await db.query(`
            SELECT s.scenario_id, s.condition_map, s.help, s.enabled,
                s.lang_key_result, s.lang_key_expanded,
                t1.translation AS en_result,
                t2.translation AS en_expanded
            FROM scenarios s
            JOIN benefits b USING (benefit_id)
            LEFT JOIN language_keys k1 ON (s.lang_key_result = k1.key)
            LEFT JOIN language_keys k2 ON (s.lang_key_expanded = k2.key)
            LEFT JOIN translations t1 ON (t1.key_id = k1.key_id AND t1.language = 'en')
            LEFT JOIN translations t2 ON (t2.key_id = k2.key_id AND t2.language = 'en')
            WHERE b.code = $1 AND s.scenario_id = $2`,
            [ code, id ]
        );
        if (sth.rows.length < 1) {
            return { ok: false, data: { status: 404, code: 'NOT_FOUND' } };
        }
        const scenario = {
            id: sth.rows[0].scenario_id,
            condition_map: JSON.parse(sth.rows[0].condition_map),
            help: sth.rows[0].help,
            enabled: sth.rows[0].enabled,
            lang_key_result: sth.rows[0].lang_key_result,
            lang_key_expanded: sth.rows[0].lang_key_expanded,
            en_result: sth.rows[0].en_result,
            en_expanded: sth.rows[0].en_expanded
        };
        return { ok: true, data: { scenario: scenario } };
    },

    saveScenario: async (code, id, enabled, en_result, en_expanded) => {

        // Get info
        const sth1 = await db.query(`
            SELECT s.scenario_id, s.enabled, s.help,
                s.lang_key_result, s.lang_key_expanded,
                b.abbreviation AS benefit,
                k1.key_id AS result_key_id,
                k2.key_id AS expanded_key_id,
                t1.translation AS en_result,
                t1.translation_id AS en_result_id,
                t2.translation AS en_expanded,
                t2.translation_id AS en_expanded_id
            FROM scenarios s
            JOIN benefits b USING (benefit_id)
            LEFT JOIN language_keys k1 ON (s.lang_key_result = k1.key)
            LEFT JOIN language_keys k2 ON (s.lang_key_expanded = k2.key)
            LEFT JOIN translations t1 ON (t1.key_id = k1.key_id AND t1.language = 'en')
            LEFT JOIN translations t2 ON (t2.key_id = k2.key_id AND t2.language = 'en')
            WHERE b.code = $1 AND s.scenario_id = $2`,
            [ code, id ]
        );
        if (sth1.rows.length < 1) {
            return { ok: false, data: { status: 404, code: 'NOT_FOUND' } };
        }
        let current = sth1.rows[0];

        // Start the transaction
        await db.query('BEGIN TRANSACTION');

        // Update the enabled flag
        if (current.enabled != enabled) {
            const sth2 = await db.query(`
                UPDATE scenarios
                SET enabled = $1
                WHERE scenario_id = $2`,
                [ enabled, current.scenario_id ]
            );
        }

        // Result key insert, if necessary
        if (!current.result_key_id) {
            let help = 'This answer appears under ' + current.benefit +
                " for the following scenario:\n\n" +
                current.help.split("\n").map(line => '* ' + line).join("\n") +
                "\n\n" +
                'If `{{employee_type}}}` appears in the text, it will be ' +
                'replaced by the type selected.';
            const sth3 = await db.query(`
                INSERT INTO language_keys (key, section, help, markdown_allowed)
                VALUES ($1, 'results_processing', $2, TRUE)
                RETURNING key_id`,
                [ current.lang_key_result, help ]
            );
            if (sth3.rows.length < 1) {
                return { ok: false, data: { status: 500, code: 'INSERT_FAILED' } };
            }
            current.result_key_id = sth3.rows[0].key_id;
        }

        // Insert or update result translation
        if (current.en_result_id) {
            await db.query(`
                UPDATE translations
                SET translation = $1
                WHERE key_id = $2 AND language = 'en'`,
                [ en_result, current.result_key_id ]
            );
        } else {
            await db.query(`
                INSERT INTO translations (key_id, language, translation)
                VALUES ($1, 'en', $2)`,
                [ current.result_key_id, en_result ]
            );
        }

        // Expanded key insert, if necessary
        if (!current.expanded_key_id) {
            let help = 'This expanded answer appears under ' + current.benefit +
                " for the following scenario:\n\n" +
                current.help.split("\n").map(line => '* ' + line).join("\n") +
                "\n\n" +
                'If `{{employee_type}}}` appears in the text, it will be ' +
                'replaced by the type selected.';
            const sth4 = await db.query(`
                INSERT INTO language_keys (key, section, help, markdown_allowed)
                VALUES ($1, 'results_processing', $2, TRUE)
                RETURNING key_id`,
                [ current.lang_key_expanded, help ]
            );
            if (sth4.rows.length < 1) {
                return { ok: false, data: { status: 500, code: 'INSERT_FAILED' } };
            }
            current.expanded_key_id = sth4.rows[0].key_id;
        }

        // Insert or update expanded translation
        if (current.en_expanded_id) {
            await db.query(`
                UPDATE translations
                SET translation = $1
                WHERE key_id = $2 AND language = 'en'`,
                [ en_expanded, current.expanded_key_id ]
            );
        } else {
            await db.query(`
                INSERT INTO translations (key_id, language, translation)
                VALUES ($1, 'en', $2)`,
                [ current.expanded_key_id, en_expanded ]
            );
        }

        // Commit
        await db.query('COMMIT');

        return { ok: true, msg: 'Updated' };
    }

};

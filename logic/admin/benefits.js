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
            SELECT name, abbreviation
            FROM benefits
            WHERE code = $1`,
            [ code ]
        );
        if (sth.rows.length < 1) {
            return { ok: false, status: 404 };
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
                t1.translation AS en_result,
                t2.translation AS en_expanded
            FROM scenarios s
            JOIN benefits b USING (benefit_id)
            LEFT JOIN language_keys k1 ON (s.lang_key_result = k1.key)
            LEFT JOIN language_keys k2 ON (s.lang_key_result = k2.key)
            LEFT JOIN translations t1 ON (t1.key_id = k1.key_id AND t1.language = 'en')
            LEFT JOIN translations t2 ON (t2.key_id = k2.key_id AND t2.language = 'en')
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
    }

};

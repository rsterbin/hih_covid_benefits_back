const db = require('../../database');
const languageLogic = require('./language.js');

class BenefitsLogic {

    get_help (current, which) {
        let target = 'answer';
        if (which === 'expanded') {
            target = 'expanded answer';
        }
        let help = 'This ' + target + ' appears under ' + current.benefit + ' for the following scenario:';
        help += "\n\n";
        help += current.help.split("\n").map(line => '* ' + line).join("\n");
        help += "\n\n";
        help += 'If `{{employee_type}}}` appears in the text, it will be replaced by the type selected.';
        return help;
    }

    async getAll () {
        const sth = await db.query(`
            SELECT benefit_id AS id, code, name, abbreviation
            FROM benefits
            ORDER BY sort_order`
        );
        return { ok: true, data: { all: sth.rows } };
    }

    async getBenefitDetails (code) {
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
    }

    async getConditions (code) {
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
    }

    async getScenarios (code) {
        const sth = await db.query(`
            SELECT s.scenario_id, s.condition_map, s.help, s.enabled,
                s.lang_key_result, s.lang_key_expanded,
                t1.translation AS en_result,
                t2.translation AS en_expanded
            FROM scenarios s
            JOIN benefits b USING (benefit_id)
            LEFT JOIN language_keys k1 ON (s.lang_key_result = k1.key)
            LEFT JOIN translations t1 ON (t1.key_id = k1.key_id AND t1.language = 'en')
            LEFT JOIN language_keys k2 ON (s.lang_key_expanded = k2.key)
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

    async getScenario (code, id) {
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
    }

    async saveScenario (code, id, enabled, en_result, en_expanded) {

        // Get info
        const sth1 = await db.query(`
            SELECT s.scenario_id, s.enabled, s.help,
                s.lang_key_result, s.lang_key_expanded,
                b.abbreviation AS benefit,
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

        // Handle language
        const result = await languageLogic.saveInfo({
            key: current.lang_key_result,
            section: 'results_processing',
            help: this.get_help(current, 'result'),
            markdown_allowed: true,
            translations: {
                en: en_result
            }
        });
        if (!result.ok) {
            console.log(result);
            return { ok: false, data: { status: result.status, code: result.code } };
        }
        const expanded = await languageLogic.saveInfo({
            key: current.lang_key_expanded,
            section: 'results_processing',
            help: this.get_help(current, 'expanded'),
            markdown_allowed: true,
            translations: {
                en: en_expanded
            }
        });
        if (!expanded.ok) {
            console.log(expanded);
            return { ok: false, data: { status: expanded.status, code: expanded.code } };
        }

        // Commit
        await db.query('COMMIT');

        return { ok: true, msg: 'Updated' };
    }

}

module.exports = new BenefitsLogic();

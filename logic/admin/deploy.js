var fs = require('fs');
const { v4: uuidv4 } = require('uuid');

const db = require('../../database');

class DeployLogic {

    // Take a deployment in json form and push it into the database
    // NB: If we're expanding an old deployment, we may not want to do a
    // complete refresh, but pull in only the relevant sections -- it'd be
    // way to complicated to try and do a data merge, but we can at least
    // not bork, say, the responses table
    async expand_deployment (json) {
        const deploy = JSON.parse(json);

        await db.query('BEGIN TRANSACTION');
        console.log('expanding', 'began transaction');

        if ('lang_keys' in deploy) {
            replace_translations(deploy);
        }

        if ('questions' in deploy) {
            replace_questions(deploy);
        }

        if ('benefits' in deploy) {
            replace_benefits(deploy);
        }

        await db.query('COMMIT');
        console.log('expanding', 'committed');
    }

    async replace_translations (deploy) {

        // Delete keys and translations
        await db.query(`
            WITH d1 as ( DELETE FROM translations )
            DELETE FROM language_keys`
        );

        // Replace them
        for (const key in deploy.lang_keys) {
            const sth = await db.query(`
                INSERT INTO language_keys (key, section, help, token_replace, markdown_allowed)
                VALUES ($1, $2, $3, $4, $5)
                RETURNING key_id`,
                [
                    key,
                    deploy.lang_keys[key].section,
                    deploy.lang_keys[key].help,
                    deploy.lang_keys[key].token_replace,
                    deploy.lang_keys[key].markdown_allowed
                ]
            );
            const key_id = sth.rows[0].key_id;
            if (key in deploy.lang_en) {
                await db.query(`
                    INSERT INTO translations (key_id, language, translation)
                    VALUES ($1, $2, $3)`,
                    [ key_id, 'en', deploy.lang_en[key] ]
                );
            } else {
                console.log('Missing translation for ' + key);
            }
        }

        console.log('expanding', 'replaced language');

    }

    async replace_questions (deploy) {

        // Delete all questions and their answers
        await db.query(`
            WITH d as ( DELETE FROM question_answers ),
            DELETE FROM questions`
        );
        console.log('expanding', 'deleted questions and answers');

        // Add questions
        let q_order = 0;
        let question_map = {};
        let answer_map = {};
        if (deploy.questions) {
            for (const code of deploy.questions.order) {
                const sth = await db.query(`
                    INSERT INTO questions (code, full_lang_key, title_lang_key,
                        help_lang_key, layout, sort_order)
                    VALUES ($1, $2, $3, $4)
                    RETURNING question_id`,
                    [
                        code,
                        deploy.questions.spec[code].full_lang_key,
                        deploy.questions.spec[code].title_lang_key,
                        deploy.questions.spec[code].help_lang_key,
                        deploy.questions.spec[code].layout,
                        q_order
                    ]
                );
                const question_id = sth.rows[0].question_id;
                question_map[code] = question_id;
                answer_map[code] = deploy.questions.spec[code].answers;
                ++q_order;
            }
        }
        console.log('expanding', 'replaced questions');

        // Add answers
        for (const code in answer_map) {
            let a_order = 0;
            for (const answer of answer_map[code]) {
                await db.query(`
                    INSERT INTO question_answers (question_id, letter,
                        lang_key, sort_order)
                    VALUES ($1, $2, $3, $4)`,
                    [
                        question_map[code],
                        answer.letter,
                        answer.lang_key,
                        a_order
                    ]
                );
                a_order++;
            }
        }
        console.log('expanding', 'replaced answers');

    }

    async replace_benefits (deploy) {

        // Delete all benefits and their associations
        await db.query(`
            WITH d1 as ( DELETE FROM scenarios ),
            d2 as ( DELETE FROM conditions ),
            d4 as ( DELETE FROM resource_links ),
            d5 as ( DELETE FROM resources )
            DELETE FROM benefits`
        );
        console.log('expanding', 'deleted results');

        // Add benefits
        let b_order = 0;
        let benefit_map = {};
        for (const code of deploy.benefits.order) {
            const sth = await db.query(`
                INSERT INTO benefits (code, name, abbreviation, sort_order)
                VALUES ($1, $2, $3, $4)
                RETURNING benefit_id`,
                [
                    code,
                    deploy.benefits.spec[code].name,
                    deploy.benefits.spec[code].abbreviation,
                    b_order
                ]
            );
            const benefit_id = sth.rows[0].benefit_id;
            benefit_map[code] = benefit_id;
            ++b_order;
        }
        console.log('expanding', 'replaced benefits');

        // Add conditions
        for (const code in deploy.conditions) {
            let c_order = 0;
            for (const cond of deploy.conditions[code]) {
                await db.query(`
                    INSERT INTO conditions (benefit_id, name, key_name, pass,
                        build_function, options, sort_order)
                    VALUES ($1, $2, $3, $4, $5, $6, $7)`,
                    [
                        benefit_map[code],
                        cond.name,
                        cond.code,
                        cond.pass,
                        cond.method,
                        JSON.stringify(cond.outcomes),
                        c_order
                    ]
                );
                c_order++;
            }
        }
        console.log('expanding', 'replaced conditions');

        // Add scenarios
        for (const code in deploy.scenarios) {
            let s_order = 0;
            for (const scen of deploy.scenarios[code]) {
                await db.query(`
                    INSERT INTO scenarios (benefit_id, condition_map, help, enabled,
                        lang_key_result, lang_key_expanded, sort_order)
                    VALUES ($1, $2, $3, $4, $5, $6, $7)`,
                    [
                        benefit_map[code],
                        JSON.stringify(scen.conditions),
                        scen.help,
                        scen.enabled,
                        scen.lang_key_result,
                        scen.lang_key_expanded,
                        s_order
                    ]
                );
                s_order++;
            }
        }
        console.log('expanding', 'replaced scenarios');

        // Flatten the resources
        let resources = [];
        for (const code in deploy.resources.benefits) {
            let r_order = 0;
            for (const res of deploy.resources.benefits[code]) {
                resources.push({
                    ...res,
                    benefit_id: benefit_map[code],
                    order: r_order
                });
                ++r_order;
            }
        }
        for (const res of deploy.resources.other) {
            let r_order = 0;
            resources.push({
                ...res,
                benefit_id: null,
                    order: r_order
            });
            ++r_order;
        }
        console.log('expanding', 'flattened resources');

        // Add the resources
        for (const res of resources) {
            const sth = await db.query(`
                INSERT INTO resources (benefit_id, code,
                    lang_key_text, lang_key_desc, sort_order)
                VALUES ($1, $2, $3, $4, $5)
                RETURNING resource_id`,
                [
                    res.benefit_id,
                    res.code,
                    res.text,
                    res.desc,
                    res.order
                ]
            );
            const resource_id = sth.rows[0].resource_id;
            for (const lang in res.link) {
                await db.query(`
                    INSERT INTO resource_links (resource_id, language, url)
                    VALUES ($1, $2, $3)`,
                    [
                        resource_id,
                        lang,
                        res.link[lang]
                    ]
                );
            }
        }
        console.log('expanding', 'replaced resources');

    }

    // Grab all the versioned things from the database and turn them into a json string
    async collapse_version () {

        // keys
        const sth1 = await db.query(`
            SELECT key, section, help, token_replace, markdown_allowed
            FROM language_keys`
        );
        let lang_keys = {};
        for (const row of sth1.rows) {
            lang_keys[row.key] = {
                section: row.section,
                help: row.help,
                token_replace: row.token_replace,
                markdown_allowed: row.markdown_allowed
            };
        }

        // english
        const sth2 = await db.query(`
            SELECT key, translation
            FROM translations t
            JOIN language_keys k USING (key_id)
            WHERE language = 'en'`
        );
        let lang_en = {};
        for (const row of sth2.rows) {
            lang_en[row.key] = row.translation;
        }

        // questions and answers
        const sth3 = await db.query(`
            SELECT q.question_id, q.code, q.full_lang_key, q.title_lang_key,
                q.help_lang_key, q.layout, q.sort_order AS q_sort_order,
                a.letter, a.lang_key AS answer_lang_key,
                a.sort_order AS a_sort_order
            FROM questions q
            LEFT JOIN question_answers a USING (question_id)
            ORDER BY q.sort_order, a.sort_order`
        );
        let questions = {
            order: [],
            spec: {}
        };
        for (const row of sth3.rows) {
            if (!(row.code in questions.spec)) {
                questions.spec[row.code] = {
                    full_lang_key: row.full_lang_key,
                    title_lang_key: row.title_lang_key,
                    help_lang_key: row.help_lang_key,
                    layout: row.layout,
                    answers: []
                };
                questions.order.push(row.code);
            }
            questions.spec[row.code].answers.push({
                letter: row.letter,
                lang_key: row.answer_lang_key
            });
        }

        // benefits
        const sth4 = await db.query(`
            SELECT code, name, abbreviation, sort_order
            FROM benefits`
        );
        let benefits = {
            order: [],
            spec: {}
        };
        for (const row of sth4.rows) {
            benefits.order.push(row.code);
            benefits.spec[row.code] = {
                name: row.name,
                abbreviation: row.abbreviation
            };
        }

        // conditions
        const sth5 = await db.query(`
            SELECT b.code AS b_code, c.name, c.key_name, c.pass, c.build_function, c.options
            FROM conditions c
            JOIN benefits b USING (benefit_id)
            ORDER BY b.code, c.sort_order`
        );
        let conditions = {};
        for (const row of sth5.rows) {
            if (!(row.b_code in conditions)) {
                conditions[row.b_code] = [];
            }
            conditions[row.b_code].push({
                name: row.name,
                code: row.key_name,
                pass: row.pass,
                method: row.build_function,
                outcomes: JSON.parse(row.options)
            });
        }

        // scenarios
        const sth6 = await db.query(`
            SELECT b.code AS b_code, condition_map, help, enabled,
                lang_key_result, lang_key_expanded
            FROM scenarios s
            JOIN benefits b USING (benefit_id)
            ORDER BY b.code, s.sort_order`
        );
        let scenarios = {};
        for (const row of sth6.rows) {
            if (!(row.b_code in scenarios)) {
                scenarios[row.b_code] = [];
            }
            scenarios[row.b_code].push({
                conditions: JSON.parse(row.condition_map),
                help: row.help,
                enabled: row.enabled,
                lang_key_result: row.lang_key_result,
                lang_key_expanded: row.lang_key_expanded
            });
        }

        // resources
        const sth7 = await db.query(`
            SELECT r.resource_id, b.code AS b_code, r.code,
                r.lang_key_text, r.lang_key_desc,
                l.language, l.url
            FROM resources r
            LEFT JOIN benefits b USING (benefit_id)
            LEFT JOIN resource_links l USING (resource_id)
            ORDER BY b.code, r.sort_order, l.language`
        );
        let resources = {
            benefits: {},
            other: []
        };
        let resource_map = {};
        for (const row of sth7.rows) {
            if (!(row.resource_id in resource_map)) {
                let r = {
                    code: row.code,
                    text: row.lang_key_text,
                    desc: row.lang_key_desc,
                    link: {}
                };
                if (row.b_code) {
                    if (!(row.b_code in resources.benefits)) {
                        resources.benefits[row.b_code] = [];
                    }
                    resources.benefits[row.b_code].push(r);
                    resource_map[row.resource_id] = {
                        benefit: row.b_code,
                        index: resources.benefits[row.b_code].length - 1
                    };
                } else {
                    resources.other.push(r);
                    resource_map[row.resource_id] = {
                        benefit: null,
                        index: resources.other.length - 1
                    };
                }
            }
            let info = resource_map[row.resource_id];
            if (info.benefit) {
                resources.benefits[info.benefit][info.index].link[row.language] = row.url;
            } else {
                resources.other[info.index].link[row.language] = row.url;
            }
        }

        return JSON.stringify({
            lang_keys: lang_keys,
            lang_en: lang_en,
            questions: questions,
            benefits: benefits,
            conditions: conditions,
            scenarios: scenarios,
            resources: resources
        });
    }

    async prep_version (json) {
        const version_uuid = uuidv4();
        const sth = await db.query(`
            SELECT version_num
            FROM deployments
            ORDER BY deployment_id DESC
            LIMIT 1`
        );
        let last = '0.0';
        if (sth.rows.length > 0) {
            last = sth.rows[0].version_num;
        }
        const matched = last.match(/^(\d+)\.(\d+)$/);
        let mv = 0;
        let iv = 0;
        if (matched !== null) {
            const tmv = parseInt(matched[1]);
            const tiv = parseInt(matched[2]);
            if (!isNaN(tmv) && !isNaN(tiv)) {
                mv = tmv;
                iv = tiv;
            }
        }
        ++iv;
        let version_num = mv + '.' + iv;
        return {
            num: version_num,
            uuid: version_uuid,
            data: json,
        };
    }

    async currentVersion () {
        const sth2 = await db.query(`
            SELECT version_num
            FROM deployments
            ORDER BY deployment_id DESC
            LIMIT 1`
        );
        let last = '0.0';
        if (sth2.rows.length > 0) {
            last = sth2.rows[0].version_num;
        }
        return last;
    }

    async getAll () {
        const sth = await db.query(`
            SELECT deployment_id, version_num, uuid, date_deployed
            FROM deployments
            ORDER BY deployment_id DESC`
        );
        return { ok: true, data: { all: sth.rows } };
    }

    async getOne (id, complete) {
        let add_to_select = '';
        if (complete) {
            add_to_select = ', data';
        }
        const sth = await db.query(`
            SELECT deployment_id, version_num, uuid,
                date_deployed${add_to_select}
            FROM deployments
            WHERE deployment_id = $1`,
            [ id ]
        );
        if (sth.rows.length < 1) {
            return { ok: false, data: { code: 'NOT_FOUND', status: 404 } };
        }
        return { ok: true, data: { deployment: sth.rows[0] } };
    }

    async replace (alldata, deployment) {
        const json = JSON.stringify(alldata);
        await this.expand_deployment(json);
        let version = {};
        if (deployment) {
            version = {
                num: deployment.version_num,
                uuid: deployment.uuid,
                data: json
            };
        } else {
            version = await this.prep_version(json);
        }
        await db.query(`
            INSERT INTO deployments (version_num, uuid, date_deployed, data)
            VALUES ($1, $2, NOW(), $3)`,
            [ version.num, version.uuid, version.data ]
        );
        return { ok: true, data: { version_num: version.num, version_uuid: version.uuid } };
    }

    async revert (id) {
        const get = await this.getOne(id, true);
        if (!get.ok) {
            return get;
        }
        await this.expand_deployment(get.data.deployment.data);
        return { ok: true, data: { version_num: get.version_num, version_uuid: get.uuid } };
    }

    async save () {
        const json = await this.collapse_version();
        const version = await this.prep_version(json);
        await db.query(`
            INSERT INTO deployments (version_num, uuid, date_deployed, data)
            VALUES ($1, $2, NOW(), $3)`,
            [ version.num, version.uuid, version.data ]
        );
        await db.query('COMMIT');
        return { ok: true, data: { version_num: version.num, version_uuid: version.uuid } };
    }

    async download (version, uuid) {
        const sth = await db.query(`
            SELECT version_num, uuid, date_deployed, data
            FROM deployments
            WHERE version_num = $1
                AND uuid = $2
            LIMIT 1`,
            [ version, uuid ]
        );
        if (sth.rows.length < 1) {
            return { ok: false, data: { code: 'NOT_FOUND', status: 404 } };
        }
        const row = sth.rows[0];
        const deployment = {
            version_num: row.version_num,
            uuid: row.uuid,
            date_deployed: row.date_deployed
        };
        const alldata = JSON.parse(row.data);
        return { ok: true, data: { ...alldata, deployment: deployment } };
    }

    async zipDeploy (archive, version) {
        archive.on("error", (e) => {
            throw new Error(e.message);
        });
        for (const file in version) {
            const str = JSON.stringify(version[file]);
            if (!str) {
                console.log(file + ' is not stringifying properly');
                console.log(version[file]);
                continue;
            }
            const buf = Buffer.from(str);
            const name = file + '.json';
            archive.append(buf, { name: file + '.json' });
        }
        return archive;
    }

}

module.exports = new DeployLogic();

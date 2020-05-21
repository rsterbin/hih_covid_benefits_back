const md5 = require('md5');
var fs = require('fs');

const db = require('../../database');

const prep_version = async (keys, en) => {
    const version_data = JSON.stringify({ keys: keys, en: en });
    const version_hash = md5(version_data);
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
        hash: version_hash,
        data: version_data,
    };
};

module.exports = {

    currentVersion: async () => {
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
    },

    getAll: async () => {
        const sth = await db.query(`
            SELECT version_num, hash, date_deployed
            FROM deployments
            ORDER BY deployment_id DESC`
        );
        return { ok: true, data: { all: sth.rows } };
    },

    init: async (keys, en) => {
        await db.query('BEGIN TRANSACTION');
        await db.query(`
            WITH d1 as ( DELETE FROM translations )
            DELETE FROM language_keys`
        );
        for (const key in keys) {
            const sth1 = await db.query(`
                INSERT INTO language_keys (key, section, help, markdown_allowed)
                VALUES ($1, $2, $3, $4)
                RETURNING key_id`,
                [ key, keys[key].section, keys[key].help, keys[key].markdown_allowed ]
            );
            const key_id = sth1.rows[0].key_id;
            if (key in en) {
                await db.query(`
                    INSERT INTO translations (key_id, language, translation)
                    VALUES ($1, $2, $3)`,
                    [ key_id, 'en', en[key] ]
                );
            } else {
                console.log('Missing translation for ' + key);
            }
        }
        const version = await prep_version(keys, en);
        await db.query(`
            INSERT INTO deployments (version_num, hash, date_deployed, data)
            VALUES ($1, $2, NOW(), $3)`,
            [ version.num, version.hash, version.data ]
        );
        await db.query('COMMIT');
        return { ok: true, data: { version_num: version.num, version_hash: version.hash } };
    },

    save: async () => {
        // keys
        const sth1 = await db.query(`
            SELECT key, section, help, markdown_allowed
            FROM language_keys`
        );
        const keys = {};
        for (const row of sth1.rows) {
            keys[row.key] = {
                section: row.section,
                help: row.help,
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
        const en = {};
        for (const row of sth2.rows) {
            en[row.key] = row.translation;
        }

        // create version
        const version = await prep_version(keys, en);
        await db.query(`
            INSERT INTO deployments (version_num, hash, date_deployed, data)
            VALUES ($1, $2, NOW(), $3)`,
            [ version.num, version.hash, version.data ]
        );
        await db.query('COMMIT');
        return { ok: true, data: { version_num: version.num, version_hash: version.hash } };
    },

    download: async (version, hash) => {
        const sth = await db.query(`
            SELECT version_num, hash, date_deployed, data
            FROM deployments
            WHERE version_num = $1
                AND hash = $2
            LIMIT 1`,
            [ version, hash ]
        );
        if (sth.rows.length < 1) {
            return { ok: false, data: { code: 'NOT_FOUND', status: 404 } };
        }
        const row = sth.rows[0];
        const deployment = {
            version_num: row.version_num,
            hash: row.hash,
            date_deployed: row.date_deployed
        };
        const alldata = JSON.parse(row.data);
        return { ok: true, data: { deployment: deployment, keys: alldata.keys, en: alldata.en } };
    },

    zipDeploy: async (archive, version) => {
        archive.on("error", (e) => {
            throw new Error(e.message);
        });
        for (file in version) {
            const buf = Buffer.from(JSON.stringify(version[file]));
            const name = file + '.json';
            archive.append(buf, { name: file + '.json' });
        }
        return archive;
    }

};

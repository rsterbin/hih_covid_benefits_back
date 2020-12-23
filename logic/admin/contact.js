const db = require('../../database');
const { Parser } = require('json2csv');

module.exports = {

    getRecent: async (count) => {
        const sth = await db.query(`
            SELECT raw_id, email, zip_code, submitted
            FROM raw_contacts
            ORDER BY submitted DESC
            LIMIT $1`,
            [ count ]
        );
        return { ok: true, data: { recent: sth.rows } };
    },

    getRaw: async () => {
        const sth = await db.query(`
            SELECT raw_id, email, zip_code, submitted
            FROM raw_contacts
            ORDER BY submitted DESC`
        );
        return { ok: true, data: { all: sth.rows } };
    },

    getRawCSV: async () => {
        const sth = await db.query(`
            SELECT email, zip_code
            FROM raw_contacts
            ORDER BY submitted DESC`
        );
        let fields = [ 'email', 'zip_code' ];
        let rows = [ [ 'Email', 'ZIP Code' ] ];
        for (const row of sth.rows) {
            rows.push([ row.email, row.zip_code ]);
        }
        const opts = { header: false };
        const parser = new Parser(opts);
        const csv = parser.parse(rows);
        return { ok: true, data: csv };
    }

};

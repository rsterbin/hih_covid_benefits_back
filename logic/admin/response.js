const db = require('../../database');
const { Parser } = require('json2csv');

class ResponseLogic {

    async getRecent (count) {
        const sth1 = await db.query(`
            SELECT response_id, visitor_id, submitted
            FROM responses
            ORDER BY submitted DESC
            LIMIT $1`,
            [ count ]
        );
        let info = {};
        for (const row of sth1.rows) {
            info[row.response_id] = row;
        }
        if (Object.keys(info).length < 1) {
            return { ok: true, data: { recent: [] } };
        }
        const ids = sth1.rows.map(row => row.response_id);
        let i = 0;
        const qs = sth1.rows.map(row => {
            ++i;
            return '$' + i;
        }).join(', ');
        const sth2 = await db.query(`
            SELECT response_id, question_code, answer
            FROM answers
            WHERE response_id IN (${qs})`,
            ids
        );
        for (const row of sth2.rows) {
            info[row.response_id][row.question_code] = row.answer;
        }
        const recent = Object.keys(info).sort().map((response_id) => {
            return info[response_id];
        });
        return { ok: true, data: { recent: recent } };
    }

    async getCSV() {
        const sth = await db.query(`
            SELECT q.code, t.translation AS title
            FROM questions q
            JOIN language_keys k ON (q.title_lang_key = k.key)
            JOIN translations t ON (k.key_id = t.key_id AND t.language = 'en')
            ORDER BY q.sort_order`
        );
        let fields = ['submitted'];
        let fieldNames = ['Submitted At'];
        for (const row of sth.rows) {
            fields.push(row.code);
            fieldNames.push(row.title);
        }
        const all = await this.getAll();
        if (!all.ok) {
            return all;
        }
        let rows = [ fieldNames ];
        for (const info of all.data.all) {
            let row = [];
            for (const code of fields) {
                row.push(info[code]);
            }
            rows.push(row);
        }
        const opts = { header: false };
        const parser = new Parser(opts);
        const csv = parser.parse(rows);
        return { ok: true, data: csv };
    }

    async getAll() {
        const sth1 = await db.query(`
            SELECT response_id, visitor_id, submitted
            FROM responses
            ORDER BY submitted DESC`
        );
        let info = {};
        for (const row of sth1.rows) {
            info[row.response_id] = row;
        }
        if (Object.keys(info).length < 1) {
            return { ok: true, data: { all: [] } };
        }
        const ids = sth1.rows.map(row => row.response_id);
        let i = 0;
        const qs = sth1.rows.map(row => {
            ++i;
            return '$' + i;
        }).join(', ');
        const sth2 = await db.query(`
            SELECT response_id, question_code, answer
            FROM answers
            WHERE response_id IN (${qs})`,
            ids
        );
        for (const row of sth2.rows) {
            info[row.response_id][row.question_code] = row.answer;
        }
        const all = Object.keys(info).sort().map((response_id) => {
            return info[response_id];
        });
        return { ok: true, data: { all: all } };
    }

}

module.exports = new ResponseLogic();

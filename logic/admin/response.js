const db = require('../../database');

module.exports = {

    getRecent: async (count) => {
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

};

const db = require('../../database');

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
    }

};

const db = require('../../database');

module.exports = {

    checkToken: async (token) => {
        const sth1 = await db.query(`
            DELETE FROM admin_sessions
            WHERE expires < NOW()`
        );
        const sth2 = await db.query(`
            SELECT session_id FROM admin_sessions
            WHERE token = $1 AND expires >= NOW()`,
            [ token ]
        );
        if (sth2.rows.length > 0) {
            // Refresh
            const sid = sth2.rows[0].session_id;
            const sth3 = await db.query(`
                UPDATE admin_sessions
                SET expires = NOW() + INTERVAL '1 hour'
                WHERE session_id = $1`,
                [ sid ]
            );
            return { ok: true, data: { sid: sid } };
        } else {
            return { ok: false, data: { code: 'TOKEN_INVALID', status: 403 } };
        }
    }

};

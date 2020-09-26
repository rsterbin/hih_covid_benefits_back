const { v4: uuidv4 } = require('uuid');

const db = require('../../database');

module.exports = {

    startSession: async () => {
        const token = uuidv4();
        const sth = await db.query(`
            INSERT INTO admin_sessions (token, expires)
            SELECT $1, NOW() + INTERVAL '1 hour'
            RETURNING session_id, expires`,
            [ token ]
        );
        if (sth.rows.length > 0) {
            return {
                ok: true,
                data: {
                    sid: sth.rows[0].session_id,
                    token: token,
                    expires: sth.rows[0].expires
                }
            };
        } else {
            return { ok: false, data: { code: 'SESSION_START_FAILED', status: 403 } };
        }
    },

    checkToken: async (token) => {
        console.log(token);
        const sth1 = await db.query(`
            DELETE FROM admin_sessions
            WHERE expires < NOW()`
        );
        const sth2 = await db.query(`
            SELECT session_id, expires FROM admin_sessions
            WHERE token = $1 AND expires >= NOW()`,
            [ token ]
        );
        if (sth2.rows.length > 0) {
            // Refresh
            const sid = sth2.rows[0].session_id;
            let exp = sth2.rows[0].expires;
            const sth3 = await db.query(`
                UPDATE admin_sessions
                SET expires = NOW() + INTERVAL '1 hour'
                WHERE session_id = $1
                RETURNING expires`,
                [ sid ]
            );
            if (sth3.rows.length > 0) {
                exp = sth3.rows[0].expires;
            }
            return { ok: true, data: { sid: sid, expires: exp } };
        } else {
            return { ok: false, data: { code: 'TOKEN_INVALID', status: 403 } };
        }
    },

    deleteToken: async (token) => {
        const sth = await db.query(`
            DELETE FROM admin_sessions
            WHERE token = $1
            RETURNING session_id`,
            [ token ]
        );
        if (sth.rows.length > 0) {
            const sid = sth.rows[0].session_id;
            return { ok: true, data: { sid: sid } };
        } else {
            return { ok: true, data: { sid: null } };
        }
    }

};

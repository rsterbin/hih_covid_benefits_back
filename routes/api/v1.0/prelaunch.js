const express = require('express');
const Router = require('express-promise-router');
const { v4: uuidv4 } = require('uuid');

const db = require('../../../database');
const config = require('../../../config');

const router = new Router();

// prelaunch/check POST: Check whether the prelaunch session token is valid
router.post('/check', async function(req, res, next) {
    if (typeof(req.body) !== 'object') {
        res.status(400);
        res.json({ code: 'NO_DATA', msg: 'No data was provided' });
        return;
    }
    if (!req.body.token) {
        res.status(403);
        res.json({ code: 'TOKEN_REQUIRED', msg: 'Token is required' });
        return;
    }
    const sth1 = await db.query(`
        DELETE FROM prelaunch_sessions
        WHERE expires < NOW()`
    );
    const sth2 = await db.query(`
        SELECT session_id, expires FROM prelaunch_sessions
        WHERE token = $1 AND expires >= NOW()`,
        [ req.body.token ]
    );
    if (sth2.rows.length > 0) {
        // Refresh
        const sid = sth2.rows[0].session_id;
        const sth3 = await db.query(`
            UPDATE prelaunch_sessions
            SET expires = NOW() + INTERVAL '1 day'
            WHERE session_id = $1
            RETURNING expires`,
            [ sid ]
        );
        let exp = sth2.rows[0].expires;
        if (sth3.length > 0) {
            exp = sth3.rows[0].expires;
        }
        res.json({ msg: 'Valid session', session_id: sid, expires: exp });
    } else {
        res.status(403);
        res.json({ code: 'TOKEN_INVALID', msg: 'Invalid session' });
    }
});

// prelaunch/login POST: Log in as the prelaunch user
router.post('/login', async function(req, res, next) {
    if (typeof(req.body) !== 'object') {
        res.status(400);
        res.json({ code: 'NO_DATA', msg: 'No data was provided' });
        return;
    }
    if (typeof(req.body.username) === 'undefined') {
        res.status(400);
        res.json({ code: 'USERNAME_REQUIRED', msg: 'Username is required' });
        return;
    }
    if (typeof(req.body.password) === 'undefined') {
        res.status(400);
        res.json({ code: 'PASSWORD_REQUIRED', msg: 'Password is required' });
        return;
    }
    const correct_username = config.get('prelaunch_username');
    const correct_password = config.get('prelaunch_password');
    if (req.body.username === correct_username && req.body.password === correct_password) {
        const token = uuidv4();
        const sth = await db.query(`
            INSERT INTO prelaunch_sessions (token, expires)
            SELECT $1, NOW() + INTERVAL '1 day'
            RETURNING session_id, expires`,
            [ token ]
        );
        res.json({ msg: 'Login successful', sid: sth.rows[0].session_id, token: token, expires: sth.rows[0].expires });
    } else {
        res.status(403);
        res.json({ code: 'LOGIN_INCORRECT', msg: 'Password incorrect' });
    }
});

module.exports = router;

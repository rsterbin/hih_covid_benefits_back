const express = require('express');
const Router = require('express-promise-router');
const { v4: uuidv4 } = require('uuid');

const db = require('../../../database');
const config = require('../../../config');

const router = new Router();

// admin/session/check POST: Check whether the admin session token is valid
router.post('/session/check', async function(req, res, next) {
    if (typeof(req.body) !== 'object') {
        res.status(400);
        res.json({ code: 'NO_DATA', msg: 'No data was provided' });
        return next();
    }
    if (!req.body.token) {
        res.status(403);
        res.json({ code: 'TOKEN_REQUIRED', msg: 'Token is required' });
        return next();
    }
    const sth1 = await db.query(`
        DELETE FROM admin_sessions
        WHERE expires < NOW()`
    );
    const sth2 = await db.query(`
        SELECT session_id FROM admin_sessions
        WHERE token = $1 AND expires >= NOW()`,
        [ req.body.token ]
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
        res.json({ msg: 'Valid session', session_id: sid });
    } else {
        res.status(403);
        res.json({ code: 'TOKEN_INVALID', msg: 'Invalid session' });
    }
});

// admin/session/login POST: Log in
router.post('/session/login', async function(req, res, next) {
    if (typeof(req.body) !== 'object') {
        res.status(400);
        res.json({ code: 'NO_DATA', msg: 'No data was provided' });
        return next();
    }
    if (typeof(req.body.username) === 'undefined') {
        res.status(400);
        res.json({ code: 'USERNAME_REQUIRED', msg: 'Username is required' });
        return next();
    }
    if (typeof(req.body.password) === 'undefined') {
        res.status(400);
        res.json({ code: 'PASSWORD_REQUIRED', msg: 'Password is required' });
        return next();
    }
    const correct_username = config.get('admin_username');
    const correct_password = config.get('admin_password');
    if (req.body.username === correct_username && req.body.password === correct_password) {
        const token = uuidv4();
        const sth = await db.query(`
            INSERT INTO admin_sessions (token, expires)
            SELECT $1, NOW() + INTERVAL '1 hour'`,
            [ token ]
        );
        res.json({ msg: 'Login successful', token: token });
    } else {
        res.status(403);
        res.json({ code: 'LOGIN_INCORRECT', msg: 'Password incorrect' });
    }
});

module.exports = router;

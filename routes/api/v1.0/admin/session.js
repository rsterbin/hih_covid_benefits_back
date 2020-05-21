const express = require('express');
const Router = require('express-promise-router');
const { v4: uuidv4 } = require('uuid');

const db = require('../../../../database');
const config = require('../../../../config');

const sessionLogic = require('../../../../logic/admin/session');

const router = new Router();

// admin/session/check POST: Check whether the admin session token is valid
router.post('/check', async function(req, res, next) {
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
    const check = await sessionLogic.checkToken(req.body.token);
    if (check.ok) {
        res.json({ msg: 'Valid session', session_id: check.data.sid });
    } else {
        res.status(check.data.status);
        res.json({ code: check.data.code, msg: 'Invalid session' });
    }
});

// admin/session/login POST: Log in
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

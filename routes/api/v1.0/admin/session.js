const express = require('express');
const Router = require('express-promise-router');

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
    console.log('body', req.body);
    const check = await sessionLogic.checkToken(req.body.token);
    if (check.ok) {
        res.json({
            msg: 'Valid session',
            session_id: check.data.sid,
            expires: check.data.expires
        });
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
        const started = await sessionLogic.startSession();
        if (started.ok) {
            res.json({
                msg: 'Login successful',
                sid: started.data.sid,
                token: started.data.token,
                expires: started.data.expires
            });
        } else {
            res.status(started.data.status);
            res.json({ code: started.data.code, msg: 'Session could not be ended' });
        }
    } else {
        res.status(403);
        res.json({ code: 'LOGIN_INCORRECT', msg: 'Password incorrect' });
    }
});

// admin/session/logout POST: Deletes a session token
router.post('/logout', async function(req, res, next) {
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
    const del = await sessionLogic.deleteToken(req.body.token);
    if (del.ok) {
        res.json({ msg: 'Session ended', session_id: check.data.sid });
    } else {
        res.status(check.data.status);
        res.json({ code: check.data.code, msg: 'Session could not be ended' });
    }
});

module.exports = router;

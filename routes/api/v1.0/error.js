const express = require('express');
const Router = require('express-promise-router');

const db = require('../../../database');

const router = new Router();

const API_ERROR_CODES = [
    'NO_DATA',
    'LOG_LEVEL_REQUIRED',
    'LOG_MESSAGE_REQUIRED',
    'VISITOR_ID_REQUIRED',
    'TOKEN_REQUIRED',
    'ANSWERED_REQUIRED',
    'USERNAME_REQUIRED',
    'PASSWORD_REQUIRED',
    'TOKEN_INVALID',
    'LOGIN_INCORRECT',
    'KEY_REQUIRED',
    'NOT_FOUND',
    'LANGUAGE_REQUIRED',
    'LANG_KEYS_REQUIRED',
    'EN_TRANS_REQUIRED',
    'INSERT_FAILED'
];

// error GET: What error codes are there?
router.get('/', function(req, res, next) {
    res.json({ msg: 'Here are the error codes that might happen', codes: API_ERROR_CODES });
});

// error POST: Record an error from the front end
router.post('/', async function(req, res, next) {
    if (typeof(req.body) !== 'object') {
        res.status(400);
        res.json({ code: 'NO_DATA', msg: 'No data was provided' });
        return;
    }
    if (!req.body.level) {
        res.status(400);
        res.json({ code: 'LOG_LEVEL_REQUIRED', msg: 'Log level is required' });
        return;
    }
    if (!req.body.message) {
        res.status(400);
        res.json({ code: 'LOG_MESSAGE_REQUIRED', msg: 'Log level is required' });
        return;
    }

    const context = JSON.stringify(req.body.context);
    console.log('[' + req.body.level + '] ' + req.body.message + ' -- CXT ' + context);
    if (req.body.store) {
        const sth = await db.query(`
            INSERT INTO error_log (log_level, log_message, context)
            SELECT $1, $2, $3`,
            [ req.body.level, req.body.message, context ]
        );
    }

    res.json({ msg: 'Recorded', stored: req.body.store ? true : false });
});

module.exports = router;

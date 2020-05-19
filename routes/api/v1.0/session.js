const express = require('express');
const Router = require('express-promise-router');
const { v4: uuidv4 } = require('uuid');

const db = require('../../../database');

const router = new Router();

// session/check POST: Check whether the front session token is valid
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
    if (!req.body.visitor_id) {
        res.status(403);
        res.json({ code: 'VISITOR_ID_REQUIRED', msg: 'Visitor ID is required' });
        return;
    }
    const sth1 = await db.query(`
        DELETE FROM sessions
        WHERE expires < NOW()`
    );
    const sth2 = await db.query(`
        SELECT session_id FROM sessions
        WHERE token = $1 AND visitor_id = $2 AND expires >= NOW()`,
        [ req.body.token, req.body.visitor_id ]
    );
    if (sth2.rows.length > 0) {
        // Refresh
        const sid = sth2.rows[0].session_id;
        const sth3 = await db.query(`
            UPDATE sessions
            SET expires = NOW() + INTERVAL '10 minutes'
            WHERE session_id = $1`,
            [ sid ]
        );
        res.json({ msg: 'Valid session', session_id: sid });
    } else {
        res.status(403);
        res.json({ code: 'TOKEN_INVALID', msg: 'Invalid session' });
    }
});

// session/init POST: Start a new front session
router.post('/init', async function(req, res, next) {
    if (typeof(req.body) !== 'object') {
        res.status(400);
        res.json({ code: 'NO_DATA', msg: 'No data was provided' });
        return;
    }
    if (!req.body.visitor_id) {
        res.status(403);
        res.json({ code: 'VISITOR_ID_REQUIRED', msg: 'Visitor ID is required' });
        return;
    }
    const token = uuidv4();
    const sth = await db.query(`
        INSERT INTO sessions (visitor_id, token, expires)
        SELECT $1, $2, NOW() + INTERVAL '10 minutes'`,
        [ req.body.visitor_id, token ]
    );
    res.json({ msg: 'Session initialization successful', token: token });
});

module.exports = router;

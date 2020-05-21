const express = require('express');
const Router = require('express-promise-router');

const db = require('../../../database');

const router = new Router();

// response POST: Save a quiz response
router.post('/', async function(req, res, next) {
    if (typeof(req.body) !== 'object') {
        res.status(400);
        res.json({ code: 'NO_DATA', msg: 'No data was provided' });
        return;
    }
    if (typeof(req.body.token) === 'undefined') {
        res.status(403);
        res.json({ code: 'TOKEN_REQUIRED', msg: 'You cannot save a record without a session token' });
        return;
    }
    if (!req.body.visitor_id) {
        res.status(400);
        res.json({ code: 'VISITOR_ID_REQUIRED', msg: 'Visitor ID is required' });
        return;
    }
    if (typeof(req.body.answers) !== 'object') {
        res.status(400);
        res.json({ code: 'ANSWERED_REQUIRED', msg: 'Answers are required' });
        return;
    }

    // Verify the token
    const sth1 = await db.query(`
        SELECT session_id FROM sessions
        WHERE token = $1 AND visitor_id = $2 AND expires >= NOW()`,
        [ req.body.token, req.body.visitor_id ]
    );
    if (sth1.rows.length < 1) {
        res.status(403);
        res.json({ code: 'TOKEN_INVALID', msg: 'Your session token is invalid' });
        return;
    }

    // Insert the response and answers
    await db.query('BEGIN TRANSACTION');
    const sth2 = await db.query(`
        INSERT INTO responses (visitor_id)
        VALUES ($1)
        RETURNING response_id`,
        [ req.body.visitor_id ]
    );
    const response_id = sth2.rows[0].response_id;
    for (var key in req.body.answers) {
        await db.query(`
            INSERT INTO answers (response_id, question_code, answer)
            VALUES ($1, $2, $3)`,
            [ response_id, key, req.body.answers[key] ]
        );
    }
    if (typeof(req.body.contact) === 'object' && req.body.contact.email) {
        await db.query(`
            INSERT INTO raw_contacts (email, zip_code)
            VALUES ($1, $2)`,
            [ req.body.contact.email, req.body.contact.zip ]
        );
    }
    await db.query('COMMIT');
    res.json({ msg: 'Response recorded' });
});

module.exports = router;

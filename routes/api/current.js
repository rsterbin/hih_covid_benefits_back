const express = require('express');
const Router = require('express-promise-router');

const db = require('../../database');
const config = require('../../config');

const router = new Router();

/* GET just tells you where you are */
router.get('/', function(req, res, next) {
    res.json({ msg: 'This is version 1.0 of the HIH NYC COVID Benefits API' });
});

/* POST passes the info you send to the database */
router.post('/', async function(req, res, next) {
    if (typeof(req.body) !== 'object') {
        res.status(400);
        res.json({ msg: 'No data was provided' });
        return next();
    }
    if (typeof(req.body.visitor_id) === 'undefined') {
        res.status(400);
        res.json({ msg: 'Visitor ID is required' });
        return next();
    }
    if (typeof(req.body.answers) !== 'object') {
        res.status(400);
        res.json({ msg: 'Answers are required' });
        return next();
    }
    await db.query('BEGIN TRANSACTION');
    const sth1 = await db.query(`
        INSERT INTO responses (visitor_id, env_flag)
        VALUES ($1, $2)
        RETURNING response_id`,
        [ req.body.visitor_id, config.get('env_flag') ]
    );
    const response_id = sth1.rows[0].response_id;
    for (var key in req.body.answers) {
        await db.query(`
            INSERT INTO answers (response_id, question_code, answer)
            VALUES ($1, $2, $3)`,
            [ response_id, key, req.body.answers[key] ]
        );
    }
    if (typeof(req.body.contact) === 'object' && req.body.contact.email) {
        await db.query(`
            INSERT INTO raw_contacts (email, zip_code, env_flag)
            VALUES ($1, $2, $3)`,
            [ req.body.contact.email, req.body.contact.zip, config.get('env_flag') ]
        );
    }
    await db.query('COMMIT');
    res.json({ msg: 'Cool' });
});

module.exports = router;

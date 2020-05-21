const express = require('express');
const Router = require('express-promise-router');

const sessionLogic = require('../../../../logic/admin/session');
const responseLogic = require('../../../../logic/admin/response');

const router = new Router();

// admin/responses/recent POST: get the last five responses
router.post('/recent', async function(req, res, next) {
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
    const check = await sessionLogic.checkToken(req.body.token);
    if (!check.ok) {
        res.status(check.data.status);
        res.json({ code: check.data.code, msg: 'Invalid session' });
    }
    const recent = await responseLogic.getRecent(5);
    if (!recent.ok) {
        res.status(recent.data.status);
        res.json({ code: recent.data.code, msg: 'Could not get recent responses' });
    } else {
        res.json({ msg: 'Fetched', recent: recent.data.recent });
    }
});

module.exports = router;

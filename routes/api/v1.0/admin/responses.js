const express = require('express');
const Router = require('express-promise-router');

const sessionLogic = require('../../../../logic/admin/session');
const responseLogic = require('../../../../logic/admin/response');

const router = new Router();

// admin/responses/all POST: get all responses
router.post('/all', async function(req, res, next) {
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
    const all = await responseLogic.getAll();
    if (!all.ok) {
        res.status(all.data.status);
        res.json({ code: recent.data.code, msg: 'Could not get all responses' });
    } else {
        res.json({ msg: 'Fetched', all: all.data.all });
    }
});

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

router.post('/stats/books', async function(req, res, next) {
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
    const stats = await responseLogic.getStats('books');
    if (!stats.ok) {
        res.status(stats.data.status);
        res.json({ code: stats.data.code, msg: 'Could not get on-the-books stats' });
    } else {
        res.json({ msg: 'Fetched', stats: stats.data.stats });
    }
});

router.post('/stats/type', async function(req, res, next) {
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
    const stats = await responseLogic.getStats('type');
    if (!stats.ok) {
        res.status(stats.data.status);
        res.json({ code: stats.data.code, msg: 'Could not get employee type stats' });
    } else {
        res.json({ msg: 'Fetched', stats: stats.data.stats });
    }
});

module.exports = router;

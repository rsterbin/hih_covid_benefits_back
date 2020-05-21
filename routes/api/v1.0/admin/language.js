const express = require('express');
const Router = require('express-promise-router');

const sessionLogic = require('../../../../logic/admin/session');
const languageLogic = require('../../../../logic/admin/language');

const router = new Router();

// admin/language POST: get all language keys
router.post('/', async function(req, res, next) {
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
    const all = await languageLogic.getAllKeysBySection();
    if (!all.ok) {
        res.status(all.data.status);
        res.json({ code: all.data.code, msg: 'Could not get language keys' });
    } else {
        res.json({ msg: 'Fetched', all: all.data.all });
    }
});

// admin/language/info POST: get info for a single language key
router.post('/info', async function(req, res, next) {
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
    if (!req.body.key) {
        res.status(403);
        res.json({ code: 'KEY_REQUIRED', msg: 'Language key is required' });
        return;
    }
    const check = await sessionLogic.checkToken(req.body.token);
    if (!check.ok) {
        res.status(check.data.status);
        res.json({ code: check.data.code, msg: 'Invalid session' });
    }
    const info = await languageLogic.getInfo(req.body.key);
    if (!info.ok) {
        res.status(info.data.status);
        res.json({ code: info.data.code, msg: 'Could not get language keys' });
    } else {
        res.json({ msg: 'Saved', ...info.data });
    }
});

// admin/language/save POST: save translation for a single language key
router.post('/save', async function(req, res, next) {
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
    if (!req.body.key) {
        res.status(403);
        res.json({ code: 'KEY_REQUIRED', msg: 'Language key is required' });
        return;
    }
    if (!req.body.language) {
        res.status(403);
        res.json({ code: 'LANGUAGE_REQUIRED', msg: 'Language code is required' });
        return;
    }
    const check = await sessionLogic.checkToken(req.body.token);
    if (!check.ok) {
        res.status(check.data.status);
        res.json({ code: check.data.code, msg: 'Invalid session' });
    }
    const save = await languageLogic.saveTranslation(req.body.key, req.body.language, req.body.translation);
    if (!save.ok) {
        res.status(save.data.status);
        res.json({ code: save.data.code, msg: 'Could not save translation' });
    } else {
        res.json({ msg: 'Fetched', ...save.data });
    }
});

module.exports = router;

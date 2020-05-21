const express = require('express');
const Router = require('express-promise-router');
const archiver = require('archiver');

const sessionLogic = require('../../../../logic/admin/session');
const deployLogic = require('../../../../logic/admin/deploy');

const router = new Router();

// admin/deploy POST: retrieve all deploys
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
    const all = await deployLogic.getAll();
    if (!all.ok) {
        res.status(all.data.status);
        res.json({ code: all.data.code, msg: 'Could not fetch all deploys' });
    } else {
        res.json({ msg: 'Done', all: all.data.all });
    }
});

// admin/deploy/init POST: receive initial settings
router.post('/init', async function(req, res, next) {
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
    if (!req.body.keys) {
        res.status(400);
        res.json({ code: 'LANG_KEYS_REQUIRED', msg: 'Language keys are required' });
        return;
    }
    if (!req.body.en) {
        res.status(400);
        res.json({ code: 'EN_TRANS_REQUIRED', msg: 'English translations are required' });
        return;
    }
    const check = await sessionLogic.checkToken(req.body.token);
    if (!check.ok) {
        res.status(check.data.status);
        res.json({ code: check.data.code, msg: 'Invalid session' });
    }
    const init = await deployLogic.init(req.body.keys, req.body.en);
    if (!init.ok) {
        res.status(init.data.status);
        res.json({ code: init.data.code, msg: 'Could not initialize admin database' });
    } else {
        res.json({ msg: 'Done', version: init.data.version_num, hash: init.data.version_hash });
    }
});

// admin/deploy/save POST: create a deployment and return its url for download
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
    const check = await sessionLogic.checkToken(req.body.token);
    if (!check.ok) {
        res.status(check.data.status);
        res.json({ code: check.data.code, msg: 'Invalid session' });
    }
    const save = await deployLogic.save();
    if (!save.ok) {
        res.status(save.data.status);
        res.json({ code: init.save.code, msg: 'Could not create deployment' });
    } else {
        const vnum = save.data.version_num;
        const hash = save.data.version_hash;
        const url = '/admin/deploy/download/' + vnum + '/' + hash;
        res.json({ msg: 'Done', version: vnum, hash: hash });
    }
});

module.exports = router;

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
    if (!req.body.id) {
        res.status(400);
        res.json({ code: 'ID_REQUIRED', msg: 'ID is required' });
        return;
    }
    const check = await sessionLogic.checkToken(req.body.token);
    if (!check.ok) {
        res.status(check.data.status);
        res.json({ code: check.data.code, msg: 'Invalid session' });
    }
    const one = await deployLogic.getOne(req.body.id);
    if (!one.ok) {
        res.status(one.data.status);
        res.json({ code: one.data.code, msg: 'Could not fetch deployment' });
    } else {
        res.json({ msg: 'Done', deployment: one.data.deployment });
    }
});

// admin/deploy/revert POST: revert to a specific version ID
router.post('/revert', async function(req, res, next) {
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
    if (!req.body.id) {
        res.status(400);
        res.json({ code: 'ID_REQUIRED', msg: 'ID is required' });
        return;
    }
    const check = await sessionLogic.checkToken(req.body.token);
    if (!check.ok) {
        res.status(check.data.status);
        res.json({ code: check.data.code, msg: 'Invalid session' });
    }
    const revert = await deployLogic.revert(req.body.id);
    if (!revert.ok) {
        res.status(revert.data.status);
        res.json({ code: revert.data.code, msg: 'Could not revert admin database' });
    } else {
        res.json({ msg: 'Done', version: revert.data.version_num, uuid: revert.data.version_uuid });
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
        const uuid = save.data.version_uuid;
        res.json({ msg: 'Done', version: vnum, uuid: uuid });
    }
});

module.exports = router;

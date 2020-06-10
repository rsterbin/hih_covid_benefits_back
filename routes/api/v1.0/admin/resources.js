const express = require('express');
const Router = require('express-promise-router');

const sessionLogic = require('../../../../logic/admin/session');
const resourcesLogic = require('../../../../logic/admin/resources');

const router = new Router();

// admin/resources POST: get all the resources
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
    const resources = await resourcesLogic.getAll();
    if (!resources.ok) {
        res.status(resources.data.status);
        res.json({ code: resources.data.code, msg: 'Could not get resources' });
    } else {
        res.json({ msg: 'Fetched', resources: resources.data.all });
    }
});

// admin/resources/info/:id POST: get the resource matching this ID
router.post('/info/:id', async function(req, res, next) {
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
        return;
    }
    const found = await resourcesLogic.getDetails(req.params.id);
    if (!found.ok) {
        res.status(found.data.status);
        res.json({ code: found.data.code, msg: 'Could not get resource' });
        return;
    } else {
        res.json({ msg: 'Fetched', resource: found.data.resource });
    }
});

// admin/resources/save/ POST: save a resource
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
        return;
    }
    const save = await resourcesLogic.saveResource(req.body.info);
    if (!save.ok) {
        res.status(save.data.status);
        res.json({ code: save.data.code, msg: 'Could not save resource' });
    } else {
        res.json({ msg: 'Saved', id: save.data.info.id });
    }
});

// admin/resources/:code POST: get the resources for a benefit (or pass "common" to get any not associated with a benefit
router.post('/:code', async function(req, res, next) {
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
    const resources = await resourcesLogic.getAll(req.params.code);
    if (!resources.ok) {
        res.status(resources.data.status);
        res.json({ code: resources.data.code, msg: 'Could not get resources' });
    } else {
        res.json({ msg: 'Fetched', resources: resources.data.all });
    }
});

module.exports = router;

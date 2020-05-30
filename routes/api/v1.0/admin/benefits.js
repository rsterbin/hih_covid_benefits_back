const express = require('express');
const Router = require('express-promise-router');

const sessionLogic = require('../../../../logic/admin/session');
const benefitsLogic = require('../../../../logic/admin/benefits');

const router = new Router();

// admin/benefits POST: get the benefits
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
    const benefits = await benefitsLogic.getAll();
    if (!benefits.ok) {
        res.status(benefits.data.status);
        res.json({ code: benefits.data.code, msg: 'Could not get benefits' });
    } else {
        res.json({ msg: 'Fetched', benefits: benefits.data.all });
    }
});

// admin/benefits/:code/scenarios POST: get the scenarios and conditions for this benefit
router.post('/:code/scenarios', async function(req, res, next) {
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
    const ben = await benefitsLogic.getBenefitDetails(req.params.code);
    if (!ben.ok) {
        res.status(ben.data.status);
        res.json({ code: ben.data.code, msg: 'Could not get benefit' });
        return;
    }
    const cond = await benefitsLogic.getConditions(req.params.code);
    if (!cond.ok) {
        res.status(cond.data.status);
        res.json({ code: cond.data.code, msg: 'Could not get conditions' });
        return;
    }
    const scen = await benefitsLogic.getScenarios(req.params.code);
    if (!scen.ok) {
        res.status(scen.data.status);
        res.json({ code: scen.data.code, msg: 'Could not get scenarios' });
    } else {
        res.json({
            msg: 'Fetched',
            benefit: ben.data.benefit,
            conditions: cond.data.conditions,
            scenarios: scen.data.scenarios
        });
    }
});

// admin/benefits/:code/scenario/:id POST: get the benefit and scenariomatching this code and ID
router.post('/:code/scenario/:id', async function(req, res, next) {
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
    const ben = await benefitsLogic.getBenefitDetails(req.params.code);
    if (!ben.ok) {
        res.status(ben.data.status);
        res.json({ code: ben.data.code, msg: 'Could not get benefit' });
        return;
    }
    const scen = await benefitsLogic.getScenario(req.params.code, req.params.id);
    if (!scen.ok) {
        res.status(scen.data.status);
        res.json({ code: scen.data.code, msg: 'Could not get scenario' });
    } else {
        res.json({
            msg: 'Fetched',
            benefit: ben.data.benefit,
            scenario: scen.data.scenario
        });
    }
});

module.exports = router;

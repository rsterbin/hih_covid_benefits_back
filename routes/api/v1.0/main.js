const express = require('express');
const Router = require('express-promise-router');

const errorRouter = require('./error.js');
const sessionRouter = require('./session.js');
const responseRouter = require('./response.js');
const adminRouter = require('./admin');
const prelaunchRouter = require('./prelaunch.js');

const router = new Router();

// index GET: What is this?
router.get('/', function(req, res, next) {
    res.json({ msg: 'This is version 1.0 of the HIH NYC COVID Benefits API' });
});

router.use('/error', errorRouter);
router.use('/session', sessionRouter);
router.use('/response', responseRouter);
router.use('/admin', adminRouter);
router.use('/prelaunch', prelaunchRouter);

module.exports = router;

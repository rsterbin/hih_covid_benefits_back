const express = require('express');
const Router = require('express-promise-router');

const sessionRouter = require('./session.js');
const responsesRouter = require('./responses.js');
const contactsRouter = require('./contacts.js');
const languageRouter = require('./language.js');
const benefitsRouter = require('./benefits.js');
const resourcesRouter = require('./resources.js');
const deployRouter = require('./deploy.js');

const router = new Router();

router.use('/session', sessionRouter);
router.use('/responses', responsesRouter);
router.use('/contacts', contactsRouter);
router.use('/language', languageRouter);
router.use('/benefits', benefitsRouter);
router.use('/resources', resourcesRouter);
router.use('/deploy', deployRouter);

module.exports = router;

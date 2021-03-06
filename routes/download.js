const express = require('express');
const Router = require('express-promise-router');
const archiver = require('archiver');
const { DateTime } = require('luxon');

const sessionLogic = require('../logic/admin/session');
const deployLogic = require('../logic/admin/deploy');
const responseLogic = require('../logic/admin/response');
const contactLogic = require('../logic/admin/contact');

const router = new Router();

// Download a deploy file
router.get('/deploy/:version_num/:version_hash/:token', async function (req, res, next) {
    const check = await sessionLogic.checkToken(req.params.token);
    if (!check.ok) {
        res.status(check.data.status);
        res.json({ code: check.data.code, msg: 'Invalid session' });
    }
    const vnum = req.params.version_num;
    const vhash = req.params.version_hash
    const download = await deployLogic.download(vnum, vhash);
    if (!download.ok) {
        res.status(download.data.status);
        res.json({ code: download.save.code, msg: 'Could not download deployment' });
    } else {
        const archive = archiver('zip');
        res.attachment(`hnct_${vnum}.zip`);
        archive.pipe(res);
        const archiveMaterials = await deployLogic.zipDeploy(archive, download.data)
        archiveMaterials.finalize();
    }
});

// Download all responses into a CSV file
router.get('/responses/all/:token', async function (req, res, next) {
    const check = await sessionLogic.checkToken(req.params.token);
    if (!check.ok) {
        res.status(check.data.status);
        res.json({ code: check.data.code, msg: 'Invalid session' });
    }
    const download = await responseLogic.getCSV();
    if (!download.ok) {
        res.status(download.data.status);
        res.json({ code: download.save.code, msg: 'Could not download responses' });
    } else {
        const now = DateTime.local();
        const filename = 'hnct-' + now.toISODate() + '-responses.csv';
        res.attachment(filename);
        res.status(200).send(download.data);
    }
});

// Download raw contacts into a CSV file
router.get('/contacts/raw/:token', async function (req, res, next) {
    const check = await sessionLogic.checkToken(req.params.token);
    if (!check.ok) {
        res.status(check.data.status);
        res.json({ code: check.data.code, msg: 'Invalid session' });
    }
    const download = await contactLogic.getRawCSV();
    if (!download.ok) {
        res.status(download.data.status);
        res.json({ code: download.save.code, msg: 'Could not download raw contacts' });
    } else {
        const now = DateTime.local();
        const filename = 'hnct-' + now.toISODate() + '-raw-contacts.csv';
        res.attachment(filename);
        res.status(200).send(download.data);
    }
});

module.exports = router;

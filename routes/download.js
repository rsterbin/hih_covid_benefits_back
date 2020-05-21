const express = require('express');
const Router = require('express-promise-router');
const archiver = require('archiver');

const sessionLogic = require('../logic/admin/session');
const deployLogic = require('../logic/admin/deploy');

const router = new Router();

// Download a deploy file
router.get('/:version_num/:version_hash/:token', async function (req, res, next) {
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

module.exports = router;

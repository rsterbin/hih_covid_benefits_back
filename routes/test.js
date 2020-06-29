const express = require('express');
const Router = require('express-promise-router');

const router = new Router();

// Log the request headers
router.get('/headers', function (req, res, next) {
    console.log(JSON.stringify(req.headers));
    res.json({ msg: 'Request headers have been logged', ok: true });
});

module.exports = router;

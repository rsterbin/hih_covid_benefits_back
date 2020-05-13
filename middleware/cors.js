var express = require('express');

var corsHeaders = function(req, res, next) {
    const prod_origin = 'https://hih-covid-benefits-back.herokuapp.com';
    const dev_origin = 'http://localhost:3000';
    let origin = req.get('origin');
    let ok = true;
    if (origin !== dev_origin && origin !== prod_origin) {
        origin = prod_origin;
        ok = false;
    }
    res.header('Access-Control-Allow-Origin', origin);
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization, Content-Length, X-Requested-With');

    // intercept OPTIONS method
    if ('OPTIONS' == req.method) {
        res.sendStatus(200);
    }
    else {
        if (ok) {
            next();
        } else {
            res.status(403);
            res.json({ msg: 'Access is restricted' });
        }
    }
};

module.exports = corsHeaders;

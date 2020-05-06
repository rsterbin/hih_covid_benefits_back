var express = require('express');
var router = express.Router();

/* GET just tells you where you are */
router.get('/', function(req, res, next) {
    res.json({ msg: 'This is version 1.0 of the HIH NYC COVID Benefits API' });
});

/* POST passes the info you send over to Google Sheets */
router.post('/', function(req, res, next) {
    if (typeof(req.body) !== 'object') {
        throw new Error('No data was provided');
        return;
    }
    if (typeof(req.body.visitor_id) === 'undefined') {
        throw new Error('Visitor ID is required');
        return;
    }
    if (typeof(req.body.answers) !== 'object') {
        throw new Error('Answers are required');
        return;
    }
    const info = JSON.parse(process.env.GOOGLE_AUTH);
    console.log(info);
    res.json({ msg: 'Nah, not actually done, but I think we can parse it' });
});

module.exports = router;

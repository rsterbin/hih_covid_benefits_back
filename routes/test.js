var express = require('express');
var router = express.Router();

/* TODO: Event bounce: scrapers get social media headers, real people get forwarded to the mobilize site */
router.get('/event/:code', function(req, res, next) {
    console.log('user agent on "' + req.params.code + '" bounce is: ', req.get('User-Agent'));
    const ua = req.get('User-Agent');
    const fw = 'http://www.example.com/';
    if (ua.match('facebook')) {
        console.log('facebook scraping "' + req.params.code + '"');
        res.render('test-event', {
            title: 'This is a test',
            description: 'This is a description',
            image: 'https://www.nydomesticworkbenefits.org/images/test.jpg',
            fw_link: fw
        });
    } else {
        console.log('not facebook visiting "' + req.params.code + '"');
        res.redirect(302, fw);
    }
});

module.exports = router;


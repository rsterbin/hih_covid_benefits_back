var express = require('express');
var router = express.Router();

/* TODO: Event bounce: scrapers get social media headers, real people get forwarded to the mobilize site */
router.get('/event/:code', function(req, res, next) {
    console.log('user agent on event bounce is: ', req.get('User-Agent'));
    const ua = req.get('User-Agent');
    const fw = 'http://www.example.com/';
    if (ua.match('facebook')) {
        res.render('event', {
            title: 'This is a test',
            description: 'This is a description',
            image: 'https://www.nydomesticworkbenefits.org/images/test.jpg',
            fw_link: fw
        });
    } else {
        res.redirect(302, fw);
    }
});

module.exports = router;


var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'HIH NYC COVID-19 Benefits Tool API' });
});

module.exports = router;

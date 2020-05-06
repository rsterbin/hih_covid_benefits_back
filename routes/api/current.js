var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.json({ msg: 'This is version 1.0 of the HIH NYC COVID Benefits API' });
});

module.exports = router;

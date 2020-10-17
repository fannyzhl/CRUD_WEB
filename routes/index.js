const express = require('express')

let router = express.Router()

router.use('/user', require('./user'));
router.use('/product', require('./product')); 
router.use('/car', require('./car'));

module.exports = router;


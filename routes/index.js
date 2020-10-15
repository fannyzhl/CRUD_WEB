const express = require('express');
const { route } = require('./user');

let router = express.Router()

router.use('/user', require('./user'));
router.use('/product', require('./product')); 
router.use('/car', require('./car'));
router.use('/file', require('./file') );


module.exports = router;
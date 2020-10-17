 // call all the required packages
const express = require('express')
const bodyParser= require('body-parser')
const multer = require('multer');
const dbimg = require ('pg')
const queries = require('./../utils/queries').file;
const db = require('./../utils/db');

//CREATE EXPRESS APP
let router = express.Router();
// ROUTES
router.get('/',function(req,res){
    res.sendFile(__dirname + '/index.html');
   
  });

  router.use(bodyParser.urlencoded({extended: true}))

 
// SET STORAGE
const url = "myFile-"+Date.now();
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'uploads')
    },
    filename: function (req, file, cb) {
      cb(null, url)
    }
  })
const upload = multer({ storage: storage })


  
  router.post('/upload', upload.single('myFile'), (req, res, next) => {
    
    const file = req.file
    if (!file) {
      const error = new Error('Please upload a file')
      error.httpStatusCode = 400
      return next(error)
    }
      res.send(file)
      console.log("comenzando");
      db.task('insert-image', async task => {
        console.log("aqui");
        await task.any(queries.Agregarimagen, [url])
    })

    
  })

  module.exports = router
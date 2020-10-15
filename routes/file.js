const express = require ('express');
const multer = require ('multer'); 
const storage = express.storage;

let router = express.Router();


const upload = multer({
    storage: storage,
    fileFilter: (req, file, cb) => {
        if (file.mimetype == "image/png" || file.mimetype == "image/jpg" || file.mimetype == "image/jpeg" || file.mimetype == "image/gif") {
            cb(null, true);
        } else {
            cb(null, false);
            return cb(new Error('Allowed only .png, .jpg, .jpeg and .gif'));
        }
    }
});

router.get('/', (req, res) => {
    res.sendFile('./public/subir.html', {root: __dirname})
})

router.post('/subir', upload.single('archivo'), (req,res) => {
    console.log(req.file)
    res.send("archivo se subio correctamente")
    console.log(req.file, req.body)
})





module.exports = router;

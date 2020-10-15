const multer = require ('express') (),
multer = require ('multer');
/* upload = multer({ storage: storage }) */

storage=multer.diskStorage({
    destination: (req, file, cb) =>{
        cb(null, './archivos')
    },
    filename: (req, file, cb) =>{
        cb(null, file.originalname)
    }
});



module.exports = multer;


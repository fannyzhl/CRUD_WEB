const db = require('./../utils/db');
const userQueries = require('./../utils/queries').user;

module.exports.isNew = (req, res, next) => {
    verificarData(req.body).then((data) => {
        if(data) 
            res.status(200).send({token: service.createToken(data), response: 'Todo con exito'});
        else 
            next();             
    }).catch((error) => {
        console.log(error)
        res.status(500).send({ response: 'Intentalo de nuevo'})
    })
}

async function verificarData(params) {
    return db.task('signup-task', async t => {
        const email = await t.oneOrNone(userQueries.BuscarCorreo, [params.user_email]);
        if (!email) {
            const username = await t.oneOrNone(userQueries.Buscar, [params.user_username]);
            if (username) {       
                return res.status(409).send({response:'Ya existe el nombre de usuario'})
            }
        }else {
            return res.status(409).send({response: 'Correo electronico ya registrado'})
        }
        return false
    }).catch((error) => {
        throw error
    });
}


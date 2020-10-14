const express = require('express');
const db = require('./../helpers/db');
const cartQueries = require('./../helpers/queries').car;
const isLoggedIn = require('./../middlewares/isLogged').conectado;

let router = express.Router();

// Add product to user's cart
router.post('/agregar', isLoggedIn, (req, res) => {
    db.task('insert-product-car', async task => {
        let {user_id,product_id, quantify} = await req.body;
        let cantidad = await task.one(cartQueries.CantidadProducto, [product_id])
        let chequeo = await task.oneOrNone(cartQueries.ChequeoProducto, [product_id, user_id])
        console.log(chequeo);
        if(!chequeo){
            if(cantidad.quantify >= quantify ){
                if(quantify > 0){
                    await task.none(cartQueries.AgregarCarrito, [product_id, user_id,quantify])
                }else{
                    res.status(422).send({response:'No se pueden ingresar productos negativos'});   
                }
            }else{
                res.status(422).send({response:'No hay suficiente cantidad en el inventario'}); 
            }
        }else{
            console.log("aquii");
            if(cantidad.quantify >= quantify + chequeo.quantify){
                await task.none(cartQueries.ActualizarCantidad, [quantify + chequeo.quantify, product_id, user_id,])
            }else{
                res.status(422).send({
                    response:'Ya has agregado agregado '+chequeo.quantify+' de este producto al carrito y no hay suficiente cantidad en el inventario para agregar mas'
                });
            }  

        }
        
    })
    .then((data) => {
        res.status(200).send({response:'Se agrego el producto al carrito'});
    }).catch((error) => {
        console.log(error);
        res.status(500).send({ response: 'No se pudo agregar el producto al carrito' })
    })
});

// Delete product from user's cart
router.post('/borrar', isLoggedIn, (req,res) => {
    let { user_id, product_id } = req.body;
    db.none(cartQueries.BorrarCarrito, [user_id,product_id])
    .then(() => {    
        res.status(200).send({ response: 'Se borro el producto del carrito' })
    }).catch((error) => {
        console.log(error)
        res.status(500).send({ response: 'No se pudo borrar el producto del carrito' })
    })
})

// TODO : Filtrar por existencia
// Get user's cart items
router.get('/leer', isLoggedIn, (req,res) => {
    let userId = req.body.user_id;
    db.manyOrNone(cartQueries.CarritoProducto, [userId])
    .then((items) => {
        res.status(200).send({response:items});
    }).catch((error) => {
        res.status(500).send({response:'No se pudieron leer los productos del carrito'});
    })
})

module.exports = router
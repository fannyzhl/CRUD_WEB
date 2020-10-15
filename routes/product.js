const express = require('express');
const db = require('./../utils/db');
const productQueries = require('./../utils/queries').product;
const isLoggedIn = require('./../middlewares/isLogged').conectado;

let router = express.Router();

router.post('/agregar', isLoggedIn,  (req,res) => {
    db.task('insert-product', async task => {
    const newProduct = await task.none(productQueries.AgregarProducto, [
        req.body.user_id, req.body.product_name, req.body.product_des, req.body.product_prices, req.body.quantify])
    }).then(() => {
        res.status(200).send({
            status:200,
            response: 'Producto Agregado'
        });
    }).catch((error) => {
        console.log(error)
        res.status(500).send({
            status:500,
            response: 'No se pudo agregar el producto'
        })
    })
});

router.post('/borrar', isLoggedIn, (req,res) => {
    let userId = req.body.user_id;
    let productId = req.body.product_id;
    db.tx('delete-product', async t => {
        //await t.none(productQueries.BorrarCarrito, [productId]);
        await t.none(productQueries.BorrarProducto, [userId, productId]);
    }).then((data) => {
        res.status(200).send({
            status: 200,
            response: 'Se borro el producto'
        })
    }).catch((error) => {
        console.log(error)
        res.status(500).send({
            status: 500,
            response: 'No se pudo borrar el producto'
        })
    })
});

router.post('/modificar', isLoggedIn, (req,res) => {
    db.none(productQueries.ModificarProducto, [
        req.body.product_name, req.body.product_des, req.body.product_prices, req.body.quantify, req.body.user_id, req.body.product_id])
    .then(() => {
        res.status(200).send({status:200, response:'Se pudo modificar el producto'});
    }).catch((error) => {
        console.log(error)
        res.status(500).send({status:500, response:'No se pudo modificar el producto'});
    })
})

router.get('/buscadorProducto', (req, res) => {
    db.any(productQueries.BuscarProducto, [`%${req.params.product_name}%`])
    .then((data) => {
        res.status(200).send({
            status:200,
            response:data
            //list: data
        })
    }).catch((error) => {        
        res.status(403).send({
            status:403,
            response: 'No se encontro ningun producto'
        })
    })
});

router.get('/buscarProducto', (req,res) => {
    db.any(productQueries.UsuarioProductos,[req.body.user_id])
    .then((data) => {
        res.status(200).send({
            status:200,
            respone:data
        })
    }).catch((error) => {
        console.log(error)
        res.status(403).send({
            status:403,
            response: 'No se encontro ningun producto'
        })
    })
});

module.exports = router
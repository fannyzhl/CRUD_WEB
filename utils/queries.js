module.exports.user = {
    BuscarCorreo: 'SELECT user_email FROM users WHERE user_email = $1',
    Buscar: 'SELECT user_username, user_email, user_id FROM users WHERE user_username = $1',
    BuscarUsuario: "SELECT user_password FROM users WHERE user_username = $1",
    AgregarUsuario: 'INSERT INTO users (user_username,user_password,user_email, type_id) VALUES ($1,$2,$3,2) RETURNING user_id',
    AgregarCarrito: 'INSERT INTO shopping_product (user_id, product_id) VALUES ($1, $2)',
}

module.exports.product = {
    BuscarProducto: 'SELECT product_id, product_name, product_des, product_prices, user_username, quantify FROM product as a JOIN users as b ON b.user_id = a.user_id  WHERE product_name LIKE $1',
    UsuarioProductos: 'SELECT product_id, product_name, product_des, product_prices, quantify FROM product  WHERE user_id = $1',
    AgregarProducto: 'INSERT INTO product(user_id, product_name, product_des, product_prices, quantify) VALUES ($1, $2, $3, $4, $5) ',
    BorrarProducto: 'DELETE FROM product WHERE user_id = $1 AND product_id = $2',
    ModificarProducto: 'UPDATE product SET product_name= $1, product_des= $2, product_prices= $3, quantify= $4 WHERE user_id= $5 AND product_id = $6'
}

module.exports.car = {
    CarritoProducto: 'SELECT a.product_id, product_name, product_des, product_prices, a.quantify FROM shopping_product as a JOIN product as b ON b.product_id = a.product_id WHERE a.user_id = $1',
    AgregarCarrito: 'INSERT INTO shopping_product(user_id, product_id, quantify) VALUES($1, $2, $3)',
    BorrarCarrito: 'DELETE FROM shopping_product WHERE user_id = $1 AND product_id = $2',
    CantidadProducto:'SELECT quantify FROM product WHERE product_id=$1',
    ChequeoProducto:'SELECT *FROM shopping_product WHERE product_id=$1 AND user_id=$2',
    ActualizarCantidad:'UPDATE shopping_product SET quantify = $1 WHERE product_id=$2 AND user_id=$3 '

}

module.exports.file = {
    Agregarimagen: 'INSERT INTO imagen(img_url) VALUES ($1)'
}


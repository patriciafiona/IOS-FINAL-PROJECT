'use strict';

module.exports = function(app) {
    var todoList = require('./controller');

    var express = require('express');
    app.use( express.static( "public" ) );  //get photos in public folder

    app.route('/')
        .get(todoList.index);

    app.route('/products/')
        .get(todoList.products);

    app.route('/products/:cat_name')
        .get(todoList.productsByCategory);

    app.route('/products/:cat_name/:tag_name')
        .get(todoList.productsByCategoryAndTag);

    app.route('/product_details/:product_id')
        .get(todoList.productsById);

    app.route('/productFavorite/')
        .get(todoList.productsByManyId);

};
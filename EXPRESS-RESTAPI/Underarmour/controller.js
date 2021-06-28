'use strict';

var response = require('./res');
const pool = require('./conn');

exports.index = function(req, res) {
    response.ok("Hello from the Node JS RESTful side! This is API for Underarmour Apps...", res)
};

exports.products = function(req, res) {
   pool.query('Select products.*, categories.name AS category_name, '+
                    'tags.name AS tag_name, photos.photo_01, photos.photo_02, '+
                    'photos.photo_03, photos.photo_04, photos.photo_05 from products '+
                    'INNER JOIN categories ON products.category = categories.id '+
                    'INNER JOIN tags ON products.tag = tags.id '+
                    'INNER JOIN photos ON products.id = photos.product_id '+
                    'ORDER BY products.updated_at DESC', function(err, rows, fields) {
        if(err){
            console.log(err)
        } else{
            response.ok('products', rows, res)
        }

  });
}

exports.productsByCategory = function(req, res) {
     pool.query('Select products.*, categories.name AS category_name, '+
                    'tags.name AS tag_name, photos.photo_01, photos.photo_02, '+
                    'photos.photo_03, photos.photo_04, photos.photo_05 from products '+
                    'INNER JOIN categories ON products.category = categories.id '+
                    'INNER JOIN tags ON products.tag = tags.id '+
                    'INNER JOIN photos ON products.id = photos.product_id '+
                    'WHERE categories.name= ? '+
                    'ORDER BY products.updated_at DESC', [req.params.cat_name], function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok('productsByCategory', rows, res)
        }
    });
};

exports.productsByCategoryAndTag = function(req, res) {
     pool.query('Select products.*, categories.name AS category_name, '+
                    'tags.name AS tag_name, photos.photo_01, photos.photo_02, '+
                    'photos.photo_03, photos.photo_04, photos.photo_05 from products '+
                    'INNER JOIN categories ON products.category = categories.id '+
                    'INNER JOIN tags ON products.tag = tags.id '+
                    'INNER JOIN photos ON products.id = photos.product_id '+
                    'WHERE categories.name = ? AND tags.name = ? '+
                    'ORDER BY products.updated_at DESC', [req.params.cat_name,  req.params.tag_name], function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok('productsByCategoryAndTag', rows, res)
        }
    });
};

exports.productsById = function(req, res) {
    pool.query('Select products.*, categories.name AS category_name, '+
                    'tags.name AS tag_name, photos.photo_01, photos.photo_02, '+
                    'photos.photo_03, photos.photo_04, photos.photo_05 from products '+
                    'INNER JOIN categories ON products.category = categories.id '+
                    'INNER JOIN tags ON products.tag = tags.id '+
                    'INNER JOIN photos ON products.id = photos.product_id '+
                    'WHERE products.id = ? ', [req.params.product_id], 
                    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok('productsById', rows, res)
        }
    });
};

exports.productsByManyId = function(req, res) {

    const ids = req.query.ids; 
    const idsArr = ids.split(',')
    pool.query('Select products.*, categories.name AS category_name, '+
                    'tags.name AS tag_name, photos.photo_01, photos.photo_02, '+
                    'photos.photo_03, photos.photo_04, photos.photo_05 from products '+
                    'INNER JOIN categories ON products.category = categories.id '+
                    'INNER JOIN tags ON products.tag = tags.id '+
                    'INNER JOIN photos ON products.id = photos.product_id '+
                    'WHERE products.id IN (?) ', [idsArr], 
                    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok('productsByManyId', rows, res)
        }
    });
};
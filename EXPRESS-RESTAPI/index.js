var express = require('express'),
    app = express(),
    port = process.env.PORT || 3000,
    bodyParser = require('body-parser'),
    controller = require('./Underarmour/controller');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var routes = require('./Underarmour/routes');
routes(app);

app.listen(port);
console.log('Hello Admin, RESTful API server started on: ' + port);
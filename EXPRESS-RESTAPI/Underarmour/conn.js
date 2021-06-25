var mysql = require('mysql');
var pool  = mysql.createPool({
    host: "192.168.64.2",
    user: "PatriciaFiona",
    password: "12345",
    database: "underarmour"
});

module.exports = pool;
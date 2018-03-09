var faker = require("faker");
var mysql = require("mysql");

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'jwerderits',
    database: 'join_us'
});


//query
// var q = 'SELECT * FROM users';

// connection.query(q,function(error, results, fields){
//     if(error) throw error;
//     console.log(results);
// });


//Inserting using object
// var person = {email: faker.internet.email()};

// connection.query('INSERT INTO users SET ?', person,function(error, results, fields){
//     if(error) throw error;
//     console.log(results);
// });


//Mulitple Insert
// var data = [];

// for (var i = 0; i < 500; i++) {
//     data.push([
//         faker.internet.email(),
//         faker.date.past()
//     ]);
// }

// var q = 'INSERT INTO users (email, created_at) VALUES ?';

// connection.query(q, [data], function(err, results){
//     if(err) throw err;
//     console.log(results);
// })







connection.end();
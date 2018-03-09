var express = require("express");
var app = express();
var mysql = require("mysql");
var bodyParser = require("body-parser");

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));


var connection = mysql.createConnection({
    host: 'localhost',
    user: 'jwerderits',
    database: 'join_us'
});


app.get("/", function(req,res){
    //find the count of users in the DB
    var q = 'SELECT COUNT(*) as count FROM users';
    connection.query(q, function(err, results){
        if (err) throw err;
        var count = results[0].count;
        res.render("home", {count: count});
        //res.send("There are " + count + " number of users");
    });
});


app.post("/register", function(req,res){
    var person = {email: req.body.email};
    connection.query('INSERT INTO users SET?', person,function(error, results){
        console.log(results);
        if(error) throw error;
        res.redirect("/");
    });
});

// app.post('/register', function(req,res){
//  var person = {email: req.body.email};
//  connection.query('INSERT INTO users SET ?', person, function(err, result) {
//  console.log(err);
//  console.log(result);
//  res.redirect("/");
//  });
// });


app.get("/joke", function(req,res){
    res.send("this is where the joke goes");
});

app.get("/random_num", function(req,res){
    var num = Math.floor(Math.random() * 10) + 1;    
    res.send('Your lucky number is ' + num); 
});

app.listen(8080, function(){
    console.log('Server running on 8080');
});
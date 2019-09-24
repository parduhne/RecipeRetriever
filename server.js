'use strict';

//Load express module with `require` directive
// From https://blog.logrocket.com/setting-up-a-restful-api-with-node-js-and-postgresql-d96d6fc892d8/
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 8000

// Set up DB connection
const knex = require('knex')({
  client: 'postgresql',
  connection: {
    debug: 'true',
    host: process.env.DB_HOST,
    port: 5432,
    user: process.env.DB_USER,
    password: process.env.DB_PWD,
    database: process.env.DB_NAME,
    multipleStatements: true
  }
});

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

//Define request response in root URL (/)
// http://zetcode.com/javascript/knex/
app.get('/', function (req, res) {
  knex.from('Users').select("*")
	  .then((rows) => res.json( {info: rows }));
})


// An API to execute a SQL file on the system
// Ex: http://192.168.99.100:8000/rawapply?file=PGT-schema.sql
// Ex: http://192.168.99.100:8000/rawapply?file=PGT-data.sql
// Ex: http://192.168.99.100:8000/rawapply?file=PGT-data_Josh.sql
app.get('/rawapply', function (req, res) {
  if(req.query.file){
    var fs = require('fs');
    var sql = fs.readFileSync(req.query.file).toString();
    knex.raw(sql).then( function(resp){
          console.log(resp);
          res.json( {success: resp });
    }).catch( function( err ){
        console.log(err);
        res.json( {error: err });
    })
  }else{
    res.json( {info: 0 });
  }
})



//Launch listening server on port 8000
app.listen(port, function () {
  console.log('app listening on port 8000!')
})
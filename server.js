'use strict';

const Pool = require('pg').Pool
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 8000

// Set up DB connection
// const knex = require('knex')({
//   client: 'postgresql',
//   connection: {
//     debug: 'true',
//     host: process.env.DB_HOST,
//     port: 5432,
//     user: process.env.DB_USER,
//     password: process.env.DB_PASS,
//     database: process.env.DB_NAME,
//     multipleStatements: true
//   }
// });

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASS,
  port: 5432,
})

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)


app.get('/', function (request, response) {
  const selectUsersQuery = "Select * from Users"
  pool
    .query(selectUsersQuery)
    .then(results => {
      response.json({info: results.rows})
    })
    .catch(e => console.error(e.stack))
})

// An API to execute a SQL file on the system
// Ex: http://192.168.99.100:8000/rawapply?file=PGT-schema.sql
// Ex: http://192.168.99.100:8000/rawapply?file=PGT-data.sql
// Ex: http://192.168.99.100:8000/rawapply?file=PGT-data_Josh.sql
app.get('/rawapply', function (req, res) {
  if(req.query.file){
    var fs = require('fs');
    var sql = fs.readFileSync(req.query.file).toString();
    pool
      .query(sql)
      .then(queryRes => {
        console.log(queryRes);
        res.json ({success: queryRes})
      })
  }else{
    res.json( {info: 0 });
  }
})



//Launch listening server on port 8000
app.listen(port, function () {
  console.log('app listening on port 8000!')
})
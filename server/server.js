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

app.get('/users', function (request, response) {
  // 192.168.99.100:8000/users?insert_name=Emma&insert_email=emma@gmail.com&insert_password=emma
  // TODO: Does not verify the email isn't associated with a user
  // TODO: Password is in plaintext, change to hashed.
  // TODO: Split this into a GET and POST
  if(request.query.insert_name && request.query.insert_email && request.query.insert_password){
    const insertUserQuery = "INSERT INTO Users (name, email, password) VALUES ($1, $2, $3)";
    const insertUserData = [request.query.insert_name, request.query.insert_email, request.query.insert_password]
    pool
      .query(insertUserQuery, insertUserData)
      .then(results => {
        response.json({info: results.rows})
      })
      .catch(e => console.error(e.stack))
  }else{ // Return back all users without passwords
    const listUserQuery = "SELECT Id, Name, Email from Users;";
    pool
      .query(listUserQuery)
      .then(results => {
        response.json(results.rows)
      })
      .catch(e => console.error(e.stack))
  }
})

// /measurements - get all with id

// /ingredients -insert- name, description, measurementID
//                        don't do if similar
// /ingredients -query- name and or description- return ingredientID
//                        similar
//                        begins with
//
//app.get('/ingredients')

// /pantry -accept- UserID, IngredientID, Size, Units
// /pantry -query-  UserID, - returns all items in pantry for that user

// /recipes -accept- Name, Description - list of ingredients (ingredientID, size, units).

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

app.route('/ingredients')
  .get(function (request, response){
    if (request.query.name){
      const statement = 'SELECT ID, Name, Description, MeasurementID from Ingredients where lower(Name) LIKE $1'
      const name = [request.query.name.toLowerCase() + '%']
      pool
        .query(statement, name)
        .then(results => {
          response.json(results.rows)
        })
        .catch(e => console.error(e.stack))
    } else {
      response.status(400).json({'ErrorMessage' :'Query not provided'})
    }
    
  })
  .post(function (request, response){
    response.json(request)
  })
  .put(function (request, response){
    response.json(request)
  })

//Launch listening server on port 8000
app.listen(port, function () {
  console.log('app listening on port 8000!')
})

//require("./insert.js")
'use strict';

const Pool = require('pg').Pool
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 8000

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


app.post('/ingredients', function (request, response) {
	if(request.query.name &&
	request.query.description &&
	request.query.MeasurementID){
	  const insertIngredientsQuery = "IF EXISTS (SELECT * FROM Ingredients WHERE Name = $1 and Description = $2) UPDATE Ingredients SET (Name = $1, Description = $2, MeasurementID = '$3) WHERE Name= $1
		ELSE INSERT INTO Ingredients (Name, Description, MeasurementID) values ($1, $2, $3)"
	  const insertIngredientsData = [request.query.name, request.query.description, request.query.MeasurementID]
	  pool
	    .query(insertIngredientsQuery, insertIngredientsData)
	    .then(results => {
	      response.json({info: results.rows})
	    })
	    .catch(e => console.error(e.stack))
	 }
	 else{

	 }

})


app.get('/ingredients', function (request, response) {
	if(request.query.name &&
	request.query.description){
	  const getIngredientsQuery = "SELECT id FROM Ingredients where name = $1 and description = $2"
	  const getIngredientsData = [request.query.name, request.query.description]
	  pool
	    .query(getIngredientsQuery, getIngredientsData)
	    .then(results => {
	      response.json({info: results.rows})
	    })
	    .catch(e => console.error(e.stack))
	}
	else{

	}

})
/*
app.post('/recipes', function (request, response) {
	if(request.query.name &&
	request.query.description){
	  const insertRecipesQuery = "IF EXISTS (SELECT * FROM Recipes WHERE Name = $1 and Description = $2) UPDATE Recipes SET (Name = $1, Description = $2) WHERE Name= $1
		ELSE INSERT INTO Recipes (Name, Description) values ($1, $2)"
	  const insertRecipesData = [request.query.name, request.query.description]

    for(var i; i < .lenght;i++){
      const insertIngredientsRecipesQuery = "INSERT INTO IngredientsRecipes (IngredientID, RecipeID, Size) values (
      SELECT ID FROM Ingredients WHERE Name =  and Description = ,
      SELECT ID FROM Recipes WHERE Name = $1 and Description = $2, $3)"
      const insertIngredientsRecipesData = [request.query.IngredientID, request.query.RecipeID, request.query.Size]
    }

	  pool
	    .query(insertRecipesQuery, insertRecipesData)
	    .then(results => {
	      response.json({info: results.rows})
	    })
	    .catch(e => console.error(e.stack))
	 }
	 else{

	 }

})
*/
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

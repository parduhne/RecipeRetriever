module.exports.init = function(app,pool){

  /*
  app.post('/recipes', function (request, response) {
    if(request.query.name &&
    request.query.description){
      const insertRecipesQuery = "IF EXISTS (SELECT * FROM Recipes WHERE Name = $1 and Description = $2) UPDATE Recipes SET (Name = $1, Description = $2) WHERE Name= $1 ELSE INSERT INTO Recipes (Name, Description) values ($1, $2)"
      const insertRecipesData = [request.query.name, request.query.description]

      for(var i; i < .lenght;i++){
        const insertIngredientsRecipesQuery = "INSERT INTO IngredientsRecipes (IngredientID, RecipeID, Size) values (SELECT ID FROM Ingredients WHERE Name =  and Description = , SELECT ID FROM Recipes WHERE Name = $1 and Description = $2, $3)"
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

  app.get('/recipes', function (request, response) {
    if(request.query.id){ // Give back the recipe with that ID including ingredients
      /*const insertRecipesQuery = "IF EXISTS (SELECT * FROM Recipes WHERE Name = $1 and Description = $2) UPDATE Recipes SET (Name = $1, Description = $2) WHERE Name= $1 ELSE INSERT INTO Recipes (Name, Description) values ($1, $2)"
      const insertRecipesData = [request.query.name, request.query.description]

      for(var i; i < .lenght;i++){
        const insertIngredientsRecipesQuery = "INSERT INTO IngredientsRecipes (IngredientID, RecipeID, Size) values (SELECT ID FROM Ingredients WHERE Name =  and Description = , SELECT ID FROM Recipes WHERE Name = $1 and Description = $2, $3)"
        const insertIngredientsRecipesData = [request.query.IngredientID, request.query.RecipeID, request.query.Size]
      }

      pool
        .query(insertRecipesQuery, insertRecipesData)
        .then(results => {
          response.json({info: results.rows})
        })
        .catch(e => console.error(e.stack))
        */
     }else{ // Return all recipes with ids
      const getAllRecipesQuery = "SELECT id,name,description FROM recipes"
      pool
        .query(getAllRecipesQuery)
        .then(results => {
          response.json({info: results.rows})
        })
        .catch(e => console.error(e.stack))
     }

  })

}
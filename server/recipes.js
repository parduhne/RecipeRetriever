module.exports.init = function(app,pool){

  
  app.post('/recipes', function (request, response) {
    if(request.query.name &&
    request.query.description &&
    request.query.ingredients){
      // TODO: Why do a set if it already there?
      const insertRecipesQuery = `INSERT INTO Recipes (Name, Description) values ($1, $2)`
      const insertRecipesData = [request.query.name, request.query.description]

      console.error(request.query.ingredients.length)

      let ingredients = JSON.parse(request.query.ingredients)
      for(var i = 0; i < ingredients.length; i++){
        console.error(ingredients[i])
        //const insertIngredientsRecipesQuery = "INSERT INTO IngredientsRecipes (IngredientID, RecipeID, Size) values (SELECT ID FROM Ingredients WHERE Name =  and Description = , SELECT ID FROM Recipes WHERE Name = $1 and Description = $2, $3)"
        //const insertIngredientsRecipesData = [request.query.IngredientID, request.query.RecipeID, request.query.Size]
      }

      pool
        .query(insertRecipesQuery, insertRecipesData)
        .then(results => {
          response.json({info: results.rows})
        })
        .catch(e => console.error(e.stack))
     }
     

  })
  

  app.get('/recipes', function (request, response) {
    if(request.query.id){ // Give back the recipe with that ID including ingredients
      const getIngredientsQuery = `SELECT size,ingredientid 
                                   FROM ingredientsrecipes WHERE recipeid = $1`
      const getIngredientsData = [request.query.id]

      pool
        .query(getIngredientsQuery, getIngredientsData)
        .then(results => {
          response.json({info: results.rows})
        })
        .catch(e => console.error(e.stack))
        
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
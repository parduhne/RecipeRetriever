module.exports.init = function(app,pool){

  // Kristians example of get and post in one 'function'
  /*
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
  */

  app.post('/ingredients', function (request, response) {
    if(request.query.name &&
    request.query.description &&
    request.query.MeasurementID){
      const insertIngredientsQuery = "IF EXISTS (SELECT * FROM Ingredients WHERE Name = $1 and Description = $2) UPDATE Ingredients SET (Name = $1, Description = $2, MeasurementID = '$3) WHERE Name= $1 ELSE INSERT INTO Ingredients (Name, Description, MeasurementID) values ($1, $2, $3)"
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
    }if(request.query.name){
        const getIngredientsQuery = "SELECT name FROM Ingredients lower(Name) LIKE $1"
        const getIngredientsData = [request.query.name + '%']
        pool
          .query(getIngredientsQuery, getIngredientsData)
          .then(results => {
            response.json({info: results.rows})
          })
          .catch(e => console.error(e.stack))
      }
    else{
      const getIngredientsQuery = "SELECT name FROM Ingredients"
      const getIngredientsData = [request.query.name]
      pool
        .query(getIngredientsQuery, getIngredientsData)
        .then(results => {
          response.json({info: results.rows})
        })
        .catch(e => console.error(e.stack))
    }

  })

}
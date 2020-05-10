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
    if(request.body.name &&
    request.body.description &&
    request.body.MeasurementID){
      response.json({info:"success"})
      // const checkIngredientsQuery = `SELECT EXISTS (SELECT * FROM Ingredients WHERE
      //                                 Name = $1 and Description = $2)`
      // const checkIngredientsData = [request.body.name,request.body.description]
      // const insertIngredientsQuery = `INSERT INTO ingredients (name,description,measurementid) values($1,$2,$3)`
      // const updateIngredientsQuery = 'UPDATE ingredients SET name=$1, description=$2, measurementid=$3 WHERE name=$1'
      // const insertIngredientsData = [request.body.name, request.body.description, request.body.MeasurementID]
      //
      // pool
      //   .query(checkIngredientsQuery,checkIngredientsData)
      //   .catch(e=> console.error(e.stack))
      //   .then(results =>{
      //     if(results.rows == 0 ){
      //       pool
      //         .query(insertIngredientsQuery, insertIngredientsData)
      //         .catch(e => console.error(e.stack))
      //         .then(results => {
      //           response.json({info: "success on insert"})
      //           console.log('success ')
      //         })
      //     }else if (results.rows == 1) {
      //       pool
      //         .query(updateIngredientsQuery, insertIngredientsData)
      //         .catch(e => console.error(e.stack))
      //         .then(results => {
      //           response.json({info: "success on update"})
      //           console.log('success ')
      //         })
      //     }
      //   })
     }
     else{
       console.log('nope')
       response.json({info: "Did not get anything"})
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
    }if(request.query.id){
        const getIngredientsQuery = "SELECT name FROM Ingredients where id = $1"
        const getIngredientsData = [request.query.id]
        pool
          .query(getIngredientsQuery, getIngredientsData)
          .then(results => {
            response.json({info: results.rows})
          })
          .catch(e => console.error(e.stack))
    }else{
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

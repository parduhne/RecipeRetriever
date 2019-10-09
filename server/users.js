
module.exports.init = function(app, pool){

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

}
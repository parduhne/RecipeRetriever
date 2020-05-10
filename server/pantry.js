module.exports.init = function(app,pool){

    app.post('/pantry', function (request, response){
        // retrieving ingredient
        const ingredientID = request.body.IngredientID
        const userID = request.body.UserID
        const size = request.body.Size
        if (userID && ingredientID && size){
            const insertStmnt = "INSERT INTO Pantry (UserID, IngredientID, Size) VALUES ($1, $2, $3)";
            const insertData = [ingredientID, userID, size]
            console.log(insertData)
            pool
                .query(insertStmnt, insertData)
                .then(response.status(200))
                .catch(e => console.error(e.stack))
        }else{
            response.status(400).json({'ErrorMessage' :'Ingredient information not provided'})
        }
    })

    app.get('/pantry/:userID', function(request, response){
        const userID = request.params.userID
        if (userID){
            const query = 'select p.ingredientid as IngredientID, i.name as IngredientName, p.size as Size, u.name as UnitName from pantry p left join ingredients i on p.ingredientid = i.id left join units u on i.measurementid = u.measurementid where userid = $1 and u.conversionfactor = 1'
            const queryData = [userID]
            pool
                .query(query, queryData)
                .then(results =>{
                    response.json(results.rows)
                })
                .catch(e => console.error(e.stack))
        }else{
            response.status(400).json({'ErrorMessage' :'Invalid user id provided'})
        }
    })
}

module.exports.init = function(app,pool){
    app.post('/pantry', function (request, response){
        const ingredientID = request.params.ingredientID
        console.log(request.body)
        response.json(request.body)
        // retrieving ingredient 

        // inserting ingredient


    })

    
}
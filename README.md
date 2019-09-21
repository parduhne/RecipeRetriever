# RecipeRetriever

~~## To build:  ~~
~~docker-compose build basic~~

The docker-compose command below creates 3 docker containers:
1. postgres database (port 5432)
2. adminer DB admin system (port 8080)
3. Node.js server (port 8000, debug 9229)

## To run:
`docker volume create nodemodules`

`docker-compose up`

## adminer
Go to http://<docker ip>:8080

Open the docker-compose.yml file to find the user/pass/db.  The host is postgres.
Once logged in you can load the `PGT-schema.sql` or `PGT-schema-wdata.sql` files to populate the DB.  
Each will drop the current tables.  TODO: work this into a script to run.  TODO: find where the DB state is!
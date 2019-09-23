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
Go to http://docker ip:8080

Open the docker-compose.yml file to find the user/pass/db.  The host is postgres.
Once logged in, select the recipe-retriever db and import the `PGT-schema.sql` file, then import the `PGT-data.sql` file to populate the DB with sample data. 
`PGT-schema.sql` will drop all current tables and delete all data.  

## postgres Note

postgres is set to save its data files (state) to the `database` directory here.  If no directory is present it will create one and fill it (verify this in Windows). If the directory is present with files other than DB files, the postgres server will start to do a database initialization but fail.  Then every 30 seconds it will try again, and fail.  The solution is to delete all files in the database directory, or completely delete the directory.

During the database initialization stage it will create the `recipe-retriever` database, since it was mentioned in the `docker-compose.yml` file.
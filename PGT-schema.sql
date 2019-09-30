-- This should be run with the db selected

DROP TABLE IF EXISTS Measurements CASCADE;
DROP TABLE IF EXISTS Recipes CASCADE;
DROP TABLE IF EXISTS Ingredients CASCADE;
DROP TABLE IF EXISTS IngredientsRecipes CASCADE;
DROP TABLE IF EXISTS Pantry CASCADE;
DROP TABLE IF EXISTS Units CASCADE;
DROP TABLE IF EXISTS Users CASCADE;

CREATE TABLE public.Measurements (
    ID serial NOT NULL PRIMARY KEY,
    Name character varying NOT NULL
) WITH (oids = false);


CREATE TABLE public.Recipes (
    ID serial NOT NULL PRIMARY KEY,
    Name character varying NOT NULL,
    Description text
) WITH (oids = false);

CREATE TABLE public.Users (
    ID serial NOT NULL PRIMARY KEY,
    Name character varying NOT NULL,
    Email text NOT NULL,
    Password text NOT NULL
) WITH (oids = false);


CREATE TABLE public.Ingredients (
    ID serial NOT NULL PRIMARY KEY,
    Name character varying NOT NULL,
    Description text,
    MeasurementID integer,
    CONSTRAINT Ingredients_MeasurementID_fkey FOREIGN KEY (MeasurementID) REFERENCES Measurements(ID) NOT DEFERRABLE
) WITH (oids = false);



CREATE TABLE public.IngredientsRecipes (
    ID serial NOT NULL PRIMARY KEY,
    RecipeID integer NOT NULL,
    Size real NOT NULL,
    IngredientID integer NOT NULL,
    CONSTRAINT IngredientsRecipes_IngredientID_fkey FOREIGN KEY (IngredientID) REFERENCES Ingredients(ID) NOT DEFERRABLE,
    CONSTRAINT IngredientsRecipes_RecipeID_fkey FOREIGN KEY (RecipeID) REFERENCES Recipes(ID) NOT DEFERRABLE
) WITH (oids = false);






CREATE TABLE public.Pantry (
    UserID integer NOT NULL,
    IngredientID integer NOT NULL,
    Size real NOT NULL,
    CONSTRAINT Pantry_IngredientID_fkey FOREIGN KEY (IngredientID) REFERENCES Ingredients(ID) NOT DEFERRABLE,
    CONSTRAINT Pantry_UserID_fkey FOREIGN KEY (UserID) REFERENCES Users(ID) NOT DEFERRABLE
) WITH (oids = false);






CREATE TABLE public.Units (
    ID serial NOT NULL PRIMARY KEY,
    Name character varying NOT NULL,
    ConversionFactor real,
    MeasurementID integer,
    CONSTRAINT Units_MeasurementID_fkey FOREIGN KEY (MeasurementID) REFERENCES Measurements(ID) NOT DEFERRABLE
) WITH (oids = false);


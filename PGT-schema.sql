-- Adminer 4.7.3 PostgreSQL dump

\connect "recipe-retriever";

DROP TABLE IF EXISTS "Ingredients";
CREATE TABLE "public"."Ingredients" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Description" text,
    "MeasurementID" integer,
    CONSTRAINT "Ingredients_ID" PRIMARY KEY ("ID"),
    CONSTRAINT "Ingredients_MeasurementID_fkey" FOREIGN KEY ("MeasurementID") REFERENCES "Measurements"("ID") NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "IngredientsRecipes";
CREATE TABLE "public"."IngredientsRecipes" (
    "ID" integer NOT NULL,
    "RecipeID" integer NOT NULL,
    "Size" real NOT NULL,
    CONSTRAINT "IngredientsRecipes_ID" PRIMARY KEY ("ID"),
    CONSTRAINT "IngredientsRecipes_RecipeID_fkey" FOREIGN KEY ("RecipeID") REFERENCES "Recipes"("ID") NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "Measurements";
CREATE TABLE "public"."Measurements" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL,
    CONSTRAINT "Measurements_ID" PRIMARY KEY ("ID")
) WITH (oids = false);


DROP TABLE IF EXISTS "Pantry";
CREATE TABLE "public"."Pantry" (
    "UserID" integer NOT NULL,
    "IngredientID" integer NOT NULL,
    "Size" real NOT NULL,
    CONSTRAINT "Pantry_IngredientID_fkey" FOREIGN KEY ("IngredientID") REFERENCES "Ingredients"("ID") NOT DEFERRABLE,
    CONSTRAINT "Pantry_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES "Users"("ID") NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "Recipes";
CREATE TABLE "public"."Recipes" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Description" text,
    CONSTRAINT "Recipes_ID" PRIMARY KEY ("ID")
) WITH (oids = false);


DROP TABLE IF EXISTS "Units";
CREATE TABLE "public"."Units" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL,
    "ConversionFactor" real,
    "MeasurementID" integer,
    CONSTRAINT "Units_ID" PRIMARY KEY ("ID"),
    CONSTRAINT "Units_MeasurementID_fkey" FOREIGN KEY ("MeasurementID") REFERENCES "Measurements"("ID") NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "Users";
CREATE TABLE "public"."Users" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Email" text NOT NULL,
    "Password" text NOT NULL,
    CONSTRAINT "Users_ID" PRIMARY KEY ("ID")
) WITH (oids = false);


-- 2019-09-21 02:04:25.448149+00
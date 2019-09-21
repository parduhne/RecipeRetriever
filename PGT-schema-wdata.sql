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

INSERT INTO "Ingredients" ("ID", "Name", "Description", "MeasurementID") VALUES
(0,	'water',	'Pure water',	1),
(1,	'vodka',	'Only the best vodka will do.',	1),
(2,	'chocolate sauce',	'Hersheys',	1);

DROP TABLE IF EXISTS "IngredientsRecipes";
CREATE TABLE "public"."IngredientsRecipes" (
    "ID" integer NOT NULL,
    "RecipeID" integer NOT NULL,
    "Size" real NOT NULL,
    "IngredientID" integer NOT NULL,
    CONSTRAINT "IngredientsRecipes_ID" PRIMARY KEY ("ID"),
    CONSTRAINT "IngredientsRecipes_IngredientID_fkey" FOREIGN KEY ("IngredientID") REFERENCES "Ingredients"("ID") NOT DEFERRABLE,
    CONSTRAINT "IngredientsRecipes_RecipeID_fkey" FOREIGN KEY ("RecipeID") REFERENCES "Recipes"("ID") NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "IngredientsRecipes" ("ID", "RecipeID", "Size", "IngredientID") VALUES
(0,	0,	1.5,	0),
(1,	0,	0.5,	1),
(2,	0,	2,	2);

DROP TABLE IF EXISTS "Measurements";
CREATE TABLE "public"."Measurements" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL,
    CONSTRAINT "Measurements_ID" PRIMARY KEY ("ID")
) WITH (oids = false);

INSERT INTO "Measurements" ("ID", "Name") VALUES
(0,	'Dry'),
(1,	'Wet'),
(2,	'Count');

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

INSERT INTO "Recipes" ("ID", "Name", "Description") VALUES
(0,	'SpikedHersheys',	'This likely tastes horrible.');

DROP TABLE IF EXISTS "Units";
CREATE TABLE "public"."Units" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL,
    "ConversionFactor" real,
    "MeasurementID" integer,
    CONSTRAINT "Units_ID" PRIMARY KEY ("ID"),
    CONSTRAINT "Units_MeasurementID_fkey" FOREIGN KEY ("MeasurementID") REFERENCES "Measurements"("ID") NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "Units" ("ID", "Name", "ConversionFactor", "MeasurementID") VALUES
(0,	'Cup',	1,	0),
(1,	'Tbsp',	16,	0),
(2,	'oz',	1,	1),
(3,	'shot',	1.5,	1);

DROP TABLE IF EXISTS "Users";
CREATE TABLE "public"."Users" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL,
    "Email" text NOT NULL,
    "Password" text NOT NULL,
    CONSTRAINT "Users_ID" PRIMARY KEY ("ID")
) WITH (oids = false);

INSERT INTO "Users" ("ID", "Name", "Email", "Password") VALUES
(0,	'bob',	'bob@gmail.com',	'bob'),
(1,	'Greg',	'greg@gmail.com',	'greg'),
(2,	'Mary',	'mary@gmail.com',	'mary');

-- 2019-09-21 02:17:06.944757+00

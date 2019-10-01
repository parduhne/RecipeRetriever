
-- Remove all data from all tables since the insert statements below contain id numbers.
-- Cascade will also remove rows if a foreign key is used.
-- Resets the serial (autoincrement) so works afterward.
TRUNCATE IngredientsRecipes CASCADE;
TRUNCATE Ingredients CASCADE;
TRUNCATE Units CASCADE;
TRUNCATE Users CASCADE;
TRUNCATE Recipes CASCADE;
TRUNCATE Measurements CASCADE;
TRUNCATE Pantry CASCADE;

INSERT INTO Measurements (ID, Name) VALUES
(0, 'Dry'),
(1, 'Wet'),
(2, 'Count');

ALTER SEQUENCE Measurements_ID_seq RESTART WITH 3;

INSERT INTO Recipes (ID, Name, Description) VALUES
(0, 'SpikedHersheys',   'This likely tastes horrible.');

ALTER SEQUENCE Recipes_ID_seq RESTART WITH 1;

INSERT INTO Users (ID, Name, Email, Password) VALUES
(0, 'bob',  'bob@gmail.com',    'bob'),
(1, 'Greg', 'greg@gmail.com',   'greg'),
(2, 'Mary', 'mary@gmail.com',   'mary');

ALTER SEQUENCE Users_ID_seq RESTART WITH 3;

INSERT INTO Units (ID, Name, ConversionFactor, MeasurementID) VALUES
(0, 'Cup',  1,  0),
(1, 'Tbsp', 16, 0),
(2, 'oz',   1,  1),
(3, 'shot', 1.5,    1);

ALTER SEQUENCE Units_ID_seq RESTART WITH 4;

INSERT INTO Ingredients (ID, Name, Description, MeasurementID) VALUES
(0,	'water',	'Pure water',	1),
(1,	'vodka',	'Only the best vodka will do.',	1),
(2,	'chocolate sauce',	'Hersheys',	1);

ALTER SEQUENCE Ingredients_ID_seq RESTART WITH 3;


INSERT INTO IngredientsRecipes (ID, RecipeID, Size, IngredientID) VALUES
(0,	0,	1.5,	0),
(1,	0,	0.5,	1),
(2,	0,	2,	2);

ALTER SEQUENCE IngredientsRecipes_ID_seq RESTART WITH 3;

INSERT INTO Pantry (UserID, Size, IngredientID) VALUES
(0,	1.5,	0),
(0,	0.5,	1),
(0,	1,	2);


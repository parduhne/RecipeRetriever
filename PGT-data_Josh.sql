
TRUNCATE "IngredientsRecipes" CASCADE;
TRUNCATE "Ingredients" CASCADE;
TRUNCATE "Units" CASCADE;
TRUNCATE "Users" CASCADE;
TRUNCATE "Recipes" CASCADE;
TRUNCATE "Measurements" CASCADE;


INSERT INTO "Measurements" ("ID", "Name") VALUES
(0, 'Dry'),
(1, 'Wet'),
(2, 'Count');

INSERT INTO "Recipes" ("ID", "Name", "Description") VALUES
(0,  'Gin Sonic', 'A sonic made with gin'), -- line 5
(1,  'Haileys Comet', 'A frutiy drink'), -- line 21
(2,  'Sugar baby', 'Watermelon drink'), -- line 37
(3,  'Hennessy ginger', 'Ginger drink'), -- line 674
(4,  'Hennessy jalapina', 'spicy alcohol?'), -- line 703
(5,  'Botanical bees knees', 'sweet tea based drink'), -- line 723
(6,  'Rosemary mezcal negroni', 'Its got alcohol in it, what more do you need'), -- line 746
(7,  '1928 Sea breeze', 'cocktail'), -- line 752
(8,  'Santa teresa 1796 ', 'rum drink'), -- line 819
(9,  'Tequila sunrise', 'Tequila'); -- line 832


INSERT INTO "Users" ("ID", "Name", "Email", "Password") VALUES
(0, 'bob',  'bob@gmail.com',    'bob'),
(1, 'Greg', 'greg@gmail.com',   'greg'),
(2, 'Mary', 'mary@gmail.com',   'mary');

INSERT INTO "Units" ("ID", "Name", "ConversionFactor", "MeasurementID") VALUES
(0,  'Cup', 1, 0),
(1,  'Tablespoon', 16, 0),
(2,  'US_Fl.oz', 1, 1),
(3,  'Shot', 1.5, 1),
(4,  'Drop', 0.0017, 1),
(5,  'Smidgen', 0.00062, 0),
(6,  'Pinch', 0.0013, 0),
(7,  'Dash', 0.0026, 0),
(8,  'Saltspoon', 0.0052, 0),
(9,  'Scruple', 0.0052, 0),
(10, 'Coffeespoon', .01, 0),
(11, 'Fluid dram', 0.125, 1),
(12, 'Teaspoon', .021, 0),
(13, 'Dessertspoon', .042, 0),
(14, 'Wineglass', 2, 1),
(15, 'US_Gill', 4, 1),
(16, 'Teacup', 4, 1),
(17, 'US_Pint', 16, 1),
(18, 'US_Quart', 32, 1),
(19, 'Pottle', 64, 1),
(20, 'US_Gallon', 128, 1),
(21, 'Barspoon', .021, 0);



INSERT INTO "Ingredients" ("ID", "Name", "Description", "MeasurementID") VALUES
(0,	 'Water',	'Pure water',	1),
(1,	 'Vodka',	'Only the best vodka will do.',	1),
(2,	 'Roku gin',	'Liquor',	1),
(3,  'Club soda', 'This stuff is groos bubbly water', 1),
(4,  'Tonic water', 'Fancy water', 1),
(5,  'Peach-infused bourbon', 'Peach bourbon', 1),
(6,  'Pimms blackberry and elderflower liquor', 'Huh', 1),
(7,  'Giffard orgeat', 'Sweetner syrup', 1),
(8,  'Fresh lemon juice', 'Lemon juice', 1),
(9,  'Organic honey', 'honey', 1),
(10, 'Large seedless watermelon', 'watermelon', 0),
(11, 'Bourbon', 'Liquor', 1),
(12, 'Fennel-infused Cocchi Americano', 'Bitter liquor', 1),
(13, 'Hennessy V.S. cognac', 'alcohol', 1),
(14, 'Ginger ale', 'Ginger soda', 1),
(15, 'Jalapeno slice', 'Jalapeno slices', 2),
(16, 'Pineapple juice', 'Pineapple juice', 1),
(17, 'Chamomile tea bags', 'Chamomile tea', 2),
(18, 'Ketel One Botanical Peach & Orange Blossom vodka ', 'frutiy vodka', 1),
(19, 'Honey', 'Honey', 1),
(20, 'Mezcal', 'Mexican alcohol', 1),
(21, 'Sweet vermouth', 'vermouth', 1),
(22, 'Rosemary-infused Campari', 'rosemary stuff', 1),
(23, 'Gordons gin', 'Gin', 1),
(24, 'Homeade grenadine', 'grenadine', 1),
(25, 'Fresh pink grapefruit juice', 'grapefruit juice', 1),
(26, 'Santa Teresa 1796 rum', 'rum', 1),
(27, 'Demerara syrup', 'sweetner', 1),
(28, 'Angostura bitters', 'spice', 2),
(29, 'Espolon reposada tequila', 'tequila', 1),
(30, 'Fresh Cara Cara orange juice', 'oragne juice', 1),
(31, 'Spiced grenadine', 'grenadine', 1);






INSERT INTO "IngredientsRecipes" ("ID", "RecipeID", "Size", "IngredientID") VALUES
-- Gin Sonic
(0,	0,	1.5,	2),
(1,	0,	2.25,	3),
(2,	0,	2.25,	4),

-- Hailey's comet
(3, 1, 1, 5),
(4, 1, 0.75, 6),
(5, 1, 0.75, 7),
(6, 1, 0.75, 8),
(7, 1, 1, 9),

-- Sugar baby
(8, 2, 1, 10),
(9, 2, 1, 11),
(10, 2, 0.5, 12),

-- Hennessy ginger
(11, 3, 1.5, 13),
(12, 3, 3.5, 14),

-- Hennessy jalapina
(13, 4, 2, 15),
(14, 4, 1.5, 13),
(15, 4, 3, 16),

-- Botanical bees knees
(16, 5, 2, 17),
(17, 5, 2, 18),
(18, 5, 0.75, 8),
(19, 5, 1, 19),

-- Rosemary mezcal negroni
(20, 6, 1.25, 20),
(21, 6, 1, 21),
(22, 6, 1, 22),

-- 1928 Sea breeze
(23, 7, 2, 23),
(24, 7, 0.25, 24),
(25, 7, 3, 25),

-- Santa teresa 1796 
(26, 8, 1.5, 26),
(27, 8, 0.33, 27),
(28, 8, 4, 28),

-- Tequila Sunrise
(29, 9, 1.5, 29),
(30, 9, 3, 30),
(31, 9, 0.25, 31);



-- 2019-09-21 02:17:06.944757+00

------------------ CRAFTING DATA ----------------------


-----------------------
-- CRAFTING RECIPES
-----------------------
INSERT INTO crafting_recipes (recipe_id, item_id, output_quantity) VALUES
(1, 1, 3),   
(2, 4, 10),  
(3, 2, 1),   
(4, 5, 1);   


------------------------------
-- CRAFTING REQUIREMENTS
------------------------------
INSERT INTO crafting_requirements (requirement_id, recipe_id, item_id, required_quantity) VALUES
(101, 1, 4, 5),   
(102, 1, 2, 1),  
(103, 2, 4, 5),
(104, 3, 3, 1),   
(105, 4, 3, 1),
(106, 4, 2, 2);



-------------------------
-- CRAFTED ITEMS LOG
------------------------
INSERT INTO crafted_items_log (crafted_id, player_id, recipe_id, crafted_at) VALUES
(1, 1, 1, TO_TIMESTAMP('2147-03-12 14:20:10', 'YYYY-MM-DD HH24:MI:SS')),
(2, 3, 2, TO_TIMESTAMP('2147-03-11 18:03:21', 'YYYY-MM-DD HH24:MI:SS')),
(3, 4, 3, TO_TIMESTAMP('2147-03-10 20:14:55', 'YYYY-MM-DD HH24:MI:SS')),
(4, 5, 4, TO_TIMESTAMP('2147-03-12 21:03:10', 'YYYY-MM-DD HH24:MI:SS'));



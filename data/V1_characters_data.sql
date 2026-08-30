------------------------ CHARACTERS -------------------------------------

------------------------------ CHARACTERS ------------------------------
INSERT INTO characters (character_id, player_id, hero_id, character_level, character_xp, character_created_at) VALUES
(1, 1, 1, 12, 3400, TO_TIMESTAMP('2147-03-12 14:55:10', 'YYYY-MM-DD HH24:MI:SS')),
(2, 2, 4, 8, 1900, TO_TIMESTAMP('2147-03-11 18:10:44', 'YYYY-MM-DD HH24:MI:SS')),
(3, 3, 3, 15, 4200, TO_TIMESTAMP('2147-03-10 20:20:55', 'YYYY-MM-DD HH24:MI:SS')),
(4, 4, 2, 6, 1100, TO_TIMESTAMP('2147-03-09 13:30:11', 'YYYY-MM-DD HH24:MI:SS')),
(5, 5, 5, 18, 5600, TO_TIMESTAMP('2147-03-12 21:10:10', 'YYYY-MM-DD HH24:MI:SS'));

------------------------------------------------------------
-- CHARACTER DYNAMIC STATS
------------------------------------------------------------
INSERT INTO character_stats_dynamic (character_id, current_hp, current_armor,current_damage_output, current_speed) VALUES
(1, 1600, 300, 95, 40),   -- Vanguard-9
(2, 850, 70, 155, 75),    -- Spectre-Unit
(3, 900, 90, 45, 55),     -- Aurora-LX
(4, 1100, 140, 165, 60),  -- EmberCore
(5, 1500, 280, 175, 45);  -- Titanfall-Prime

------------------------------------------------------------
-- CHARACTER EQUIPMENT SLOTS
------------------------------------------------------------
INSERT INTO character_equipment_slots (slot_id, character_id, slot_category, equipped_item_id, equipped_weapon_id) VALUES
-- Vanguard-9
(101, 1, 'Primary',   1, 1),  -- Nano-Repair Kit + Railgun
(102, 1, 'Utility',   2, NULL),

-- Spectre-Unit
(103, 2, 'Primary',   3, 4),  -- Neural Sync Module + Ion Sabre
(104, 2, 'Utility',   4, NULL),

-- Aurora-LX
(105, 3, 'Primary',   1, 3),  -- Nano-Repair Kit + Beam Staff
(106, 3, 'Support',   5, NULL),

-- EmberCore
(107, 4, 'Primary',   4, 2),  -- Plasma Cells + Pulse Repeater
(108, 4, 'Utility',   3, NULL),

-- Titanfall-Prime
(109, 5, 'Primary',   2, 5),  -- Alloy Plate + Helix Carbine
(110, 5, 'Auxiliary', 1, NULL);

------------------------------------------------------------
-- CHARACTER SKILL LOADOUTS
------------------------------------------------------------
INSERT INTO character_skill_loadouts (loadout_id, character_id, ability_slot_1, ability_slot_2, ability_slot_3, passive_skil_id) VALUES
-- Vanguard-9
(201, 1, 101, 102, NULL, NULL),

-- Spectre-Unit
(202, 2, 401, 402, NULL, NULL),

-- Aurora-LX
(203, 3, 301, 302, NULL, NULL),

-- EmberCore
(204, 4, 201, 202, NULL, NULL),

-- Titanfall-Prime
(205, 5, 501, 502, NULL, NULL);

------------------------------------------------------------
-- CHARACTER LEVEL HISTORY
------------------------------------------------------------
INSERT INTO character_level_history (level_history_id, character_id, previous_level, new_level, level_changed_at) VALUES
(301, 1, 11, 12, TO_TIMESTAMP('2147-03-12 15:10:00', 'YYYY-MM-DD HH24:MI:SS')),
(302, 2, 7, 8, TO_TIMESTAMP('2147-03-11 18:25:44', 'YYYY-MM-DD HH24:MI:SS')),
(303, 3, 14, 15, TO_TIMESTAMP('2147-03-10 20:40:55', 'YYYY-MM-DD HH24:MI:SS')),
(304, 4, 5, 6, TO_TIMESTAMP('2147-03-09 13:50:11', 'YYYY-MM-DD HH24:MI:SS')),
(305, 5, 17, 18, TO_TIMESTAMP('2147-03-12 21:20:10', 'YYYY-MM-DD HH24:MI:SS'));

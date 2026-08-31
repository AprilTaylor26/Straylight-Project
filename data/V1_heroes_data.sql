---------------------------- Heroes Data ------------------------

-----------------------------
-- HEROES
-----------------------------
INSERT INTO heroes (hero_id, role_id, hero_name, hero_lore_text, difficulty_rating) VALUES
(1, 1, 'Vanguard-9','A fortified mech-frame deployed in orbital sieges across the Helios Sector.', 2),
(2, 2, 'EmberCore', 'A high-output plasma specialist capable of destabilizing enemy shields.', 3),
(3, 3, 'Aurora-LX', 'An autonomous support construct designed for deep-space rescue operations.', 1),
(4, 4, 'Spectre-Unit', 'A covert infiltration drone equipped with adaptive cloaking systems.', 4),
(5, 5, 'Titanfall-Prime', 'A heavy assault chassis built for frontline pressure in nebula conflicts.', 3);



--------------------------
-- HERO ABILITIES
-------------------------
INSERT INTO hero_abilities (ability_id, hero_id, ability_name, ability_category,cooldown_seconds, base_damage, base_healing, ability_description) VALUES
(101, 1, 'Shield Wall', 'Defensive', 12, 0, 0, 'Deploys a reinforced barrier that absorbs incoming plasma fire.'),
(102, 1, 'Kinetic Slam', 'Offensive', 8, 120, 0, 'A ground-impact shockwave that disrupts enemy formations.'),
(201, 2, 'Plasma Burst', 'Offensive', 6, 150, 0, 'Unleashes a concentrated plasma bolt that melts armor plating.'),
(202, 2, 'Thermal Surge', 'Utility', 10, 80, 0, 'Overloads nearby energy fields, causing heat-based disruption.'),
(301, 3, 'Nano-Heal Pulse', 'Healing', 5, 0, 140, 'Releases nanobots that rapidly repair allied damage.'),
(302, 3, 'Stasis Field', 'Utility', 14, 0, 0, 'Generates a temporal bubble slowing enemy movement.'),
(401, 4, 'Phase Cloak', 'Stealth', 15, 0, 0, 'Renders the unit nearly invisible by shifting its ion signature.'),
(402, 4, 'Void Strike', 'Offensive', 7, 160, 0, 'A precision strike delivered from partial phase displacement.'),
(501, 5, 'Hammerfall', 'Offensive', 9, 180, 0, 'A devastating melee blow powered by gravitic actuators.'),
(502, 5, 'Fortress Mode', 'Defensive', 18, 0, 0, 'Reinforces armor plating, reducing incoming damage significantly.');



---------------------------
-- HERO BASE STATS
--------------------------
INSERT INTO hero_stats_base (hero_id, base_hp, base_armor, base_speed, base_damage_output) VALUES
(1, 1800, 350, 40, 90),   
(2, 1200, 150, 60, 160),  
(3, 1000, 100, 55, 40),   
(4, 900, 80, 75, 150),    
(5, 1600, 300, 45, 170);  



-------------------------
-- HERO UNLOCKS
-------------------------
INSERT INTO hero_unlocks (unlock_id, hero_id, unlock_category, unlock_name,rarity_level, unlock_requirement_text) VALUES
(1001, 1, 'Skin', 'Siege Alloy', 3, 'Earned by completing 20 orbital defense missions.'),
(1002, 1, 'Emote', 'Mech Salute', 2, 'Unlocked at mastery level 5.'),
(2001, 2, 'Skin', 'Solar Flare', 4, 'Awarded during the Stormfall Protocol event.'),
(2002, 2, 'Weapon Mod', 'Plasma Overcharger', 5, 'Crafted using rare nebula cores.'),
(3001, 3, 'Skin', 'Rescue Protocol', 2, 'Unlocked after healing 10,000 HP total.'),
(3002, 3, 'Emote', 'Diagnostic Scan', 1, 'Granted at mastery level 3.'),
(4001, 4, 'Skin', 'Void Phantom', 4, 'Earned by completing stealth operations in the Rift Cluster.'),
(4002, 4, 'Weapon Mod', 'Phase Stabilizer', 3, 'Crafted using ionized alloy fragments.'),
(5001, 5, 'Skin', 'Prime Armor', 5, 'Awarded for defeating 50 elite nebula hostiles.'),
(5002, 5, 'Emote', 'Hammer Spin', 2, 'Unlocked at mastery level 4.');



----------------------------
-- HERO PROGRESSION
----------------------------
INSERT INTO hero_progression (progression_id, hero_id, player_id,mastery_level, mastery_xp, mastery_updated_at) VALUES
(9001, 1, 1, 3, 1200, TO_TIMESTAMP('2147-03-12 14:48:55', 'YYYY-MM-DD HH24:MI:SS')),
(9002, 2, 2, 2, 850, TO_TIMESTAMP('2147-03-11 18:03:21', 'YYYY-MM-DD HH24:MI:SS')),
(9003, 3, 3, 4, 2100, TO_TIMESTAMP('2147-03-10 20:14:55', 'YYYY-MM-DD HH24:MI:SS')),
(9004, 4, 4, 1, 300, TO_TIMESTAMP('2147-03-09 13:22:11', 'YYYY-MM-DD HH24:MI:SS')),
(9005, 5, 5, 5, 3500, TO_TIMESTAMP('2147-03-12 21:03:10', 'YYYY-MM-DD HH24:MI:SS'));

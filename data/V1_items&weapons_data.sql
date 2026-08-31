----------------------- ITEMS & WEAPONS ---------------------------

-----------------
-- ITEMS 
----------------
INSERT INTO items (item_id, item_type_id, item_rarity_id, item_name, item_description, item_stack_limit) VALUES
(1, 1, 1, 'Nano-Repair Kit', 'A compact nanobot dispenser used for rapid battlefield healing.', 20),
(2, 2, 2, 'Alloy Reinforcement Plate', 'A durable composite plate harvested from nebula-forged minerals.', 10),
(3, 3, 3, 'Neural Sync Module', 'A cybernetic implant enhancing reaction time and targeting precision.', 5),
(4, 4, 1, 'Plasma Cell Pack', 'Standard energy cells used to power plasma-based weaponry.', 50),
(5, 2, 4, 'Quantum Stabilizer', 'A rare device preventing temporal drift during high-energy combat.', 3);


------------------
-- WEAPONS
------------------
INSERT INTO weapons (weapon_id, weapon_type_id, weapon_rarity_id, weapon_name, weapon_base_damage, weapon_fire_rate, weapon_reload_sec) VALUES
(1, 1, 3, 'Stormbreaker Railgun', 240, 0.75, 2.50),
(2, 2, 2, 'Pulse Repeater Mk II', 110, 3.20, 1.80),
(3, 3, 4, 'Voidcaster Beam Staff', 180, 1.10, 2.20),
(4, 4, 5, 'Ion Sabre', 260, 0.00, 0.00),
(5, 5, 1, 'Helix Carbine', 95, 2.80, 2.00);


---------------------
-- WEAPON MODS
--------------------
INSERT INTO weapon_mods (mod_id, mod_type_id, weapon_id, mod_name, mod_effect_text, mod_stat_bonus) VALUES
(101, 1, 1, 'Mag-Accelerator', 'Increases projectile velocity, improving penetration capability.', 25),
(102, 1, 1, 'Recoil Dampener', 'Reduces kickback, enhancing long-range accuracy.', 15),
(201, 2, 2, 'Plasma Diffuser', 'Widens plasma spread for improved crowd control.', 20),
(202, 2, 2, 'Heat Sink Array', 'Lowers weapon temperature, reducing cooldown time.', 18),
(301, 3, 3, 'Quantum Lens', 'Amplifies beam intensity for higher damage output.', 30),
(302, 3, 3, 'Phase Resonator', 'Allows partial phasing of energy beams through obstacles.', 22),
(401, 4, 4, 'Ion Edge Stabilizer', 'Improves blade cohesion, increasing melee precision.',28),
(402, 4, 4, 'Charge Booster', 'Enhances ion charge buildup for stronger strikes.', 35),
(501, 5, 5, 'Targeting Matrix', 'AI-assisted targeting improves hit consistency.', 12),
(502, 5, 5, 'Hybrid Chamber', 'Allows rapid switching between ballistic and plasma modes.', 20);


----------------------------
-- WEAPON MODS TYPES 
---------------------------
INSERT INTO weapon_mod_types (mod_type_id, mod_type_name, mod_type_description) VALUES
(1, 'Barrel Enhancement', 'Modifications that improve projectile velocity, accuracy, or spread.'),
(2, 'Cooling Systems', 'Thermal regulators that reduce weapon heat buildup and cooldown times.'),
(3, 'Energy Amplifiers', 'Quantum components that increase beam intensity or plasma output.'),
(4, 'Stabilization Modules', 'Ion-field stabilizers that improve melee cohesion or reduce recoil.'),
(5, 'Hybrid Converters', 'Adaptive chambers enabling rapid switching between weapon modes.');


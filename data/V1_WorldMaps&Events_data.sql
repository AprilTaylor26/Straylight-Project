--------------------- WORLD, MAPS & EVENTS Data ------------------

------------------------------ WORLD ZONES ------------------------------
INSERT INTO world_zones (zone_id, map_id, zone_name, zone_difficulty) VALUES
-- Helios Citadel
(101, 1, 'Citadel Core', 3),
(102, 1, 'Outer Defense Ring', 2),

-- Ashen Dunes
(103, 2, 'Ion Storm Basin', 4),
(104, 2, 'Wreckage Fields', 3),

-- Crystal Verge
(105, 3, 'Glacial Caverns', 2),
(106, 3, 'Crystal Spires', 5),

-- Nebula Drift
(107, 4, 'Gas Flow Corridor', 3),
(108, 4, 'Nebula Heart', 4),

-- Rift Horizon
(109, 5, 'Wormhole Edge', 5),
(110, 5, 'Fracture Plains', 4);

------------------------------ EVENT REWARDS ------------------------------
INSERT INTO event_rewards (event_reward_id, seasonal_event_id, item_id, reward_quantity) VALUES
-- Eclipse Hunt
(201, 1, 1, 3),  -- Nano-Repair Kits
(202, 1, 4, 10), -- Plasma Cell Packs

-- Stormfall Protocol
(203, 2, 2, 2),  -- Alloy Reinforcement Plates
(204, 2, 3, 1),  -- Neural Sync Module

-- Quantum Surge
(205, 3, 5, 1),  -- Quantum Stabilizer

-- Nebula Convergence
(206, 4, 4, 15), -- Plasma Cell Packs
(207, 4, 1, 5);  -- Nano-Repair Kits

------------------------------ EVENT PARTICIPATION ------------------------------
INSERT INTO event_participation (event_participation_id, seasonal_event_id, player_id, participated_at) VALUES
-- Eclipse Hunt
(301, 1, 1, TO_TIMESTAMP('2147-03-11 14:20:10', 'YYYY-MM-DD HH24:MI:SS')),
(302, 1, 3, TO_TIMESTAMP('2147-03-12 09:55:33', 'YYYY-MM-DD HH24:MI:SS')),

-- Stormfall Protocol
(303, 2, 2, TO_TIMESTAMP('2147-04-03 15:10:55', 'YYYY-MM-DD HH24:MI:SS')),
(304, 2, 5, TO_TIMESTAMP('2147-04-04 17:22:31', 'YYYY-MM-DD HH24:MI:SS')),

-- Quantum Surge
(305, 3, 4, TO_TIMESTAMP('2147-05-16 18:03:21', 'YYYY-MM-DD HH24:MI:SS')),

-- Nebula Convergence
(306, 4, 1, TO_TIMESTAMP('2147-06-02 20:14:55', 'YYYY-MM-DD HH24:MI:SS')),
(307, 4, 5, TO_TIMESTAMP('2147-06-03 21:03:10', 'YYYY-MM-DD HH24:MI:SS'));

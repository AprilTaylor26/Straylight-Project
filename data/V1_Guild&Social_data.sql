--------------------- GUILDS & SOCIAL Data ------------------------

------------------------------ GUILDS ------------------------------
INSERT INTO guilds (guild_id, guild_name, guild_motto_text, guild_created_at) VALUES
(1, 'Helios Vanguard', 'Stand firm against the cosmic tide.', TO_TIMESTAMP('2147-03-05 10:12:00', 'YYYY-MM-DD HH24:MI:SS')),
(2, 'Nebula Syndicate', 'From the void, we rise.', TO_TIMESTAMP('2147-03-07 14:44:20', 'YYYY-MM-DD HH24:MI:SS')),
(3, 'Riftwalkers', 'Master the unknown.', TO_TIMESTAMP('2147-03-09 09:30:55', 'YYYY-MM-DD HH24:MI:SS'));


------------------------------ GUILD MEMBERS ------------------------------
INSERT INTO guild_members (guild_member_id, guild_id, player_id, guild_role_id, guild_joined_at) VALUES
-- Helios Vanguard
(101, 1, 1, 1, TO_TIMESTAMP('2147-03-06 11:00:00', 'YYYY-MM-DD HH24:MI:SS')), -- NovaStrike (Commander)
(102, 1, 3, 3, TO_TIMESTAMP('2147-03-06 11:15:22', 'YYYY-MM-DD HH24:MI:SS')), -- QuantumShade (Specialist)

-- Nebula Syndicate
(103, 2, 2, 2, TO_TIMESTAMP('2147-03-08 16:40:10', 'YYYY-MM-DD HH24:MI:SS')), -- IonDrifter (Officer)
(104, 2, 5, 4, TO_TIMESTAMP('2147-03-08 17:05:33', 'YYYY-MM-DD HH24:MI:SS')), -- HelixShade (Recruit)

-- Riftwalkers
(105, 3, 4, 3, TO_TIMESTAMP('2147-03-10 10:22:11', 'YYYY-MM-DD HH24:MI:SS')); -- RiftRunner (Specialist)

------------------------------ GUILD EVENTS ------------------------------
INSERT INTO guild_events (guild_event_id, guild_id, guild_event_name, guild_event_category, guild_event_at) VALUES
-- Helios Vanguard
(201, 1, 'Citadel Defense Drill', 'Training', TO_TIMESTAMP('2147-03-12 14:20:10', 'YYYY-MM-DD HH24:MI:SS')),
(202, 1, 'Helios Summit', 'Meeting', TO_TIMESTAMP('2147-03-13 09:15:44', 'YYYY-MM-DD HH24:MI:SS')),

-- Nebula Syndicate
(203, 2, 'Nebula Raid Prep', 'Strategy', TO_TIMESTAMP('2147-03-11 18:03:21', 'YYYY-MM-DD HH24:MI:SS')),
(204, 2, 'Shadow Market Exchange', 'Trade', TO_TIMESTAMP('2147-03-12 21:03:10', 'YYYY-MM-DD HH24:MI:SS')),

-- Riftwalkers
(205, 3, 'Rift Stability Scan', 'Exploration', TO_TIMESTAMP('2147-03-10 20:14:55', 'YYYY-MM-DD HH24:MI:SS'));

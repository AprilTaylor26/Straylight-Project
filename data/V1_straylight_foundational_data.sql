------------------------- FOUNDATION TABLES ------------------------------

-----------------------------
-- HERO ROLES
-----------------------------
INSERT INTO hero_roles (role_id, role_display_name, role_description) VALUES
(1, 'Tank', 'Frontline specialists engineered for high durability in orbital combat.'),
(2, 'Damage', 'High-output operatives optimized for rapid elimination of hostile targets.'),
(3, 'Support', 'Adaptive units designed to enhance team survivability and efficiency.'),
(4, 'Stealth', 'Covert infiltration operatives equipped with advanced cloaking systems.'),
(5, 'Bruiser', 'Heavy assault frames capable of sustained frontline pressure.');

-----------------------------
-- WEAPON TYPES
-----------------------------
INSERT INTO weapon_types (weapon_type_id, weapon_type_name, weapon_type_description) VALUES
(1, 'Railgun', 'Electromagnetic long-range weaponry used in deep-space engagements.'),
(2, 'Plasma Rifle', 'High-energy plasma discharge rifles common among strike teams.'),
(3, 'Beam Staff', 'Focused energy conduits used by augmented operatives.'),
(4, 'Energy Blade', 'Close-quarters melee weapons forged from stabilized ion fields.'),
(5, 'Carbine', 'Compact ballistic hybrids favored by reconnaissance units.');

-----------------------------
-- WEAPON RARITY
-----------------------------
INSERT INTO weapon_rarity (weapon_rarity_id, weapon_rarity_name, weapon_rarity_color) VALUES
(1, 'Common', 'Neon Green'),
(2, 'Uncommon', 'Ruby Red'),
(3, 'Rare', 'Opaque'),
(4, 'Epic', 'Electric Blue'),
(5, 'Legendary', 'Onyx');

-----------------------------
-- ITEM TYPES
-----------------------------
INSERT INTO item_types (item_type_id, item_type_name, item_type_description) VALUES
(1, 'Consumable', 'Single-use field items designed for rapid deployment.'),
(2, 'Material', 'Crafting components sourced from alien biomes and nebula anomalies.'),
(3, 'Upgrade', 'Cybernetic enhancements compatible with most operative frames.'),
(4, 'Utility', 'General-purpose tools used in exploration and survival scenarios.');

-----------------------------
-- ITEM RARITY
-----------------------------
INSERT INTO item_rarity (item_rarity_id, item_rarity_name, item_rarity_color) VALUES
(1, 'Common', 'White'),
(2, 'Uncommon', 'Orange'),
(3, 'Rare', 'Purple'),
(4, 'Epic', 'Dark Green'),
(5, 'Legendary', 'Shiny Pink');

-----------------------------
-- MAPS
-----------------------------
INSERT INTO maps (map_id, map_name, map_description) VALUES
(1, 'Skyforge Citadel', 'A fortified orbital bastion suspended above the Helios Rift.'),
(2, 'Ashen Nebula Outpost', 'A research station drifting within a volatile nebula cluster.'),
(3, 'Crystal Expanse Colony', 'A frontier settlement built atop crystalline alien terrain.'),
(4, 'Ironhold Orbital Bastion', 'A military stronghold guarding the outer defense perimeter.'),
(5, 'Riftgate Terminal', 'A transit hub centered around an unstable wormhole conduit.');

-----------------------------
-- RANK TIERS
-----------------------------
INSERT INTO rank_tiers (rank_id, rank_display_name, mmr_min, mmr_max) VALUES
(1, 'Bronze',    0,   999),
(2, 'Silver', 1000,  1499),
(3, 'Gold',   1500,  1999),
(4, 'Platinum', 2000, 2499),
(5, 'Diamond', 2500, 2999),
(6, 'Ascendant', 3000, 9999);

-----------------------------
-- GUILD ROLES
-----------------------------
INSERT INTO guild_roles (guild_role_id, guild_role_name, guild_role_permissions) VALUES
(1, 'Commander', 'Full access: recruit members, schedule events, manage guild settings, disband guild.'),
(2, 'Officer',   'Moderate access: invite members, manage squads, start guild events.'),
(3, 'Specialist','Limited access: participate in events, manage personal loadouts, access guild resources.'),
(4, 'Recruit',   'Basic access: join events, view guild roster, limited communication privileges.');

-----------------------------
-- SEASONAL EVENTS
-----------------------------
INSERT INTO seasonal_events (seasonal_event_id, seasonal_event_name, seasonal_event_start, seasonal_event_end) VALUES
(1, 'Eclipse Hunt', TO_DATE('2147-03-10 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-03-14 23:59:59', 'YYYY-MM-DD HH24:MI:SS')),
(2, 'Stormfall Protocol', TO_DATE('2147-04-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-04-07 23:59:59', 'YYYY-MM-DD HH24:MI:SS')),
(3, 'Quantum Surge', TO_DATE('2147-05-15 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-05-20 23:59:59', 'YYYY-MM-DD HH24:MI:SS')),
(4, 'Nebula Convergence', TO_DATE('2147-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-06-10 23:59:59', 'YYYY-MM-DD HH24:MI:SS'));
------------------ PLAYERS DATA ------------------------

------------------
-- PLAYERS 
-----------------
INSERT INTO players (player_id, username, email, password_hash, account_created_at, account_status) VALUES
(1, 'NovaStrike', 'novastrike@heliosnet.2147', 'HASH_ABC123', TO_TIMESTAMP('2147-03-01 14:22:10', 'YYYY-MM-DD HH24:MI:SS'), 'Active'),
(2, 'IonDrifter', 'iondrifter@heliosnet.2147', 'HASH_DEF456', TO_TIMESTAMP('2147-03-02 09:15:44', 'YYYY-MM-DD HH24:MI:SS'), 'Active'),
(3, 'QuantumShade', 'quantumshade@heliosnet.2147', 'HASH_GHI789', TO_TIMESTAMP('2147-03-03 18:03:21', 'YYYY-MM-DD HH24:MI:SS'), 'Active'),
(4, 'RiftRunner', 'riftrunner@heliosnet.2147', 'HASH_JKL012', TO_TIMESTAMP('2147-03-04 20:14:55', 'YYYY-MM-DD HH24:MI:SS'), 'Suspended'),
(5, 'HelixShade', 'helixshade@heliosnet.2147', 'HASH_MNO345', TO_TIMESTAMP('2147-03-05 13:22:11', 'YYYY-MM-DD HH24:MI:SS'), 'Active');


----------------------
-- PLAYER PROFILES 
---------------------
INSERT INTO player_profiles (profile_id, player_id, display_name, region, preferred_role, bio_text) VALUES
(101, 1, 'NovaStrike', 'Helios Sector', 'Damage', 'Frontline strike operative specializing in plasma engagements.'),
(102, 2, 'IonDrifter', 'Outer Colonies', 'Stealth', 'Nomadic infiltrator known for silent orbital breaches.'),
(103, 3, 'QuantumShade', 'Rift Cluster', 'Support', 'Temporal analyst assisting squads with predictive combat modeling.'),
(104, 4, 'RiftRunner', 'Helios Sector', 'Damage', 'High-speed operative trained in wormhole traversal.'),
(105, 5, 'HelixShade', 'Crystal Expanse', 'Tank', 'Heavy-frame pilot with reinforced alloy exosuits.');


---------------------
-- PLAYER SETTINGS 
---------------------
INSERT INTO player_settings (settings_id, player_id, mouse_sensitivity, keybind_profile, graphics_quality, audio_master_level, audio_effects_level) VALUES
(201, 1, 12.50, 'Default', 'High', 85, 70),
(202, 2, 10.00, 'StealthOps', 'Medium', 80, 65),
(203, 3, 14.20, 'SupportGrid', 'High', 90, 75),
(204, 4, 16.00, 'SpeedRunner', 'Ultra', 95, 80),
(205, 5, 9.50, 'TankWall', 'High', 88, 72);


-----------------------------
-- PLAYER LOGIN HISTORY
-----------------------------
INSERT INTO player_login_history (login_id, player_id, login_at, logout_at, device_type, ip_address) VALUES
(1, 1, TO_DATE('2147-03-12 14:20:10','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-03-12 16:05:44','YYYY-MM-DD HH24:MI:SS'), 'NeuralLink HUD', '192.214.7.10'),
(2, 2, TO_DATE('2147-03-12 15:10:55','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-03-12 17:22:31','YYYY-MM-DD HH24:MI:SS'), 'HeliosPad', '192.214.7.11'),
(3, 3, TO_DATE('2147-03-11 18:03:21','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-03-11 19:44:02','YYYY-MM-DD HH24:MI:SS'), 'Orbital Console', '192.214.7.12'),
(4, 4, TO_DATE('2147-03-10 20:14:55','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-03-10 22:01:33','YYYY-MM-DD HH24:MI:SS'), 'NeuralLink HUD', '192.214.7.13'),
(5, 5, TO_DATE('2147-03-09 13:22:11','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-03-09 15:55:44','YYYY-MM-DD HH24:MI:SS'), 'HeliosPad', '192.214.7.14'),
(6, 6, TO_DATE('2147-03-12 09:55:33','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-03-12 11:47:03','YYYY-MM-DD HH24:MI:SS'), 'Orbital Console', '192.214.7.15'),
(7, 7, TO_DATE('2147-03-11 17:44:02','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-03-11 19:12:55','YYYY-MM-DD HH24:MI:SS'), 'NeuralLink HUD', '192.214.7.16'),
(8, 8, TO_DATE('2147-03-10 16:12:55','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-03-10 18:44:20','YYYY-MM-DD HH24:MI:SS'), 'HeliosPad', '192.214.7.17'),
(9, 9, TO_DATE('2147-03-12 21:03:10','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-03-12 23:59:59','YYYY-MM-DD HH24:MI:SS'), 'Orbital Console', '192.214.7.18'),
(10, 10, TO_DATE('2147-03-13 09:15:44','YYYY-MM-DD HH24:MI:SS'), TO_DATE('2147-03-13 11:22:10','YYYY-MM-DD HH24:MI:SS'), 'NeuralLink HUD', '192.214.7.19');


---------------------------
-- PLAYER TRANSACTIONS 
--------------------------
INSERT INTO player_transactions (transaction_id, player_id, transaction_category, transaction_amount, currency_type, transaction_at) VALUES
(1, 1, 'Marketplace Purchase', 125.50, 'Gold', TO_TIMESTAMP('2147-03-12 14:20:10', 'YYYY-MM-DD HH24:MI:SS')),
(2, 2, 'Crafting Fee', 40.00, 'Gold', TO_TIMESTAMP('2147-03-11 18:03:21', 'YYYY-MM-DD HH24:MI:SS')),
(3, 3, 'Premium Currency Pack', 9.99, 'Premium', TO_TIMESTAMP('2147-03-10 20:14:55', 'YYYY-MM-DD HH24:MI:SS')),
(4, 4, 'Guild Donation', 150.00, 'Gold', TO_TIMESTAMP('2147-03-09 13:22:11', 'YYYY-MM-DD HH24:MI:SS')),
(5, 5, 'Trade Tax', 25.00, 'Gold', TO_TIMESTAMP('2147-03-12 21:03:10', 'YYYY-MM-DD HH24:MI:SS'));


---------------------------
-- PLAYER RANK HISTORY 
--------------------------
INSERT INTO player_rank_history (rank_history_id, player_id, rank_id, previous_mmr, new_mmr, rank_changed_at) VALUES
(1, 1, 1, 1200, 1350, TO_TIMESTAMP('2147-03-12 14:48:55', 'YYYY-MM-DD HH24:MI:SS')),
(2, 2, 2, 900, 1020, TO_TIMESTAMP('2147-03-11 18:20:44', 'YYYY-MM-DD HH24:MI:SS')),
(3, 3, 3, 1500, 1625, TO_TIMESTAMP('2147-03-10 20:40:55', 'YYYY-MM-DD HH24:MI:SS')),
(4, 4, 2, 780, 860, TO_TIMESTAMP('2147-03-09 13:50:11', 'YYYY-MM-DD HH24:MI:SS')),
(5, 5, 4, 1700, 1880, TO_TIMESTAMP('2147-03-12 21:20:10', 'YYYY-MM-DD HH24:MI:SS'));


------------------------------
-- PLAYER CURRENCY WALLET
------------------------------
INSERT INTO player_currency_wallets (wallet_id, player_id, gold_amount, premium_amount, wallet_updated_at) VALUES
(1, 1, 12500.00, 300.00, TO_TIMESTAMP('2147-03-12 14:20:10', 'YYYY-MM-DD HH24:MI:SS')),
(2, 2, 8400.00, 120.00, TO_TIMESTAMP('2147-03-11 18:03:21', 'YYYY-MM-DD HH24:MI:SS')),
(3, 3, 15200.00, 500.00, TO_TIMESTAMP('2147-03-10 20:14:55', 'YYYY-MM-DD HH24:MI:SS')),
(4, 4, 6200.00, 80.00, TO_TIMESTAMP('2147-03-09 13:22:11', 'YYYY-MM-DD HH24:MI:SS')),
(5, 5, 20400.00, 900.00, TO_TIMESTAMP('2147-03-12 21:03:10', 'YYYY-MM-DD HH24:MI:SS'));

------------------  LOGGING & MONITORING Data -----------------------------

------------------------------ ERROR LOGS ------------------------------
INSERT INTO error_logs (error_log_id, error_message_text, error_severity, error_occurred_at) VALUES
(1, 'Null reference encountered during plasma routing module initialization.', 'High', TO_TIMESTAMP('2147-03-12 14:20:10', 'YYYY-MM-DD HH24:MI:SS')),
(2, 'Failed to resolve wormhole coordinate mapping.', 'Critical', TO_TIMESTAMP('2147-03-11 18:03:21', 'YYYY-MM-DD HH24:MI:SS')),
(3, 'Unauthorized attempt to access restricted nebula telemetry.', 'Medium', TO_TIMESTAMP('2147-03-10 20:14:55', 'YYYY-MM-DD HH24:MI:SS')),
(4, 'Timeout while syncing Helios Citadel defense grid.', 'Low', TO_TIMESTAMP('2147-03-09 13:22:11', 'YYYY-MM-DD HH24:MI:SS')),
(5, 'Corrupted data packet detected in Rift Horizon scan logs.', 'High', TO_TIMESTAMP('2147-03-12 21:03:10', 'YYYY-MM-DD HH24:MI:SS'));

------------------------------ SLOW QUERY LOGS ------------------------------
INSERT INTO slow_query_logs (slow_query_id, slow_query_text, slow_query_time_ms, slow_query_recorded_at) VALUES
(101, 'SELECT * FROM combat_logs WHERE combat_event_category = ''Damage'';', 842, TO_TIMESTAMP('2147-03-12 14:48:55', 'YYYY-MM-DD HH24:MI:SS')),
(102, 'SELECT * FROM match_stats WHERE damage_done > 3000;', 1290, TO_TIMESTAMP('2147-03-11 18:20:44', 'YYYY-MM-DD HH24:MI:SS')),
(103, 'SELECT * FROM world_zones WHERE zone_difficulty >= 4;', 910, TO_TIMESTAMP('2147-03-10 20:40:55', 'YYYY-MM-DD HH24:MI:SS')),
(104, 'SELECT * FROM market_transactions WHERE tx_price > 1000;', 1560, TO_TIMESTAMP('2147-03-09 13:50:11', 'YYYY-MM-DD HH24:MI:SS')),
(105, 'SELECT * FROM suspicious_activity_logs WHERE activity_category = ''Exploit'';', 2040, TO_TIMESTAMP('2147-03-12 23:59:59', 'YYYY-MM-DD HH24:MI:SS'));

------------------------------ SUSPICIOUS ACTIVITY LOGS ------------------------------
INSERT INTO suspicious_activity_logs (suspicious_activity_id, player_id, activity_category, activity_text, activity_recorded_at) VALUES
(201, 1, 'Exploit', 'Player executed abnormal movement patterns exceeding standard velocity thresholds.', TO_TIMESTAMP('2147-03-12 14:32:10', 'YYYY-MM-DD HH24:MI:SS')),
(202, 3, 'Unauthorized Access', 'Attempted access to restricted guild command terminal.', TO_TIMESTAMP('2147-03-11 18:03:21', 'YYYY-MM-DD HH24:MI:SS')),
(203, 2, 'Economy Manipulation', 'Detected rapid buy-sell cycles of plasma cell packs.', TO_TIMESTAMP('2147-03-10 20:14:55', 'YYYY-MM-DD HH24:MI:SS')),
(204, NULL, 'System Probe', 'Unidentified entity scanned nebula telemetry endpoints.', TO_TIMESTAMP('2147-03-09 13:22:11', 'YYYY-MM-DD HH24:MI:SS')),
(205, 5, 'Combat Anomaly', 'Damage output exceeded expected parameters for Titanfall-Prime.', TO_TIMESTAMP('2147-03-12 21:03:10', 'YYYY-MM-DD HH24:MI:SS'));

------------------------------ AUDIT LOGS ------------------------------
INSERT INTO audit_logs (audit_log_id, player_id, audit_action, audit_text, audit_recorded_at) VALUES
(301, 1, 'LOGIN_SUCCESS', 'Player authenticated via HeliosNet secure gateway.', TO_TIMESTAMP('2147-03-12 14:20:10', 'YYYY-MM-DD HH24:MI:SS')),
(302, 2, 'ITEM_PURCHASE', 'Player purchased 20 Plasma Cell Packs from marketplace listing #2.', TO_TIMESTAMP('2147-03-12 15:10:55', 'YYYY-MM-DD HH24:MI:SS')),
(303, 3, 'GUILD_JOIN', 'Player joined guild: Helios Vanguard.', TO_TIMESTAMP('2147-03-11 18:03:21', 'YYYY-MM-DD HH24:MI:SS')),
(304, 4, 'MATCH_QUEUE', 'Player queued for Rift Control match mode.', TO_TIMESTAMP('2147-03-10 20:14:55', 'YYYY-MM-DD HH24:MI:SS')),
(305, 5, 'TRADE_COMPLETE', 'Player completed trade of Quantum Stabilizer with player #4.', TO_TIMESTAMP('2147-03-12 21:03:10', 'YYYY-MM-DD HH24:MI:SS'));
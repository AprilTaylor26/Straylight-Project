---------------------- Matches & Combat Data ------------------------

----------------------
-- MATCH MODES 
---------------------
INSERT INTO match_modes (mode_id, mode_name, mode_description, mode_is_team_based) VALUES
(1, 'Skirmish', 'Fast-paced engagements focused on rapid eliminations.', 'N'),
(2, 'Squad Assault', 'Team-based operations targeting strategic objectives.', 'Y'),
(3, 'Rift Control', 'Teams battle for control over unstable wormhole nodes.', 'Y');



---------------------
-- MATCHES
---------------------
INSERT INTO matches (match_id, mode_id, map_id, match_start_at, match_end_at) VALUES
(1, 2, 1, TO_TIMESTAMP('2147-03-12 14:32:10', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2147-03-12 14:48:55', 'YYYY-MM-DD HH24:MI:SS')),
(2, 1, 3, TO_TIMESTAMP('2147-03-11 18:03:21', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2147-03-11 18:20:44', 'YYYY-MM-DD HH24:MI:SS')),
(3, 3, 5, TO_TIMESTAMP('2147-03-10 20:14:55', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2147-03-10 20:40:55', 'YYYY-MM-DD HH24:MI:SS'));



-------------------------
-- MATCH TEAMS
------------------------
INSERT INTO match_teams (match_team_id, match_id, team_display_name, team_color_hex) VALUES
(101, 1, 'Helios Guard', '#1A75FF'),
(102, 1, 'Nebula Raiders', '#FF3B3B'),
(103, 3, 'Rift Sentinels', '#8A2BE2'),
(104, 3, 'Void Strikers', '#FF8C00');



---------------------------
-- MATCH PARTICIPANTS
--------------------------
INSERT INTO match_participants (participant_id, match_id, player_id, hero_id, match_team_id, participant_score) VALUES
(1, 1, 1, 1, 101, 320), 
(2, 1, 2, 4, 101, 280), 
(3, 1, 4, 2, 102, 410), 
(4, 1, 5, 5, 102, 390), 
(5, 2, 3, 3, NULL, 150), 
(6, 3, 1, 1, 103, 500),
(7, 3, 3, 3, 103, 420),
(8, 3, 2, 4, 104, 460),
(9, 3, 5, 5, 104, 480);



-----------------------
-- MATCH STATS
----------------------
INSERT INTO match_stats (match_stats_id, participant_id, kills, assists, deaths, damage_done, healing_done) VALUES
(1001, 1, 4, 6, 2, 1800, 300),
(1002, 2, 3, 4, 1, 1500, 0),
(1003, 3, 7, 2, 3, 2400, 0),
(1004, 4, 6, 3, 2, 2200, 0),
(1005, 5, 2, 1, 1, 900, 400),
(1006, 6, 8, 5, 2, 3100, 200),
(1007, 7, 5, 7, 1, 1700, 900),
(1008, 8, 7, 3, 3, 2600, 0),
(1009, 9, 9, 2, 4, 3300, 0);



----------------------
-- COMBAT LOGS
----------------------
INSERT INTO combat_logs (combat_log_id, match_id, combat_event_at, combat_event_category) VALUES
(2001, 1, TO_TIMESTAMP('2147-03-12 14:32:12', 'YYYY-MM-DD HH24:MI:SS'), 'Damage'),
(2002, 1, TO_TIMESTAMP('2147-03-12 14:32:14', 'YYYY-MM-DD HH24:MI:SS'), 'Healing'),
(2003, 1, TO_TIMESTAMP('2147-03-12 14:32:17', 'YYYY-MM-DD HH24:MI:SS'), 'Status'),
(2004, 3, TO_TIMESTAMP('2147-03-10 20:15:02', 'YYYY-MM-DD HH24:MI:SS'), 'Damage'),
(2005, 3, TO_TIMESTAMP('2147-03-10 20:15:05', 'YYYY-MM-DD HH24:MI:SS'), 'Status'),
(2006, 3, TO_TIMESTAMP('2147-03-10 20:15:09', 'YYYY-MM-DD HH24:MI:SS'), 'Healing');



----------------------
-- DAMAGE EVENTS
----------------------
INSERT INTO damage_events (damage_event_id, combat_log_id, attacker_participant_id, target_participant_id, damage_amount, is_critical_hit) VALUES
(3001, 2001, 1, 3, 120, 1),
(3002, 2004, 6, 8, 160, 0),
(3003, 2004, 9, 7, 180, 1);



-------------------------
-- HEALING EVENTS
------------------------
INSERT INTO healing_events (healing_event_id, combat_log_id, healer_participant_id, target_participant_id, healing_amount, overheal_flag) VALUES
(4001, 2002, 1, 2, 140, 0),
(4002, 2006, 7, 6, 200, 1);



--------------------------------
-- STATUS EFFECT EVENTS
-------------------------------
INSERT INTO status_effect_events (status_effect_id, combat_log_id, source_participant_id, target_participant_id, effect_type, effect_duration_sec) VALUES
(5001, 2003, 2, 3, 'Stasis Field', 4),
(5002, 2005, 8, 7, 'Phase Disrupt', 3);

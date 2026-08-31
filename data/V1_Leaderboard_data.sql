--------------- Leaderboard Data ---------------------

------------------------
-- LEADERBOARDS
-----------------------
INSERT INTO leaderboards (leaderboard_id, leaderboard_season, leaderboard_category) VALUES
(1, 'S1', 'Damage'),
(2, 'S1', 'Healing'),
(3, 'S1', 'Eliminations'),
(4, 'S1', 'Support Efficiency');


------------------------------
-- LEADERBOARD ENTRIES
------------------------------
INSERT INTO leaderboard_entries (leaderboard_entry_id, leaderboard_id, player_id, rank_position, leaderboard_score) VALUES
(1, 1, 5, 1, 3300),
(2, 1, 4, 2, 2400),
(3, 2, 3, 1, 900),
(4, 3, 1, 1, 8),
(5, 4, 3, 1, 140);

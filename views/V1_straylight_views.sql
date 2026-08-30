---------------- PLAYER & ACCOUNT SYSTEM (used for any admin tools / account dashboards) --------------------
-- For player + profiles
CREATE OR REPLACE VIEW vw_player_profiles AS
SELECT p.player_id,
       p.username,
       p.email,
       pr.display_name,
       pr.region,
       pr.preferred_role,
       pr.bio_text
FROM players p
JOIN player_profiles pr
  ON p.player_id = pr.player_id;


-- For player + settings
CREATE OR REPLACE VIEW vw_player_settings AS
SELECT p.player_id,
       p.username,
       s.mouse_sensitivity,
       s.keybind_profile,
       s.graphics_quality,
       s.audio_master_level,
       s.audio_effects_level
FROM players p
JOIN player_settings s
  ON p.player_id = s.player_id;


-- For login/logout history
CREATE OR REPLACE VIEW vw_player_login_history AS
SELECT p.player_id,
       p.username,
       lh.login_at,
       lh.logout_at,
       lh.device_type,
       lh.ip_address
FROM players p
JOIN player_login_history lh
  ON p.player_id = lh.player_id;


-- For gold/premium currency
CREATE OR REPLACE VIEW vw_player_wallets AS
SELECT p.player_id,
       p.username,
       w.gold_amount,
       w.premium_amount,
       w.wallet_updated_at
FROM players p
JOIN player_currency_wallets w
  ON p.player_id = w.player_id;


-- For purchase/spend history
CREATE OR REPLACE VIEW vw_player_transactions AS
SELECT p.player_id,
       p.username,
       t.transaction_category,
       t.transaction_amount,
       t.currency_type,
       t.transaction_at
FROM players p
JOIN player_transactions t
  ON p.player_id = t.player_id;



---------------- HEROES, ROLES & ABILITIES (used for selection / balancing / game design dashboards) --------------------
-- For hero + role
CREATE OR REPLACE VIEW vw_heroes AS
SELECT h.hero_id,
       h.hero_name,
       r.role_display_name,
       h.difficulty_rating,
       h.hero_lore_text
FROM heroes h
JOIN hero_roles r
  ON h.role_id = r.role_id;


-- For hero + abilities
CREATE OR REPLACE VIEW vw_hero_abilities AS
SELECT h.hero_id,
       h.hero_name,
       a.ability_id,
       a.ability_name,
       a.ability_category,
       a.cooldown_seconds,
       a.base_damage,
       a.base_healing,
       a.ability_description
FROM heroes h
JOIN hero_abilities a
  ON h.hero_id = a.hero_id;


-- For hero + base stats
CREATE OR REPLACE VIEW vw_hero_stats_base AS
SELECT h.hero_id,
       h.hero_name,
       sb.base_hp,
       sb.base_armor,
       sb.base_speed,
       sb.base_damage_output
FROM heroes h
JOIN hero_stats_base sb
  ON h.hero_id = sb.hero_id;


-- For hero + unlockables
CREATE OR REPLACE VIEW vw_hero_unlocks AS
SELECT h.hero_id,
       h.hero_name,
       u.unlock_id,
       u.unlock_category,
       u.unlock_name,
       u.rarity_level,
       u.unlock_requirement_text
FROM heroes h
JOIN hero_unlocks u
  ON h.hero_id = u.hero_id;



---------------- CHARACTER (used in character management / progression dashboards) --------------------
-- For player + hero + character information
CREATE OR REPLACE VIEW vw_characters AS
SELECT c.character_id,
       p.player_id,
       p.username,
       h.hero_name,
       c.character_level,
       c.character_xp,
       c.character_created_at
FROM characters c
JOIN players p
  ON c.player_id = p.player_id
JOIN heroes h
  ON c.hero_id = h.hero_id;


-- For current HP/armor/damage/speed
CREATE OR REPLACE VIEW vw_character_stats_dynamic AS
SELECT c.character_id,
       p.username,
       h.hero_name,
       d.current_hp,
       d.current_armor,
       d.current_damage_output,
       d.current_speed
FROM character_stats_dynamic d
JOIN characters c
  ON d.character_id = d.character_id
JOIN players p
  ON c.player_id = p.player_id
JOIN heroes h
  ON c.hero_id = h.hero_id;


-- For equipped items/weapons
CREATE OR REPLACE VIEW vw_character_equipment AS
SELECT c.character_id,
       p.username,
       h.hero_name,
       es.slot_category,
       es.equipped_item_id,
       es.equipped_weapon_id
FROM character_equipment_slots es
JOIN characters c
  ON es.character_id = c.character_id
JOIN players p
  ON c.player_id = c.player_id
JOIN heroes h
  ON c.hero_id = h.hero_id;


-- For abilities equipped
CREATE OR REPLACE VIEW vw_character_skill_loadouts AS
SELECT c.character_id,
       p.username,
       h.hero_name,
       sl.ability_slot_1,
       sl.ability_slot_2,
       sl.ability_slot_3,
       sl.passive_skil_id
FROM character_skill_loadouts sl
JOIN characters c
  ON sl.character_id = c.character_id
JOIN players p
  ON c.player_id = p.player_id
JOIN heroes h
  ON c.hero_id = h.hero_id;

-- For level-up history
CREATE OR REPLACE VIEW vw_character_level_history AS
SELECT c.character_id,
       p.username,
       h.hero_name,
       lh.previous_level,
       lh.new_level,
       lh.level_changed_at
FROM character_level_history lh
JOIN characters c
  ON lh.character_id = c.character_id
JOIN players p
  ON c.player_id = p.player_id
JOIN heroes h
  ON c.hero_id = h.hero_id;


---------------- WEAPONS, ITEMS & INVENTORY (used in inventory / crafting systems / economydashboards) --------------------
-- For weapon + type + rarity
 CREATE OR REPLACE VIEW vw_weapons AS
 SELECT w.weapon_id,
        w.weapon_name,
        wt.weapon_type_name,
        wr.weapon_rarity_name,
        w.weapon_base_damage,
        w.weapon_fire_rate,
        w.weapon_reload_sec
FROM weapons w
JOIN weapon_types wt
  ON w.weapon_type_id = wt.weapon_type_id
JOIN weapon_rarity wr
  ON w.weapon_rarity_id = wr.weapon_rarity_id;


-- For mods  + weapon + mod type
CREATE OR REPLACE VIEW vw_weapon_mods AS
SELECT w.weapon_id,
       w.weapon_name,
       m.mod_id,
       m.mod_name,
       mt.mod_type_name,
       m.mod_stat_bonus,
       m.mod_effect_text
FROM weapon_mods m
JOIN weapons w  
  ON m.weapon_id = w.weapon_id
JOIN weapon_mod_types mt
  ON m.mod_type_id = mt.mod_type_id;


-- For item + type + rarity
CREATE OR REPLACE VIEW vw_items AS
SELECT i.item_id,
       i.item_name,
       it.item_type_name,
       ir.item_rarity_name,
       i.item_stack_limit,
       i.item_description
FROM items i
JOIN item_types it
  ON i.item_type_id = it.item_type_id
JOIN item_rarity ir
  ON i.item_rarity_id = ir.item_rarity_id;


-- For player inventory
CREATE OR REPLACE VIEW vw_inventory AS
SELECT inv.inventory_id,
       p.player_id,
       p.username,
       i.item_name,
       inv.item_quantity
FROM inventory inv
JOIN players p
  ON inv.player_id = p.player_id
JOIN items i
  ON inv.item_id = i.item_id;


-- For inventory changes
CREATE OR REPLACE VIEW vw_inventory_transactions AS
SELECT it.inv_tx_id,
       p.player_id,
       p.username,
       i.item_name,
       it.inv_tx_category,
       it.quantity_change,
       it.inv_tx_at
FROM inventory_transactions it
JOIN players p
  ON it.player_id = p.player_id
JOIN items i
  ON it.item_id = i.item_id;
    


---------------- MATCHES, TEAMS & COMBAT LOGS (Used in match history / combat replay tools / balancing dashboards) --------------------
-- For match + mode +map
CREATE OR REPLACE VIEW vw_matches AS
SELECT m.match_id,
       mm.mode_name,
       mp.map_name,
       m.match_start_at,
       m.match_end_at
FROM matches m
JOIN match_modes mm
  ON m.mode_id = mm.mode_id
JOIN maps mp
  ON m.map_id = mp.map_id;


-- For teams in a match
CREATE OR REPLACE VIEW vw_match_teams AS
SELECT mt.match_team_id,
       m.match_id,
       mt.team_display_name,
       mt.team_color_hex
FROM match_teams mt
JOIN matches m
  ON mt.match_id = m.match_id;


-- For players + heroes in a match
CREATE OR REPLACE VIEW vw_match_participants AS
SELECT mp.participant_id,
       m.match_id,
       p.username,
       h.hero_name,
       mp.match_team_id,
       mp.participant_score
FROM match_participants mp
JOIN matches m
  ON mp.match_id = m.match_id
JOIN players p
  ON mp.player_id = p.player_id
JOIN heroes h
  ON mp.hero_id = h.hero_id;


-- For kills/assists/deaths/damage/healing
CREATE OR REPLACE VIEW vw_match_stats AS
SELECT ms.match_stats_id,
       mp.participant_id,
       p.username,
       h.hero_name,
       ms.kills,
       ms.assists,
       ms.deaths,
       ms.damage_done,
       ms.healing_done
FROM match_stats ms
JOIN match_participants mp
  ON ms.participant_id = mp.participant_id
JOIN players p
  ON mp.player_id = p.player_id
JOIN heroes h
  ON mp.hero_id = h.hero_id;


-- For combat events
CREATE OR REPLACE VIEW vw_combat_logs AS
SELECT cl.combat_log_id,
       m.match_id,
       cl.combat_event_at,
       cl.combat_event_category
FROM combat_logs cl
JOIN matches m
  ON cl.match_id = m.match_id;


-- For damage events
CREATE OR REPLACE VIEW vw_damage_events AS 
SELECT de.damage_event_id,
       cl.combat_log_id,
       de.attacker_participant_id,
       de.target_participant_id,
       de.damage_amount,
       de.is_critical_hit
FROM damage_events de
JOIN combat_logs cl
  ON de.combat_log_id = cl.combat_log_id;


-- For healing events
CREATE OR REPLACE VIEW vw_healing_events AS
SELECT he.healing_event_id,
       cl.combat_log_id,
       he.healer_participant_id,
       he.target_participant_id,
       he.healing_amount,
       he.overheal_flag
FROM healing_events he
JOIN combat_logs cl
  ON he.combat_log_id = cl.combat_log_id;


-- For status effects
CREATE OR REPLACE VIEW vw_status_efect_events AS
SELECT se.status_effect_id,
       cl.combat_log_id,
       se.source_participant_id,
       se.target_participant_id,
       se.effect_type,
       se.effect_duration_sec
FROM status_effect_events se
JOIN combat_logs cl
  on se.combat_log_id = cl.combat_log_id;



---------------- RANKED & LEADERBOARD (used for seasonal summaries / ranked dashboards) --------------------
-- For rank changes over time
CREATE OR REPLACE VIEW vw_rank_history AS
SELECT rh.rank_history_id,
       p.username,
       r.rank_display_name,
       rh.previous_mmr,
       rh.new_mmr,
       rh.rank_changed_at
FROM player_rank_history rh
JOIN players p
  ON rh.player_id = p.player_id
JOIN rank_tiers r
  ON rh.rank_id = r.rank_id;


-- For leaderboard positions
CREATE OR REPLACE VIEW vw_leaderboard_entries AS
SELECT le.leaderboard_entry_id,
       l.leaderboard_season,
       l.leaderboard_category,
       p.username,
       le.rank_position,
       le.leaderboard_score
FROM leaderboard_entries le
JOIN leaderboards l
  ON le.leaderboard_id = l.leaderboard_id
JOIN players p
  ON le.player_id = p.player_id;



---------------- GUILD & SOCIAL (used in guild management / social dashboards) --------------------
-- For guild + player + role
CREATE OR REPLACE VIEW vw_guild_members AS
SELECT gm.guild_member_id,
       g.guild_name,
       p.username,
       gr.guild_role_name,
       gm.guild_joined_at
FROM guild_members gm
JOIN guilds g
  ON gm.guild_id = g.guild_id
JOIN players p
  ON gm.player_id = p.player_id
JOIN guild_roles gr
  ON gm.guild_role_id = gr.guild_role_id;


-- For guild events
CREATE OR REPLACE VIEW vw_guild_events AS
SELECT ge.guild_event_id,
       g.guild_name,
       ge.guild_event_name,
       ge.guild_event_category,
       ge.guild_event_at
FROM guild_events ge
JOIN guilds g
  ON ge.guild_id = g.guild_id;



---------------- WORLD, MAPS & EVENTS (used in world design tools / event dashboards) --------------------
-- For zones + maps
CREATE OR REPLACE VIEW vw_world_zones AS
SELECT z.zone_id,
       m.map_name,
       z.zone_name,
       z.zone_difficulty
FROM world_zones z
JOIN maps m
  ON z.map_id = m.map_id;


-- For event rewards
CREATE OR REPLACE VIEW vw_event_rewards AS
SELECT er.event_reward_id,
       se.seasonal_event_name,
       i.item_name,
       er.reward_quantity
FROM event_rewards er
JOIN seasonal_events se
  ON er.seasonal_event_id = se.seasonal_event_id
JOIN items i
  ON er.item_id = i.item_id;


-- For those who participated in events
CREATE OR REPLACE VIEW vw_event_participation AS
SELECT ep.event_participation_id,
       se.seasonal_event_name,
       p.username,
       ep.participated_at
FROM event_participation ep
JOIN seasonal_events se
  ON ep.seasonal_event_id = se.seasonal_event_id
JOIN players p
  ON ep.player_id = p.player_id;



---------------- MARKETPLACE (used in marketplace admin tools / economy dashboards) --------------------
-- For items for sale
CREATE OR REPLACE VIEW vw_market_listings AS
SELECT ml.listing_id,
       p.username AS seller,
       i.item_name,
       ml.listing_price,
       ml.listing_quantity,
       ml.listing_created_at
FROM market_listings ml
JOIN players p
  ON ml.seller_player_id = p.player_id
JOIN items i
  ON ml.item_id = i.item_id;


-- For completed sales
CREATE OR REPLACE VIEW vw_market_transactions AS
SELECT mt.market_tx_id,
       pb.username AS buyer,
       ps.username AS seller,
       i.item_name,
       mt.tx_price,
       mt.tx_quantity,
       mt.tx_completed_at
FROM market_transactions mt
JOIN players pb
  ON mt.buyer_player_id = pb.player_id
JOIN players ps
  ON mt.seller_player_id = ps.player_id
JOIN items i
  ON mt.item_id = i.item_id;


-- For price trneds
CREATE OR REPLACE VIEW vw_price_history AS
SELECT ph.price_history_id,
       i.item_name,
       ph.price_amount,
       ph.price_recorded_at
FROM price_history ph
JOIN items i
  ON ph.item_id = i.item_id;


-- For player to player trades
CREATE OR REPLACE VIEW vw_player_trades AS
SELECT pt.trade_id,
       p1.username AS player_one,
       p2.username AS player_two,
       i.item_name,
       pt.trade_quantity,
       pt.trade_at
FROM player_trades pt
JOIN players p1
  ON pt.player_one_id = p1.player_id
JOIN players p2
  ON pt.player_two_id = p2.player_id
JOIN items i
  ON pt.item_id = i.item_id;



---------------- lOGGING & SECUTIRY (used in moderation tools / security dahsboards) -----------------
-- For flagged behavior
CREATE OR REPLACE VIEW vw_suspicious_activity AS
SELECT sa.suspicious_activity_id,
       p.username,
       sa.activity_category,
       sa.activity_text,
       sa.activity_recorded_at
FROM suspicious_activity_logs sa
LEFT JOIN players p
  ON sa.player_id = p.player_id;


-- For admin/player actions
CREATE OR REPLACE VIEW vw_audit_logs AS
SELECT al.audit_log_id,
       p.username,
       al.audit_action,
       al.audit_text,
       al.audit_recorded_at
FROM audit_logs al
LEFT JOIN players p
  ON al.player_id = p.player_id;

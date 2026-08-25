-- CONSTRAINTS FOR STRAYLIGHT --

--- 1. PLAYER AND ACCOUNT SYSTEM ---
ALTER TABLE players 
ADD CONSTRAINT fk_player_profiles_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);


ALTER TABLE player_settings
ADD CONSTRAINT fk_player_settings_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);


ALTER TABLE player_login_history
ADD CONSTRAINT fk_player_login_history_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);


ALTER TABLE player_currency_wallets
ADD CONSTRAINT fk_player_currency_wallets_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);


ALTER TABLE player_transactions
ADD CONSTRAINT fk_player_transactions_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);



--- 2. HEROES, ROLES AND ABILITIES --
ALTER TABLE heroes
ADD CONSTRAINT fk_heroes_role_id
    FOREIGN KEY (role_id)
    REFERENCES hero_roles(role_id);


ALTER TABLE hero_abilities
ADD CONSTRAINT fk_hero_abilities_hero_id
    FOREIGN KEY (hero_id)
    REFERENCES heroes(hero_id);


ALTER TABLE hero_stats_base
ADD CONSTRAINT fk_hero_stats_base_hero_id
    FOREIGN KEY (hero_id)
    REFERENCES heroes(hero_id);


ALTER TABLE hero_unlocks
ADD CONSTRAINT fk_hero_unlocks_hero_id
    FOREIGN KEY (hero_id)
    REFERENCES heroes(hero_id);


ALTER TABLE hero_progression
ADD CONSTRAINT fk_hero_progression_hero_id
    FOREIGN KEY (hero_id)
    REFERENCES heroes(hero_id);

    
ALTER TABLE hero_progression
ADD CONSTRAINT fk_hero_progression_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);




--- 3. CHARACTERS (PLAYER OWNED HEROES) --
ALTER TABLE characters
ADD CONSTRAINT fk_characters_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);


ALTER TABLE characters    
ADD CONSTRAINT fk_characters_hero_id
    FOREIGN KEY (hero_id)
    REFERENCES heroes(hero_id);


ALTER TABLE character_stats_dynamic
ADD CONSTRAINT fk_character_stats_dynamic_character_id
    FOREIGN KEY (character_id)
    REFERENCES characters(character_id);


ALTER TABLE character_equipment_slots
ADD CONSTRAINT fk_character_equipment_slots_character_id
    FOREIGN KEY (character_id)
    REFERENCES characters(character_id);


ALTER TABLE character_skill_loadouts
ADD CONSTRAINT fk_character_skill_loadouts_character_id
    FOREIGN KEY (character_id)
    REFERENCES characters(character_id);


ALTER TABLE character_level_history
ADD CONSTRAINT fk_character_level_history_character_id
    FOREIGN KEY (character_id)
    REFERENCES characters(character_id);



--- 4. WEAPONS, ITEMS AND INVENTORY ---
ALTER TABLE weapons
ADD CONSTRAINT fk_weapons_weapon_type_id
    FOREIGN KEY (weapon_type_id)
    REFERENCES weapon_types(weapon_type_id);


ALTER TABLE weapons
ADD CONSTRAINT fk_weapons_weapon_rarity_id
    FOREIGN KEY (weapon_rarity_id)
    REFERENCES weapon_rarity(weapon_rarity_id);


ALTER TABLE weapon_mods
ADD CONSTRAINT fk_weapon_mods_mode_type_id
    FOREIGN KEY (mod_type_id)
    REFERENCES weapon_mod_types(mod_type_id);


ALTER TABLE weapon_mods
ADD CONSTRAINT fk_weapon_mods_weapon_id
    FOREIGN KEY (weapon_id)
    REFERENCES weapons(weapon_id);


ALTER TABLE items
ADD CONSTRAINT fk_items_item_type_id
    FOREIGN KEY (item_type_id)
    REFERENCES item_types(item_type_id);


ALTER TABLE items
ADD CONSTRAINT fk_items_item_rarity_id
    FOREIGN KEY (item_rarity_id)
    REFERENCES item_rarity(item_rarity_id);


ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);


ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_item_id
    FOREIGN KEY (item_id)
    REFERENCES items(item_id);


ALTER TABLE inventory_transactions
ADD CONSTRAINT fk_inventory_transactions_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);


ALTER TABLE inventory_transactions
ADD CONSTRAINT fk_inventory_transactions_item_id
    FOREIGN KEY (item_id)
    REFERENCES items(item_id);


ALTER TABLE crafting_recipes
ADD CONSTRAINT fk_crafting_recipes_item_id
    FOREIGN KEY (item_id)
    REFERENCES items(item_id);


ALTER TABLE crafting_requirements
ADD CONSTRAINT fk_crafting_requirements_recipe_id
    FOREIGN KEY (recipe_id)
    REFERENCES crafting_recipes(recipe_id);


ALTER TABLE crafting_requirements
ADD CONSTRAINT fk_crafting_requirements_item_id
    FOREIGN KEY (item_id)
    REFERENCES items(item_id);


ALTER TABLE crafted_items_log
ADD CONSTRAINT fk_crafted_items_log_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);


ALTER TABLE crafted_items_log
ADD CONSTRAINT fk_crafted_items_log_recipe_id
    FOREIGN KEY (recipe_id)
    REFERENCES crafting_recipes(recipe_id);



--- 5. MATCHS, TEAMS AND COMBAT LOGS ---
ALTER TABLE matches
ADD CONSTRAINT fk_matches_mode_id
    FOREIGN KEY (mode_id)
    REFERENCES match_modes(mode_id);
    

ALTER TABLE matches
ADD CONSTRAINT fk_matches_map_id
    FOREIGN KEY (map_id)
    REFERENCES maps(map_id);

ALTER TABLE match_teams
ADD CONSTRAINT fk_match_teams_match_id
    FOREIGN KEY (match_id)
    REFERENCES matches(match_id);


ALTER TABLE match_participants
ADD CONSTRAINT fk_match_participants_match_id
    FOREIGN KEY (match_id)
    REFERENCES matches(match_id);


ALTER TABLE match_participants
ADD CONSTRAINT fk_match_participants_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);

    
ALTER TABLE match_participants
ADD CONSTRAINT fk_match_participants_hero_id
    FOREIGN KEY (hero_id)
    REFERENCES heroes(hero_id);


ALTER TABLE match_participants
ADD CONSTRAINT fk_match_participants_match_team_id
    FOREIGN KEY (match_team_id)
    REFERENCES match_teams(match_team_id);


ALTER TABLE match_stats
ADD CONSTRAINT fk_match_stats_participant_id
    FOREIGN KEY (participant_id)
    REFERENCES match_participants(participant_id);


ALTER TABLE combat_logs
ADD CONSTRAINT fk_combat_logs_match_id
    FOREIGN KEY (match_id)
    REFERENCES matches(match_id);


ALTER TABLE damage_events
ADD CONSTRAINT fk_damage_events_combat_log_id
    FOREIGN KEY (combat_log_id)
    REFERENCES combat_logs(combat_log_id);


ALTER TABLE damage_events
ADD CONSTRAINT fk_damage_events_attacker_participant_id
    FOREIGN KEY (attacker_participant_id)
    REFERENCES match_participants(participant_id);


ALTER TABLE damage_events
ADD CONSTRAINT fk_damage_events_target_participant_id
    FOREIGN KEY (target_participant_id)
    REFERENCES match_participants(participant_id);


ALTER TABLE healing_events
ADD CONSTRAINT fk_healing_events_combat_log_id
    FOREIGN KEY (combat_log_id)
    REFERENCES combat_logs(combat_log_id);


ALTER TABLE healing_events
ADD CONSTRAINT fk_healing_events_healer_participant_id
    FOREIGN KEY (healer_participant_id)
    REFERENCES match_participants(participant_id);


ALTER TABLE healing_events
ADD CONSTRAINT fk_healing_events_target_participant_id
    FOREIGN KEY (target_participant_id)
    REFERENCES match_participants(participant_id);


ALTER TABLE status_effect_events
ADD CONSTRAINT fk_status_effect_events_combat_log_id
    FOREIGN KEY (combat_log_id)
    REFERENCES combat_logs(combat_log_id);


ALTER TABLE status_effect_events
ADD CONSTRAINT fk_status_effect_events_source_participant_id
    FOREIGN KEY (source_participant_id)
    REFERENCES match_participants(participant_id);


ALTER TABLE status_effect_events
ADD CONSTRAINT fk_status_effect_events_target_participant_id
    FOREIGN KEY (target_participant_id)
    REFERENCES match_participants(participant_id);




--- 6. RANKED SYSTEM AND LEADERBOARDS ---
ALTER TABLE player_rank_history
ADD CONSTRAINT fk_player_rank_history_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);


ALTER TABLE player_rank_history
ADD CONSTRAINT fk_player_rank_history_rank_id
    FOREIGN KEY (rank_id)
    REFERENCES rank_tiers(rank_id);


ALTER TABLE leaderboard_entries
ADD CONSTRAINT fk_leaderboard_entries_leaderboard_id    
    FOREIGN KEY (leaderboard_id)
    REFERENCES leaderboards(leaderboard_id);


ALTER TABLE leaderboard_entries  
ADD CONSTRAINT fk_leaderboard_entries_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);



--- 7. GUILDS AND SOCIAL SYSTEMS ---
ALTER TABLE guild_members
ADD CONSTRAINT fk_guild_members_guild_id
    FOREIGN KEY (guild_id)
    REFERENCES guilds(guild_id);


ALTER TABLE guild_members
ADD CONSTRAINT fk_guild_members_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);


ALTER TABLE guild_members
ADD CONSTRAINT fk_guild_members_guild_role_id
    FOREIGN KEY (guild_role_id)
    REFERENCES guild_roles(guild_role_id);


ALTER TABLE guild_events
ADD CONSTRAINT fk_guild_events_guild_id
    FOREIGN KEY (guild_id)
    REFERENCES guilds(guild_id);



--- 8. WORLD, MAPS AND EVENTS ---
ALTER TABLE world_zones
ADD CONSTRAINT fk_world_zones_map_id
    FOREIGN KEY (map_id)
    REFERENCES maps(map_id);


ALTER TABLE event_rewards
ADD CONSTRAINT fk_event_rewards_seasonal_event_id
    FOREIGN KEY (seasonal_event_id)
    REFERENCES seasonal_events(seasonal_event_id);


ALTER TABLE event_rewards
ADD CONSTRAINT fk_event_rewards_item_id
    FOREIGN KEY (item_id)
    REFERENCES items(item_id);


ALTER TABLE event_participation
ADD CONSTRAINT fk_event_participation_seasonal_event_id
    FOREIGN KEY (seasonal_event_id)
    REFERENCES seasonal_events(seasonal_event_id);


ALTER TABLE event_participation
ADD CONSTRAINT fk_event_participation_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);



--- 9. ECONOMY AND MARKETPLACE ---
ALTER TABLE market_listings
ADD CONSTRAINT fk_market_listings_seller_player_id
    FOREIGN KEY (seller_player_id)
    REFERENCES players(player_id);


ALTER TABLE market_listings
ADD CONSTRAINT fk_market_listings_item_id
    FOREIGN KEY (item_id)
    REFERENCES items(item_id);


ALTER TABLE market_transactions
ADD CONSTRAINT fk_market_transactions_buyer_player_id
    FOREIGN KEY (buyer_player_id)
    REFERENCES players(player_id);


ALTER TABLE market_transactions
ADD CONSTRAINT fk_market_transactions_seller_player_id
    FOREIGN KEY (seller_player_id)
    REFERENCES players(player_id);


ALTER TABLE market_transactions
ADD CONSTRAINT fk_market_transactions_item_id
    FOREIGN KEY (item_id)
    REFERENCES items(item_id);


ALTER TABLE price_history
ADD CONSTRAINT fk_price_history_item_id
    FOREIGN KEY (item_id)
    REFERENCES items(item_id);


ALTER TABLE player_trades
ADD CONSTRAINT fk_player_trades_player_one_id
    FOREIGN KEY (player_one_id)
    REFERENCES players(player_id);


ALTER TABLE player_trades
ADD CONSTRAINT fk_player_trades_player_two_id
    FOREIGN KEY (player_two_id)
    REFERENCES players(player_id);


ALTER TABLE player_trades
ADD CONSTRAINT fk_player_trades_item_id
    FOREIGN KEY (item_id)
    REFERENCES items(item_id);



--- 10. LOGGING AND SECURITY ---
ALTER TABLE suspicious_activity_logs
ADD CONSTRAINT fk_suspicious_activity_logs_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);


ALTER TABLE audit_logs
ADD CONSTRAINT fk_audit_logs_player_id
    FOREIGN KEY (player_id)
    REFERENCES players(player_id);
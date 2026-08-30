------------------ PLAYER & ACCOUNT SYSTEM -----------------------
-- Players: email + username are comon lookup fields
CREATE INDEX idx_players_email ON players(email);
-- Used for longin, account recovery and uniqueness checks

CREATE INDEX idx_players_username ON players(username);
-- Fast lookup when searching players by username


--Player profiles: FK lookups
CREATE INDEX idx_profiles_player_id ON player_profiles(player_id);
-- Speeds up joins to players and profile retrieval


-- Player settings: FK lookup
CREATE INDEX idx_settings_player_id ON player_settings(player_id);
-- Fast retrieval of settings per player


-- Login history: FK + the timestamp
CREATE INDEX idx_login_history_player_id ON player_login_history(player_id);
-- Common for analytical reasons like login frequency 

CREATE INDEX idx_login_history_login_at ON player_login_history(login_at);
-- Time-based filtering potentially for daily or weekly login reporting


-- Currency wallets: FK + the timestamp
CREATE INDEX idx_wallets_updated_at ON player_currency_wallets(player_id);
-- Fast wallet lookup

CREATE INDEX idx_wallets_updated_at ON player_currency_wallets(wallet_updated_at);
-- Potentially useful for currency flow over a period of time


-- Player transaction: FK + the timestamp + the category
CREATE INDEX idx_transaction_player_id ON player_transactions(player_id);
-- Player purchasing history 

CREATE INDEX idx_transactions_at ON player_transactions(transaction_at);
-- Time-based analytics

CREATE INDEX idx_transactions_category ON player_transactions(transaction_category);
-- Filtering by the spending type like upgrades or player skins etc...



------------------ HEROES, ROLES & ABILITIES -----------------------
-- Heroes: Fk lookup
CREATE INDEX idx_heroes_role_id ON heroes(role_id);
-- Faster filtering by roles like support, DPS etc...

-- Abilities: FK lookup + the category
CREATE INDEX idx_abilities_hero_id ON hero_abilities(hero_id);
-- Ability lists per her0

CREATE INDEX idx_abilities_category ON hero_abilities(ability_category);
-- Filtering abilities by the type like passive, ultimate etc...


-- Hero stats base: PK is already indexed (hero_id) thus no more indexes needed


-- Hero unlocks: FK lookup + the rarity
CREATE INDEX idx_unlocks_hero_id ON hero_unlocks(hero_id);
-- Unlocks per hero

CREATE INDEX idx_unlocks_rarity ON hero_unlocks(rarity_level);
-- Filtering unlocks by the rarity for analytical purposes


-- Hero progression: FK lookups + the timestamp
CREATE INDEX idx_progression_hero_id ON hero_progression(hero_id);
-- Hero mastery for analytical purposes

CREATE INDEX idx_progression_player_id ON hero_progression(player_id);
-- Player progression for analytical purposes

CREATE INDEX idx_progression_updated_at ON hero_progression(mastery_updated_at);
-- Time-based progression tracking for analytical purposes



------------------ HEROES, ROLES & ABILITIES -----------------------
-- Characters: FK lookups
CREATE INDEX idx_characters_player_id ON characters(player_id);
-- Player to character lookup

CREATE INDEX idx_characters_hero_id ON characters(hero_id);
-- Hero usage for analytical purposes


-- Dynamic stats: FK is already in use (character_id) thus no further indexing


-- Equipment slots: FK lookup
CREATE INDEX idx_equipment_character_id ON character_equipment_slots(character_id);
-- Equipment retrieval per character


-- Skill loadouts: FK lookup
CREATE INDEX idx_loadouts_character_id ON character_skill_loadouts(character_id);
-- Loadout retrieval per character


-- Level history: FK + the timestamp
CREATE INDEX idx_level_history_character_id ON character_level_history(character_id);
-- Level-up for analytical purposes

CREATE INDEX idx_level_history_changed_at ON character_level_history(level_changed_at);
-- Time-based progression for analytical purposes



------------------ WEAPONS, ITEMS & INVENTORY -----------------------
-- Weapons: FK lookups
CREATE INDEX idx_weapons_type_id ON weapons(weapon_type_id);
-- Filtering weapons by their type

CREATE INDEX idx_weapons_rarity_id ON weapons(weapon_rarity_id);
-- Filtering weapons by their rarity


-- Weapon mods: FK lookups
CREATE INDEX idx_mods_weapon_id ON weapon_mods(weapon_id);
-- Mods per weapon

CREATE INDEX idx_mods_type_id ON weapon_mods(mod_type_id);
-- Filtering mods by their type


-- Items: FK lookups
CREATE INDEX idx_items_type_id ON items(item_type_id);
-- Filtering items by their type

CREATE INDEX idx_items_rarity_id ON items(item_rarity_id);
-- Filtering items by their rarity


-- Inventory: FK lookups
CREATE INDEX idx_inventory_player_id ON inventory(player_id);
-- Player inventory lookup

CREATE INDEX idx_inventory_item_id ON inventory(item_id);
-- Item usage for analytical purposes

-- Inventory transactions: FK + the timestamp
CREATE INDEX idx_inv_tx_player_id ON inventory_transactions(player_id);
-- Player inventory change history

CREATE INDEX idx_inv_tx_item_id ON inventory_transactions(item_id);
-- Item flow for analytical purposes

CREATE INDEX idx_inv_tx_at ON inventory_transactions(inv_tx_at);
-- Time-based inventory for analytical purposes


-- Crafting recipes: FK lookup
CREATE INDEX idx_recipes_item_id ON crafting_recipes(item_id);
-- Crafting recipe lookup

-- Crafting requirements: FK lookups
CREATE INDEX idx_requirements_recipe_id ON crafting_requirements(recipe_id);
-- Requirements per recipe

CREATE INDEX idx_requirements_item_id ON crafting_requirements(item_id);
-- Items required for analytical purposes

-- Crafted items log: FK + the timestamp
CREATE index idx_crafted_player_id ON crafted_items_log(player_id);
-- Player crafting for analytical purposes

CREATE INDEX idx_crafted_recipe_id ON crafted_items_log(recipe_id);
-- Recipe usage for analytical purposes

CREATE INDEX idx_crafted_at ON crafted_items_log(crafted_at);
-- Time-based crafting analytics



------------------ MATCHES, TEAMS & COMBAT LOGS -----------------------
-- Matches: FK lookups + the timestamp
CREATE INDEX idx_matches_mode_id ON matches(mode_id);
-- Filtering matches by mode

CREATE INDEX idx_matches_map_id ON matches(map_id);
-- Filtering matches by map

CREATE INDEX idx_matches_start_at ON matches(match_start_at);
-- Time-based match for analytical purposes


-- Match teams: FK lookup
CREATE INDEX idx_match_teams_match_id ON match_teams(match_id);
-- Teams per match


-- Match participants: FK lookups
CREATE INDEX idx_participants_match_id ON match_participants(match_id);
-- Participants per match

CREATE INDEX idx_participants_player_id ON match_participants(player_id);
-- Player match history

CREATE INDEX idx_participants_hero_id ON match_participants(hero_id);
-- Hero picks for analytical purposes


-- Match stats: FK lookups
CREATE INDEX idx_combat_logs_match_id ON combat_logs(match_id);
-- Combat logs per match

CREATE INDEX idx_combat_logs_event_at ON combat_logs(combat_event_at);
-- Time-based combat analytics


-- Damage events: FK lookups
CREATE INDEX idx_damage_combat_log_id ON damage_events(combat_log_id);
-- Damage events per combat log

CREATE INDEX idx_damage_attacker_id ON damage_events(attacker_participant_id);
-- Damage done for analytical purposes

CREATE INDEX idx_damage_target_id ON damage_events(target_participant_id);
-- Damage taken for analytical purposes


-- Healing events: FK lookups
CREATE INDEX idx_healing_combat_log_id ON healing_events(combat_log_id);
-- Healing events per combat log

CREATE INDEX idx_healing_healer_id ON healing_events(healer_participant_id);
-- Healing done for analytical purposes

CREATE INDEX idx_healing_target_id ON healing_events(target_participant_id);
-- Healing recieved for analytical purposes


-- Status effects: FK lookups
CREATE INDEX idx_status_combat_logs ON status_effect_events(combat_log_id);
-- Status effects per combat log

CREATE INDEX idx_status_source_id ON status_effect_events(source_participant_id);
-- Status applied for analytical purposes

CREATE INDEX idx_status_target_id ON status_effect_events(target_participant_id);
-- Status received for analytical purposes



------------------ RANKED SYSTEM & LEADERBOARDS -----------------------
-- Rank history: FK + the timestamp
CREATE INDEX idx_rank_history_player_id ON player_rank_history(player_id);
-- Player rank progression for analytical purposes

CREATE INDEX idx_rank_history_rank_id ON player_rank_history(rank_id);
-- Rank distribution for analytical purposes

CREATE INDEX idx_rank_history_changed_at ON player_rank_history(rank_changed_at);
-- Time-based rank for analytical purposes


-- Leaderboard entries: FK + rank position
CREATE INDEX idx_lb_entries_leaderboard_id ON leaderboard_entries(leaderboard_id);
-- Entries per leaderboard

CREATE INDEX idx_lb_entries_player_id ON leaderboard_entries(player_id);
-- Player per leaderboard

CREATE INDEX idx_lb_entries_rank_position ON leaderboard_entries(rank_position);
-- Sorting leaderboard entries



------------------ GUILDS & SOCIAL SYSTEMS -----------------------
-- Guild members: FK lookups
CREATE INDEX idx_guild_members_guild_id ON guild_members(guild_id);
-- Members per guild

CREATE INDEX idx_guild_members_player_id ON guild_members(player_id);
-- Player guild history

CREATE INDEX idx_guild_members_role_id ON guild_members(guild_role_id);
-- Role usage for analytical purposes


-- Guild events: FK + the timstamp
CREATE INDEX idx_guild_events_guild_id ON guild_events(guild_id);
-- Events per guild

CREATE INDEX idx_guild_events_at ON guild_events(guild_event_id);
-- Time-based guild activity analytics



------------------ WORLD, MAPS & EVENTS -----------------------
-- World zones: FK lookup
CREATE INDEX idx_zones_map_id ON world_zones(map_id);
-- Zones per map


-- Event rewards: FK lookups
CREATE INDEX idx_event_rewards_event_id ON event_rewards(seasonal_event_id);
-- Rewards per event

CREATE INDEX idx_event_rewards_item_id ON event_rewards(item_id);
-- Item reward for analytical purposes


-- Event participation: FK + the timestmap
CREATE INDEX idx_event_participation_event_id ON event_participation(seasonal_event_id);
-- Participation per event

CREATE INDEX idx_event_participation_player_id ON event_participation(player_id);
-- Players event history

CREATE INDEX idx_event_participation_at ON event_participation(participated_at);
-- Time-based event for analytical purposes



------------------ ECONOMY & MARKETPLACE -----------------------
-- Market listings: FK + the timestamp
CREATE INDEX idx_listings_seller_id ON market_listings(seller_player_id);
-- Listings per seller

CREATE INDEX idx_listings_item_id ON market_listings(item_id);
-- Item listing for analytical purposes

CREATE INDEX idx_listings_created_at ON market_listings(listing_created_at);
-- Time-based listing for analytical purposes


-- Market transactions: FK + the timestamp
CREATE INDEX idx_market_tx_buyer_id ON market_transactions(buyer_player_id);
-- Buyer for analytical purposes

CREATE INDEX idx_market_tx_seller_id ON market_transactions(seller_player_id);
-- Seller for analytical purposes

CREATE INDEX idx_market_tx_items_id ON market_transactions(item_id);
-- Item trades for analytical purposes

CREATE INDEX idx_market_tx_completed_at ON market_transactions(tx_completed_at);
-- Time-based market for analytical purposes


-- Price history: FK + the timestamp
CREATE INDEX idx_trades_player_one_id ON player_trades(player_one_id);
-- Player trade for analytical purposes

CREATE INDEX idx_trades_player_two_id ON player_trades(player_two_id);
-- Player trade for analytical purposes

CREATE INDEX idx_trades_item_id ON player_trades(item_id);
-- Item trade for analytical purposes



------------------ LOGGING & SECURITY -----------------------
-- Suspicious activity: FK + the timestamp
CREATE INDEX idx_suspicious_player_id ON suspicious_activity_logs(player_id);
-- Player security for analytical purposes

CREATE INDEX idx_suspicious_recorded_at ON suspicious_activity_logs(activity_recorded_at);
-- Tine-based security for analytical purposes


-- Audit logs: FK + the timestamp
CREATE INDEX idx_audit_player_id ON audit_logs(player_id);
-- Player audit history

CREATE INDEX idx_audit_recorded_at ON audit_logs(audit_recorded_at);
-- Time-baed audit for analytical purposes

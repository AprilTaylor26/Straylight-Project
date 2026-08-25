-- CREATION OF TABLES --

--- 1. PLAYER AND ACCOUNT SYSTEM ---
CREATE TABLE players (
    player_id           NUMBER(10) PRIMARY KEY,
    username            VARCHAR2(50),
    email               VARCHAR2(100),
    password_hash       VARCHAR2(255),
    account_created_at  TIMESTAMP,
    account_status      VARCHAR2(20)
);



CREATE TABLE player_profiles (
    profile_id      NUMBER(10) PRIMARY KEY,
    player_id       NUMBER(10), --FK
    display_name    VARCHAR2(50),
    region          VARCHAR2(50),
    preferred_role  VARCHAR2(50),
    bio_text        CLOB
);


CREATE TABLE player_settings (
    settings_id         NUMBER(10) PRIMARY KEY,
    player_id           NUMBER(10), --FK
    mouse_sensitivity   NUMBER(5,2),
    keybind_profile     VARCHAR2(50),
    graphics_quality    VARCHAR2(20),
    audio_master_level  NUMBER(3),
    audio_effects_level NUMBER(3)
);


CREATE TABLE player_login_history (
    login_id        NUMBER(10) PRIMARY KEY,
    player_id       NUMBER(10), --FK
    login_at        TIMESTAMP,
    logout_at       TIMESTAMP,
    device_type     VARCHAR2(50),
    ip_address      VARCHAR2(45)
);


CREATE TABLE player_currency_wallets (
    wallet_id           NUMBER(10) PRIMARY KEY,
    player_id           NUMBER(10), --FK
    gold_amount         NUMBER(12,2),
    premium_amount      NUMBER(12,2),
    wallet_updated_at   TIMESTAMP
);


CREATE TABLE player_transactions (
    transaction_id          NUMBER(10) PRIMARY KEY,
    player_id               NUMBER(10), --FK
    transaction_category    VARCHAR2(50),
    transaction_amount      NUMBER(12,2),
    currency_type           VARCHAR2(20),
    transaction_at          TIMESTAMP
);



--- 2. HEROES, ROLES AND ABILITIES --
CREATE TABLE hero_roles (
    role_id             NUMBER(10) PRIMARY KEY,
    role_display_name   VARCHAR2(50),
    role_description    CLOB
);


CREATE TABLE heroes (
    hero_id             NUMBER(10) PRIMARY KEY,
    role_id             NUMBER(10), --FK
    hero_name           VARCHAR2(50),
    hero_lore_text      CLOB,
    difficulty_rating   NUMBER(2)
);



CREATE TABLE hero_abilities (
    ability_id          NUMBER(10) PRIMARY KEY,
    hero_id             NUMBER(10), --FK
    ability_name        VARCHAR2(50),     
    ability_category    VARCHAR2(50),
    cooldown_seconds    NUMBER(5),
    base_damage         NUMBER(5),
    base_healing        NUMBER(5),
    ability_description CLOB
);


CREATE TABLE hero_stats_base (
    hero_id             NUMBER(10) PRIMARY KEY, --FK
    base_hp             NUMBER(5),
    base_armor          NUMBER(5),
    base_speed          NUMBER(5),
    base_damage_output  NUMBER(5)
);


CREATE TABLE hero_unlocks (
    unlock_id           NUMBER(10) PRIMARY KEY,
    hero_id             NUMBER(10), --FK
    unlock_category     VARCHAR2(50),
    unlock_name         VARCHAR2(50),
    rarity_level        NUMBER(3),
    unlock_requirement_text CLOB
);



CREATE TABLE hero_progression (
    progression_id  NUMBER(10) PRIMARY KEY,
    hero_id         NUMBER(10), --FK
    player_id       NUMBER(10), --FK
    mastery_level   NUMBER(3),
    mastery_xp      NUMBER(10),
    mastery_updated_at  TIMESTAMP
);




--- 3. CHARACTERS (PLAYER OWNED HEROES) --
CREATE TABLE characters (
    character_id        NUMBER(10) PRIMARY KEY,
    player_id           NUMBER(10), --FK
    hero_id             NUMBER(10), --FK
    character_level     NUMBER(3),
    character_xp        NUMBER(10),
    character_created_at    TIMESTAMP
);


CREATE TABLE character_stats_dynamic (
    character_id    NUMBER(10) PRIMARY KEY, --FK
    current_hp      NUMBER(5),
    current_armor   NUMBER(5),
    current_damage_output   NUMBER(5),
    current_speed   NUMBER(5)
);


CREATE TABLE character_equipment_slots (
    slot_id         NUMBER(10) PRIMARY KEY,
    character_id    NUMBER(10), --FK
    slot_category       VARCHAR2(50),
    equipped_item_id    NUMBER(10) NULL,
    equipped_weapon_id  NUMBER(10) NULL
);


CREATE TABLE character_skill_loadouts (
    loadout_id      NUMBER(10) PRIMARY KEY,
    character_id    NUMBER(10), --FK
    ability_slot_1  NUMBER(10),
    ability_slot_2  NUMBER(10),
    ability_slot_3  NUMBER(10),
    passive_skil_id NUMBER(10)    
);


CREATE TABLE character_level_history (
    level_history_id    NUMBER(10) PRIMARY KEY,
    character_id        NUMBER(10), --FK
    previous_level      NUMBER(3),
    new_level           NUMBER(3),
    level_changed_at    TIMESTAMP
);



--- 4. WEAPONS, ITEMS AND INVENTORY ---
CREATE TABLE weapon_types (
    weapon_type_id          NUMBER(10) PRIMARY KEY,
    weapon_type_name        VARCHAR2(50),
    weapon_type_description CLOB
);


CREATE TABLE weapon_rarity (    
    weapon_rarity_id      NUMBER(10) PRIMARY KEY,
    weapon_rarity_name    VARCHAR2(50),
    weapon_rarity_color   VARCHAR2(20)
);


CREATE TABLE weapons (
    weapon_id           NUMBER(10) PRIMARY KEY,
    weapon_type_id      NUMBER(10), --FK
    weapon_rarity_id    NUMBER(10), --FK
    weapon_name         VARCHAR2(50),
    weapon_base_damage  NUMBER(5),
    weapon_fire_rate    NUMBER(5,2),
    weapon_reload_sec   NUMBER(5,2)
);


CREATE TABLE weapon_mod_types (
    mod_type_id             NUMBER(10) PRIMARY KEY,
    mod_type_name           VARCHAR2(50),
    mod_type_description    CLOB
);

CREATE TABLE weapon_mods (
    mod_id              NUMBER(10) PRIMARY KEY,
    mod_type_id         NUMBER(10), --FK
    weapon_id           NUMBER(10), --FK
    mod_name            VARCHAR2(50),
    mod_effect_text     CLOB,
    mod_stat_bonus      NUMBER(5)
);

 
CREATE TABLE item_types (
    item_type_id            NUMBER(10) PRIMARY KEY,
    item_type_name          VARCHAR2(50),
    item_type_description   CLOB --FK
);



CREATE TABLE item_rarity (
    item_rarity_id      NUMBER(10) PRIMARY KEY,
    item_rarity_name    VARCHAR2(50),
    item_rarity_color   VARCHAR2(20)
);


CREATE TABLE items (
    item_id             NUMBER(10) PRIMARY KEY,
    item_type_id        NUMBER(10), --FK
    item_rarity_id      NUMBER(10), --FK
    item_name           VARCHAR2(50),
    item_description    CLOB,
    item_stack_limit    NUMBER(5)
);

CREATE TABLE inventory (
    inventory_id    NUMBER(10) PRIMARY KEY,
    player_id       NUMBER(10), --FK
    item_id         NUMBER(10), --FK
    item_quantity   NUMBER(5)
);


CREATE TABLE inventory_transactions (
    inv_tx_id           NUMBER(10) PRIMARY KEY,
    player_id           NUMBER(10), --FK
    item_id             NUMBER(10), --FK
    inv_tx_category    VARCHAR2(50),
    quantity_change     NUMBER(5),
    inv_tx_at           TIMESTAMP
);


CREATE TABLE crafting_recipes (
    recipe_id       NUMBER(10) PRIMARY KEY,
    item_id         NUMBER(10), --FK
    output_quantity NUMBER(5)
);


CREATE TABLE crafting_requirements (
    requirement_id      NUMBER(10) PRIMARY KEY,
    recipe_id           NUMBER(10), --FK
    item_id             NUMBER(10), --FK
    required_quantity   NUMBER(5)
);


CREATE TABLE crafted_items_log (
    crafted_id      NUMBER(10) PRIMARY KEY,
    player_id       NUMBER(10), --FK
    recipe_id       NUMBER(10), --FK
    crafted_at      TIMESTAMP
);



--- 5. MATCHS, TEAMS AND COMBAT LOGS ---
CREATE TABLE match_modes (
    mode_id             NUMBER(10) PRIMARY KEY,
    mode_name           VARCHAR2(50),
    mode_description    CLOB,
    mode_is_team_based  CHAR(1) --Y/N
);


CREATE TABLE matches ( 
    match_id        NUMBER(10) PRIMARY KEY,
    mode_id         NUMBER(10), --FK
    map_id          NUMBER(10), --FK
    match_start_at  TIMESTAMP,
    match_end_at    TIMESTAMP
);


CREATE TABLE match_teams (
    match_team_id       NUMBER(10) PRIMARY KEY,
    match_id            NUMBER(10), --FK
    team_display_name   VARCHAR2(50),
    team_color_hex      VARCHAR2(10)
);


CREATE TABLE match_participants (
    participant_id      NUMBER(10) PRIMARY KEY,
    match_id            NUMBER(10), --FK
    player_id           NUMBER(10), --FK
    hero_id             NUMBER(10), --FK
    match_team_id       NUMBER(10) NULL, --FK
    participant_score   NUMBER(5)
);


CREATE TABLE match_stats (
    match_stats_id  NUMBER(10) PRIMARY KEY,
    participant_id  NUMBER(10), --FK
    kills           NUMBER(5),
    assists         NUMBER(5),
    deaths          NUMBER(5),
    damage_done     NUMBER(10),
    healing_done    NUMBER(10)
);



CREATE TABLE combat_logs (
    combat_log_id           NUMBER(10) PRIMARY KEY,
    match_id                NUMBER(10), --FK
    combat_event_at         TIMESTAMP,
    combat_event_category   VARCHAR2(50)
);


CREATE TABLE damage_events (
    damage_event_id         NUMBER(10) PRIMARY KEY,
    combat_log_id           NUMBER(10), --FK
    attacker_participant_id NUMBER(10), --FK
    target_participant_id   NUMBER(10), --FK
    damage_amount           NUMBER(5),
    is_critical_hit         NUMBER(1)
);


CREATE TABLE healing_events (
    healing_event_id        NUMBER(10) PRIMARY KEY,
    combat_log_id           NUMBER(10), --FK
    healer_participant_id   NUMBER(10), --FK
    target_participant_id   NUMBER(10), --FK
    healing_amount          NUMBER(5),
    overheal_flag           NUMBER(1)
);



CREATE TABLE status_effect_events (
    status_effect_id    NUMBER(10) PRIMARY KEY,
    combat_log_id       NUMBER(10), --FK
    source_participant_id   NUMBER(10), --FK
    target_participant_id   NUMBER(10), --FK
    effect_type             VARCHAR2(50),
    effect_duration_sec     NUMBER(5)
);


--- 6. RANKED SYSTEM AND LEADERBOARDS ---
CREATE TABLE rank_tiers (
    rank_id             NUMBER(10) PRIMARY KEY,
    rank_display_name   VARCHAR2(50),
    mmr_min             NUMBER(5),
    mmr_max             NUMBER(5)
);


CREATE TABLE player_rank_history (
    rank_history_id     NUMBER(10) PRIMARY KEY,
    player_id           NUMBER(10), --FK
    rank_id             NUMBER(10), --FK
    previous_mmr        NUMBER(5),
    new_mmr             NUMBER(5),
    rank_changed_at     TIMESTAMP
);


CREATE TABLE leaderboards (
    leaderboard_id      NUMBER(10) PRIMARY KEY,
    leaderboard_season  VARCHAR2(20),
    leaderboard_category VARCHAR2(50)
);


CREATE TABLE leaderboard_entries (
    leaderboard_entry_id    NUMBER(10) PRIMARY KEY,
    leaderboard_id          NUMBER(10), --FK
    player_id               NUMBER(10), --FK
    rank_position           NUMBER(5),
    leaderboard_score       NUMBER(10)
);



--- 7. GUILDS AND SOCIAL SYSTEMS ---
CREATE TABLE guilds (
    guild_id            NUMBER(10) PRIMARY KEY,
    guild_name          VARCHAR2(50),
    guild_motto_text    CLOB,
    guild_created_at    TIMESTAMP
);


CREATE TABLE guild_roles (
    guild_role_id           NUMBER(10) PRIMARY KEY,
    guild_role_name         VARCHAR2(50),
    guild_role_permissions  CLOB
);


CREATE TABLE guild_members (
    guild_member_id     NUMBER(10) PRIMARY KEY,
    guild_id            NUMBER(10), --FK
    player_id           NUMBER(10), --FK
    guild_role_id       NUMBER(10), --FK
    guild_joined_at     TIMESTAMP
);


CREATE TABLE guild_events (
    guild_event_id          NUMBER(10) PRIMARY KEY,
    guild_id                NUMBER(10), --FK
    guild_event_name        VARCHAR2(50),
    guild_event_category    VARCHAR2(50),
    guild_event_at          TIMESTAMP
);



--- 8. WORLD, MAPS AND EVENTS ---
CREATE TABLE maps (
    map_id              NUMBER(10) PRIMARY KEY,
    map_name            VARCHAR2(50),
    map_environment     VARCHAR2(50),
    map_description     CLOB
);


CREATE TABLE world_zones (
    zone_id         NUMBER(10) PRIMARY KEY,
    map_id          NUMBER(10), --FK
    zone_name       VARCHAR2(50),
    zone_difficulty NUMBER(3)
);


CREATE TABLE seasonal_events (
    seasonal_event_id       NUMBER(10) PRIMARY KEY,
    seasonal_event_name     VARCHAR2(50),
    seasonal_event_start    DATE,
    seasonal_event_end      DATE
);


CREATE TABLE event_rewards (
    event_reward_id     NUMBER(10) PRIMARY KEY,
    seasonal_event_id   NUMBER(10), --FK
    item_id             NUMBER(10), --FK
    reward_quantity     NUMBER(5)
);


CREATE TABLE event_participation (
    event_participation_id  NUMBER(10) PRIMARY KEY,
    seasonal_event_id       NUMBER(10), --FK
    player_id               NUMBER(10), --FK
    participated_at         TIMESTAMP
);


--- 9. ECONOMY AND MARKETPLACE ---
CREATE TABLE market_listings (
    listing_id          NUMBER(10) PRIMARY KEY,
    seller_player_id    NUMBER(10), --FK
    item_id             NUMBER(10), --FK
    listing_price       NUMBER(12,2),
    listing_quantity    NUMBER(5),
    listing_created_at  TIMESTAMP
);


CREATE TABLE market_transactions (
    market_tx_id        NUMBER(10) PRIMARY KEY,
    buyer_player_id     NUMBER(10), --FK
    seller_player_id    NUMBER(10), --FK
    item_id             NUMBER(10), --FK
    tx_price            NUMBER(12,2),
    tx_quantity         NUMBER(5),
    tx_completed_at     TIMESTAMP
);


CREATE TABLE price_history (
    price_history_id    NUMBER(10) PRIMARY KEY,
    item_id             NUMBER(10), --FK
    price_amount        NUMBER(12,2),
    price_recorded_at   TIMESTAMP
);


CREATE TABLE player_trades (
    trade_id        NUMBER(10) PRIMARY KEY,
    player_one_id   NUMBER(10), --FK
    player_two_id   NUMBER(10), --FK
    item_id         NUMBER(10), --FK
    trade_quantity  NUMBER(5),
    trade_at        TIMESTAMP
);



--- 10. LOGGING AND SECURITY ---
CREATE TABLE error_logs (
    error_log_id        NUMBER(10) PRIMARY KEY,
    error_message_text  CLOB,
    error_severity      VARCHAR2(20),
    error_occurred_at   TIMESTAMP
);


CREATE TABLE slow_query_logs (
    slow_query_id           NUMBER(10) PRIMARY KEY,
    slow_query_text         CLOB,
    slow_query_time_ms      NUMBER(10),
    slow_query_recorded_at  TIMESTAMP
);


CREATE TABLE suspicious_activity_logs (
    suspicious_activity_id     NUMBER(10) PRIMARY KEY,
    player_id                  NUMBER(10) NULL, --FK
    activity_category          VARCHAR2(50),
    activity_text              CLOB,
    activity_recorded_at       TIMESTAMP 
);


CREATE TABLE audit_logs (
    audit_log_id        NUMBER(10) PRIMARY KEY,
    player_id           NUMBER(10) NULL, --FK
    audit_action        VARCHAR2(50),
    audit_text          CLOB,
    audit_recorded_at   TIMESTAMP
);
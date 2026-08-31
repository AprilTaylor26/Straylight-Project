--------------------------- MARKETPLACE & TRADING Data ------------------------


------------------------
-- MARKET LISTINGS
-----------------------
INSERT INTO market_listings (listing_id, seller_player_id, item_id, listing_price, listing_quantity, listing_created_at) VALUES
(1, 1, 1, 125.50, 5, TO_TIMESTAMP('2147-03-12 09:15:44', 'YYYY-MM-DD HH24:MI:SS')), 
(2, 2, 4, 18.00, 20, TO_TIMESTAMP('2147-03-12 11:22:10', 'YYYY-MM-DD HH24:MI:SS')), 
(3, 3, 2, 340.00, 3, TO_TIMESTAMP('2147-03-11 17:44:02', 'YYYY-MM-DD HH24:MI:SS')), 
(4, 4, 3, 980.00, 1, TO_TIMESTAMP('2147-03-10 16:12:55', 'YYYY-MM-DD HH24:MI:SS')), 
(5, 5, 5, 2100.00, 1,TO_TIMESTAMP('2147-03-12 21:03:10', 'YYYY-MM-DD HH24:MI:SS')); 



-----------------------------
-- MARKET TRANSACTIONS
----------------------------
INSERT INTO market_transactions (market_tx_id, buyer_player_id, seller_player_id, item_id, tx_price, tx_quantity, tx_completed_at) VALUES
(101, 2, 1, 1, 125.50, 2, TO_TIMESTAMP('2147-03-12 14:20:10', 'YYYY-MM-DD HH24:MI:SS')),
(102, 3, 2, 4, 36.00, 2, TO_TIMESTAMP('2147-03-12 15:10:55', 'YYYY-MM-DD HH24:MI:SS')),
(103, 4, 3, 2, 340.00, 1, TO_TIMESTAMP('2147-03-11 18:03:21', 'YYYY-MM-DD HH24:MI:SS')),
(104, 1, 4, 3, 980.00, 1, TO_TIMESTAMP('2147-03-10 20:14:55', 'YYYY-MM-DD HH24:MI:SS')),
(105, 5, 5, 5, 2100.00, 1, TO_TIMESTAMP('2147-03-12 23:59:59', 'YYYY-MM-DD HH24:MI:SS'));


-----------------------
-- PRICE HISTORY
-----------------------
INSERT INTO price_history (price_history_id, item_id, price_amount, price_recorded_at) VALUES
(201, 1, 120.00, TO_TIMESTAMP('2147-03-11 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
(202, 1, 125.50, TO_TIMESTAMP('2147-03-12 09:15:44', 'YYYY-MM-DD HH24:MI:SS')),
(203, 4, 18.00, TO_TIMESTAMP('2147-03-12 11:22:10', 'YYYY-MM-DD HH24:MI:SS')),
(204, 2, 340.00, TO_TIMESTAMP('2147-03-11 17:44:02', 'YYYY-MM-DD HH24:MI:SS')),
(205, 5, 2100.00, TO_TIMESTAMP('2147-03-12 21:03:10', 'YYYY-MM-DD HH24:MI:SS'));



------------------------
-- PLAYER TRADES
-----------------------
INSERT INTO player_trades (trade_id, player_one_id, player_two_id, item_id, trade_quantity, trade_at) VALUES
(301, 1, 2, 4, 10, TO_TIMESTAMP('2147-03-12 14:48:55', 'YYYY-MM-DD HH24:MI:SS')), 
(302, 3, 4, 1, 3, TO_TIMESTAMP('2147-03-11 18:20:44', 'YYYY-MM-DD HH24:MI:SS')), 
(303, 5, 1, 2, 1, TO_TIMESTAMP('2147-03-10 20:40:55', 'YYYY-MM-DD HH24:MI:SS')), 
(304, 2, 3, 3, 1, TO_TIMESTAMP('2147-03-09 13:22:11', 'YYYY-MM-DD HH24:MI:SS')), 
(305, 4, 5, 5, 1, TO_TIMESTAMP('2147-03-12 21:20:10', 'YYYY-MM-DD HH24:MI:SS')); 

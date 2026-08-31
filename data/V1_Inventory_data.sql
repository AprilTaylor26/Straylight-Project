---------------------- INVENTORY DATA --------------------------

-------------------
-- INVENTORY
-------------------
INSERT INTO inventory (inventory_id, player_id, item_id, item_quantity) VALUES
(1, 1, 1, 5),
(2, 1, 4, 20),
(3, 2, 3, 1),
(4, 3, 2, 3),
(5, 4, 5, 1),
(6, 5, 4, 10),
(7, 5, 1, 2);


-------------------------------
-- INVENTORY TRANSACTIONS
------------------------------
INSERT INTO inventory_transactions (inv_tx_id, player_id, item_id, inv_tx_category, quantity_change, inv_tx_at) VALUES
(1, 1, 1, 'Crafted', 3, TO_TIMESTAMP('2147-03-12 14:20:10', 'YYYY-MM-DD HH24:MI:SS')),
(2, 2, 4, 'Purchased', 20, TO_TIMESTAMP('2147-03-12 15:10:55', 'YYYY-MM-DD HH24:MI:SS')),
(3, 3, 2, 'Looted', 1, TO_TIMESTAMP('2147-03-11 18:03:21', 'YYYY-MM-DD HH24:MI:SS')),
(4, 4, 3, 'Crafted', 1, TO_TIMESTAMP('2147-03-10 20:14:55', 'YYYY-MM-DD HH24:MI:SS')),
(5, 5, 5, 'Traded', 1, TO_TIMESTAMP('2147-03-12 21:03:10', 'YYYY-MM-DD HH24:MI:SS'));

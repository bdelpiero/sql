START TRANSACTION;
INSERT INTO transaction (account_id, txn_type_cd, amount)
VALUES (789, "C", 50);
INSERT INTO transaction (account_id, txn_type_cd, amount)
VALUES (123, "D", 50);
UPDATE account
SET avail_balance = avail_balance - 50
WHERE account_id = 123
    AND avail_balance > 50;
UPDATE account
SET avail_balance = avail_balance + 50
WHERE account_id = 75;
COMMIT;
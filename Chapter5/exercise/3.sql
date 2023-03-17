-- Construct a query that returns all addresses that are in the same city. You will need to
-- join the address table to itself, and each row should include two different addresses.
SELECT a1.address addr1,
    a2.address addr2,
    a1.city_id,
    a2.city_id
FROM address a1
    INNER JOIN address a2 ON a1.city_id = a2.city_id
WHERE a1.address_id <> a2.address_id;
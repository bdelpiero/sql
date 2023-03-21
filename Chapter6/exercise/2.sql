-- Write a compound query that finds the first and last names of all actors and customers
-- whose last name starts with L.
SELECT first_name,
    last_name
FROM actor a
WHERE last_name LIKE 'L%'
UNION
SELECT first_name,
    last_name
FROM customer c
WHERE last_name LIKE 'L%';
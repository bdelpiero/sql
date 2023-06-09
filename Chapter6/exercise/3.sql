-- Sort the results from Exercise 6-2 by the last_name column.
SELECT first_name,
    last_name
FROM actor a
WHERE last_name LIKE 'L%'
UNION
SELECT first_name,
    last_name
FROM customer c
WHERE last_name LIKE 'L%'
ORDER BY last_name;
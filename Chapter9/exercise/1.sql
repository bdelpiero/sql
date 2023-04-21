SELECT title
FROM film
WHERE film_id IN (
        SELECT fc.film_id
        FROM film_category fc
            INNER JOIN category c on c.category_id = fc.category_id
        WHERE c.name = "Action"
    );
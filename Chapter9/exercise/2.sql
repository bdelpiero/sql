SELECT f.title
FROM film f
WHERE EXISTS (
        SELECT 1
        FROM film_category fc
            INNER JOIN category c on c.category_id = fc.category_id
        WHERE fc.film_id = f.film_id
            AND c.name = "Action"
    );
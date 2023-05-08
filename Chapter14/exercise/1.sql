-- SELECT title, category_name, first_name, last_name FROM film_ctgry_actor
-- WHERE last_name = 'FAWCETT';
-- This seems right but i haven't run the query
CREATE VIEW film_ctgry_actor AS
SELECT f.title,
    c.name category_name,
    a.first_name,
    a.last_name
FROM actor a
    INNER JOIN film_actor fa ON fa.actor_id = a.actor_id
    INNER JOIN film f ON f.film_id = fa_film_id
    INNER JOIN film_category fc ON fc.film_id = fa.film_id
    INNER JOIN category c ON c.category_id = fc.category_id;

-- Solution from the book: 
CREATE VIEW film_ctgry_actor AS
SELECT f.title,
    c.name category_name,
    a.first_name,
    a.last_name
FROM film f
    INNER JOIN film_category fc ON f.film_id = fc.film_id
    INNER JOIN category c ON fc.category_id = c.category_id
    INNER JOIN film_actor fa ON fa.film_id = f.film_id
    INNER JOIN actor a ON fa.actor_id = a.actor_id;
-- seems fine but haven't run this query
CREATE VIEW country_payments AS
SELECT ctry.country,
    (
        SELECT sum(p.amount)
        FROM payment p
            INNER JOIN customer c ON c.customer_id = p.payment_id
            INNER JOIN address a ON a.customer_id = c.customer_id
            INNER JOIN city ct ON ct.city_id = a.city_id
        WHERE ct.country_id = ctry.country_id
    ) tot_payments
FROM country ctry;
-- Solution from the book
CREATE VIEW country_payments AS
SELECT c.country,
    (
        SELECT sum(p.amount)
        FROM city ct
            INNER JOIN address a ON ct.city_id = a.city_id
            INNER JOIN customer cst ON a.address_id = cst.address_id
            INNER JOIN payment p ON cst.customer_id = p.customer_id
        WHERE ct.country_id = c.country_id
    ) tot_payments
FROM country c
SELECT
    c.name,
    sum(p.amount) total_payments
FROM
    customer c
    LEFT OUTER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY
    c.name;
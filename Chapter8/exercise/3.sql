SELECT count(*) num_payments,
    customer_id,
    sum(amount) total
FROM payment
GROUP BY customer_id
HAVING num_payments >= 40;
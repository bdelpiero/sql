ALTER TABLE rental
ADD CONSTRAINT fk_rental_customer_id FOREIGN KEY (customer_id) REFERENCES address (customer_id) ON DELETE RESTRICT;
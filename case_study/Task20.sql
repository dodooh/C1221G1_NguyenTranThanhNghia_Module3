USE furama_resort;


SELECT staff_id AS id, staff_name AS name, email, phone_number, date_of_birth, address
FROM staff
UNION
SELECT customer_id, customer_name, email, phone_number, date_of_birth, address
FROM customer;

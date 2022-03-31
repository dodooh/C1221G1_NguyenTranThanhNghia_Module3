USE furama_resort;

SELECT c2.customer_id, c2.customer_name, COUNT(*) AS 'BookingQuantity'
FROM contract c
         INNER JOIN customer c2 ON c.customer_id = c2.customer_id
WHERE c2.customer_type_id = 1
GROUP BY c2.customer_name
ORDER BY BookingQuantity;


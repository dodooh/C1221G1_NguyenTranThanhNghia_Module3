USE furama_resort;

-- TIm cac record can xoa
SELECT c.customer_id, c2.customer_name
FROM contract c
         INNER JOIN customer c2 ON c.customer_id = c2.customer_id
WHERE YEAR(c.created_date) < 2021
GROUP BY c.customer_id;
USE furama_resort;

SELECT customer_name
FROM customer
GROUP BY customer_name
HAVING COUNT(*) > 1;

SELECT DISTINCT c.customer_name
FROM customer c
         INNER JOIN customer d ON c.customer_name = d.customer_name
WHERE c.customer_id <> d.customer_id;

select DISTINCT customer_name
from customer c
where (select count(*)
    from customer d
    where d.customer_name = c.customer_name) > 1;
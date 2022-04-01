USE furama_resort;

SELECT MONTH(created_date) AS month,
       COUNT(*)            AS number_of_customer
FROM contract
WHERE YEAR(created_date) = 2021
GROUP BY month
ORDER BY month;
USE furama_resort;

SELECT s.staff_id, s.staff_name
FROM contract c
         RIGHT JOIN staff s ON c.staff_id = s.staff_id
WHERE s.staff_id NOT IN (
    SELECT DISTINCT staff_id
    FROM contract
    WHERE YEAR(created_date) BETWEEN 2019 AND 2021
)
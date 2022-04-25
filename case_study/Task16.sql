USE furama_resort;


DELETE st
FROM staff st
         LEFT JOIN contract c ON c.staff_id = st.staff_id
WHERE st.staff_id NOT IN (
    SELECT DISTINCT staff_id
    FROM contract
    WHERE YEAR(created_date) BETWEEN 2019 AND 2021
)

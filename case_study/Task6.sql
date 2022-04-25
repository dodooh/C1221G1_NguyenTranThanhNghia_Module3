USE furama_resort;

SELECT s.service_id         AS `sID`,
       s.service_name,
       s.area,
       s.price,
       st.service_type_name AS `type`,
       c.created_date
FROM contract c
         LEFT JOIN service s ON c.service_id = s.service_id
         INNER JOIN service_type st ON s.service_type_id = st.service_type_id
GROUP BY sid
HAVING sid NOT IN (
    SELECT service_id
    FROM contract
    WHERE (created_date BETWEEN '2021-01-01' AND '2021-03-31')
       OR (end_date BETWEEN '2021-01-01' AND '2021-03-31'))
ORDER BY s.area DESC;

# WHERE c.created_date NOT IN
#       (SELECT created_date FROM contract WHERE (created_date BETWEEN '2021-01-01 00:00:00' AND '2021-03-31 23:59:59'))

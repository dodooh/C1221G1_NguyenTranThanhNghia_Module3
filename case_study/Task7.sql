USE furama_resort;

SELECT s.service_id         AS `sID`,
       s.service_name,
       s.area,
       s.max_people_allowed as `people allowed`,
       s.price,
       st.service_type_name AS `type`
FROM contract c
         LEFT JOIN service s ON c.service_id = s.service_id
         INNER JOIN service_type st ON s.service_type_id = st.service_type_id
WHERE s.service_id NOT IN (
    SELECT service_id
    FROM contract
    where YEAR(created_date) != 2020 or YEAR(created_date) = 2021
    GROUP BY service_id
)
GROUP BY sid;
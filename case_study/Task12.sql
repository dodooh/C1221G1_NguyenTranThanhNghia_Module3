USE furama_resort;


SELECT c.contract_id,
       s.staff_name,
       c2.customer_name,
       c2.phone_number,
       s2.service_name,
       COALESCE(SUM(cd.quantity), 0) AS `quantity`,
       c.deposit
FROM contract c
         INNER JOIN staff s ON s.staff_id = c.staff_id
         INNER JOIN service s2 ON c.service_id = s2.service_id
         INNER JOIN customer c2 ON c.customer_id = c2.customer_id
         LEFT JOIN contract_detail cd ON c.contract_id = cd.contract_id
         LEFT JOIN accompanied_service `as` ON `as`.accompanied_service_id = cd.accompanied_service_id
WHERE c.contract_id IN ((SELECT contract_id
                         FROM contract
                         WHERE (YEAR(created_date) = 2020 AND QUARTER(created_date) = 4)
                           AND NOT ((YEAR(created_date) = 2021 AND QUARTER(created_date) IN (1, 2)))))
GROUP BY c.contract_id;


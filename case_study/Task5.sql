USE furama_resort;

SELECT c2.customer_id                                       AS cid,
       c2.customer_name,
       ct.customer_type_name                                AS 'type',
       c.contract_id,
       s.service_name,
       c.created_date,
       c.end_date,
       SUM(COALESCE(`as`.price * cd.quantity, 0) + COALESCE(s.price, 0)) AS 'total'

FROM contract c
         RIGHT JOIN customer c2 ON c.customer_id = c2.customer_id
         LEFT JOIN contract_detail cd ON c.contract_id = cd.contract_id
         LEFT JOIN customer_type ct ON c2.customer_type_id = ct.customer_type_id
         LEFT JOIN service s ON c.service_id = s.service_id
         LEFT JOIN service_type st ON s.service_type_id = st.service_type_id
         LEFT JOIN accompanied_service `as` ON cd.accompanied_service_id = `as`.accompanied_service_id
GROUP BY c.contract_id, c2.customer_id
ORDER BY cid, c.contract_id DESC;
;


USE furama_resort;

SELECT c.contract_id, s.service_name, `as`.accompanied_service_name, COUNT(*) AS 'time_use'
FROM contract c
         INNER JOIN contract_detail cd ON c.contract_id = cd.contract_id
         INNER JOIN service s ON c.service_id = s.service_id
         INNER JOIN accompanied_service `as` ON cd.accompanied_service_id = `as`.accompanied_service_id
GROUP BY cd.accompanied_service_id
HAVING time_use = 1
ORDER BY c.contract_id;
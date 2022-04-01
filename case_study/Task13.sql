USE furama_resort;

SELECT `as`.accompanied_service_id, `as`.accompanied_service_name, SUM(quantity) AS total
FROM contract_detail cd
         INNER JOIN accompanied_service `as` ON cd.accompanied_service_id = `as`.accompanied_service_id
GROUP BY cd.accompanied_service_id
HAVING total =
       (
           SELECT SUM(quantity) AS total
           FROM contract_detail
           GROUP BY accompanied_service_id
           ORDER BY total DESC
           LIMIT 1
       )
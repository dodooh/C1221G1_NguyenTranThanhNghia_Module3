USE furama_resort;

UPDATE accompanied_service INNER JOIN (
    SELECT DISTINCT cd.accompanied_service_id
    FROM contract c
             INNER JOIN contract_detail cd
                        ON c.contract_id = cd.contract_id
             INNER JOIN accompanied_service `as` ON cd.accompanied_service_id = `as`.accompanied_service_id
    WHERE YEAR(c.created_date) = 2020
    GROUP BY cd.accompanied_service_id
    HAVING SUM(quantity) > 10) AS valid_ids ON valid_ids.accompanied_service_id = accompanied_service.accompanied_service_id
SET price = price * 2
WHERE valid_ids.accompanied_service_id = accompanied_service.accompanied_service_id;
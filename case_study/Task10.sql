USE furama_resort;

SELECT c.contract_id, c.created_date, c.end_date, c.deposit, SUM(COALESCE(quantity,0)) as 'quantity'
FROM contract c
         LEFT JOIN contract_detail cd ON c.contract_id = cd.contract_id
         LEFT JOIN accompanied_service `as` ON cd.accompanied_service_id = `as`.accompanied_service_id
GROUP BY c.contract_id;
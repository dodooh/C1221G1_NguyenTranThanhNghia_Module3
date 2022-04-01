USE furama_resort;

SELECT `as`.accompanied_service_id, `as`.accompanied_service_name
FROM customer c
         INNER JOIN contract ctr ON c.customer_id = ctr.customer_id
         INNER JOIN contract_detail cd ON ctr.contract_id = cd.contract_id
         INNER JOIN accompanied_service `as` ON cd.accompanied_service_id = `as`.accompanied_service_id
WHERE c.customer_type_id = 1
  AND (c.address REGEXP 'Vinh$' OR c.address REGEXP 'Nghệ An$');

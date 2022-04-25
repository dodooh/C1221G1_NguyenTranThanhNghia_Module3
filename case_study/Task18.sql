USE furama_resort;

-- TIm cac record can xoa

# SET FOREIGN_KEY_CHECKS = 0;
# DELETE customer
# FROM customer
# WHERE customer_id IN (
#     SELECT cid
#     FROM (SELECT ctr.customer_id AS cid
#           FROM contract ctr
#                    INNER JOIN customer ctm ON ctr.customer_id = ctm.customer_id
#           WHERE YEAR(ctr.created_date) < 2021
#           GROUP BY ctr.customer_id) AS c3);
# SET FOREIGN_KEY_CHECKS = 1;


ALTER TABLE contract
    DROP FOREIGN KEY contract_ibfk_2;
ALTER TABLE contract
    ADD CONSTRAINT contract_ibfk_2 FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE SET NULL;
DELETE customer
FROM customer
         INNER JOIN contract c3 ON customer.customer_id = c3.customer_id
WHERE YEAR(c3.created_date) < 2021;


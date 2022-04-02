USE furama_resort;

-- Cach 1
DELIMITER //
CREATE PROCEDURE find_valid_customer_and_upgrade()
BEGIN
    SET @customer_id_to_edit = -1;
    -- find valid id -> @customer_id_to_edit
    SET @customer_id_to_edit = (SELECT c2.customer_id
                                FROM contract c
                                         RIGHT JOIN customer c2 ON c.customer_id = c2.customer_id
                                         LEFT JOIN contract_detail cd ON c.contract_id = cd.contract_id
                                         LEFT JOIN service s ON c.service_id = s.service_id
                                         LEFT JOIN accompanied_service `as` ON cd.accompanied_service_id = `as`.accompanied_service_id
                                WHERE YEAR(c.created_date) = 2021
                                  AND c2.customer_type_id = 2
                                GROUP BY c.contract_id, c2.customer_id
                                HAVING SUM(COALESCE(`as`.price * cd.quantity, 0) + COALESCE(s.price, 0)) > 10000000);
    -- upgrade it
    UPDATE customer SET customer_type_id = 1 WHERE customer_id = @customer_id_to_edit;
    -- print it out
    SELECT customer_id, customer_name, customer_type_id FROM customer WHERE customer_id = @customer_id_to_edit;
END //
DELIMITER ;


# DELIMITER //
# CREATE PROCEDURE upgrade_to_diamond(IN id_to_upgrade int)
# BEGIN
#     update customer set customer_type_id = 1 where customer_id = id_to_upgrade;
#     select customer_id, customer_name, customer_type_id from customer where customer_id = id_to_upgrade;
# END //
# DELIMITER ;


CALL find_valid_customer_and_upgrade();
# create view id_to_up as
# Select @id_to_upgrade;
# CALL upgrade_to_diamond(@id_to_upgrade);


-- Cach 2
UPDATE customer c INNER JOIN (
    SELECT c2.customer_id
    FROM contract c
             RIGHT JOIN customer c2 ON c.customer_id = c2.customer_id
             LEFT JOIN contract_detail cd ON c.contract_id = cd.contract_id
             LEFT JOIN service s ON c.service_id = s.service_id
             LEFT JOIN accompanied_service `as` ON cd.accompanied_service_id = `as`.accompanied_service_id
    WHERE YEAR(c.created_date) = 2021
      AND c2.customer_type_id = 2 -- tim customer type 'Platinum'
    GROUP BY c.contract_id, c2.customer_id
    HAVING SUM(COALESCE(`as`.price * cd.quantity, 0) + COALESCE(s.price, 0)) > 10000000
) AS rs ON c.customer_id = rs.customer_id
SET customer_type_id = 1 -- set customer type 'Diamond'
WHERE c.customer_id = rs.customer_id;



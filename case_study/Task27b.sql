USE furama_resort;

DROP FUNCTION IF EXISTS func_count_contract_time;
DELIMITER //
CREATE FUNCTION func_count_contract_time(customer_id_to_find int) RETURNS integer
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE `result` int;

    SET `result` = (SELECT datediff(end_date, created_date)
                    FROM contract
                    WHERE ((end_date - created_date) >= (
                        SELECT MAX(datediff(end_date, created_date))
                        FROM contract
                        WHERE customer_id = customer_id_to_find))
                      AND customer_id = customer_id_to_find);
    RETURN `result`;

END //
DELIMITER ;

SELECT func_count_contract_time(2)
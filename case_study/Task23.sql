use furama_resort;

DELIMITER //
CREATE PROCEDURE sp_delete_customer(customer_id_input int)
BEGIN
    DElete ctm from customer ctm where customer_id = customer_id_input;
END //
DELIMITER ;


ALTER TABLE contract
    DROP FOREIGN KEY contract_ibfk_2;
ALTER TABLE contract
    ADD CONSTRAINT contract_ibfk_2 FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE SET NULL;
call sp_delete_customer(3);
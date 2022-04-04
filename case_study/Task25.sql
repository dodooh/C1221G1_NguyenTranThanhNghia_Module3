USE furama_resort;

CREATE TABLE contract_log
(
    id       int AUTO_INCREMENT,
    quantity int,
    PRIMARY KEY (id)
);

DROP TRIGGER IF EXISTS tr_delete_contract;
DELIMITER >>
CREATE TRIGGER tr_delete_contract
    AFTER DELETE
    ON contract
    FOR EACH ROW
BEGIN
    SET @num_left = NULL;
    SELECT COUNT(*) INTO @num_left FROM contract;
    SET @msg = CONCAT('Number of contract left: ', @num_left);
    INSERT INTO contract_log(quantity) VALUES ( @num_left);
#     SIGNAL SQLSTATE
#         '45000' SET MESSAGE_TEXT = @msg;
END >>
DELIMITER ;

ALTER TABLE contract_detail
    DROP FOREIGN KEY contract_detail_ibfk_1;
ALTER TABLE contract_detail
    ADD CONSTRAINT contract_detail_ibfk_1
        FOREIGN KEY (contract_id) REFERENCES contract (contract_id) ON DELETE SET NULL;

DELETE
FROM contract
WHERE contract_id = 12;
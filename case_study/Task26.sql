USE furama_resort;

DROP TRIGGER IF EXISTS tr_update_contract;
DELIMITER >>
CREATE TRIGGER tr_update_contract
    BEFORE UPDATE
    ON contract
    FOR EACH ROW
BEGIN
    IF DATEDIFF(new.end_date, new.created_date) <= 2 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'End date must be after created date more than 2 days';
    END IF;
END >>
DELIMITER ;

UPDATE contract set created_date = '2021-05-05', end_date = '2021-05-08' WHERE contract_id = 6;

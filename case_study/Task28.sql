USE furama_resort;


ALTER TABLE contract
    DROP CONSTRAINT contract_ibfk_3;
ALTER TABLE contract
    ADD CONSTRAINT contract_ibfk_3 FOREIGN KEY (service_id) REFERENCES service (service_id) ON DELETE CASCADE;


DROp PROCEDURE if EXISTS sp_delete_service_and_contract_room;
DELIMITER ##
CREATE PROCEDURE sp_delete_service_and_contract_room()
BEGIN

    DELETE service
    FROM service
             INNER JOIN (SELECT s.service_id AS sid
                         FROM service s
                                  INNER JOIN service_type ON s.service_type_id = service_type.service_type_id
                                  INNER JOIN contract ON s.service_id = contract.service_id
                         WHERE service_type_name = 'Room'
                           AND (YEAR(contract.created_date) BETWEEN 2015 AND 2020)) AS found_sv ON found_sv.sid = service.service_id
    WHERE found_sv.sid = service.service_id;


END ##;
DELIMITER ;

CALL sp_delete_service_and_contract_room();

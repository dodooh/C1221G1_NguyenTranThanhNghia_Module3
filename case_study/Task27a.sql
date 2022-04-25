USE furama_resort;


drop function if EXISTS func_count_service;
DELIMITER //
CREATE FUNCTION func_count_service() RETURNS integer
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE `total` int;

    set `total` = (SELECT COUNT(*)
                 FROM (SELECT c.service_id, s.price * COUNT(*) AS t
                       FROM contract c
                                INNER JOIN service s ON c.service_id = s.service_id
                       GROUP BY c.service_id
                       HAVING t > 2000000) AS f);

    RETURN `total`;

END //
DELIMITER ;

SELECT func_count_service();
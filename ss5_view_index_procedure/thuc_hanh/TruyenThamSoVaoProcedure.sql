-- THAM SỐ LOẠI IN

DELIMITER //
CREATE PROCEDURE get_cus_by_id(IN cusnum INT(11))
BEGIN
    SELECT * FROM customers WHERE customernumber = cusnum;
END //
DELIMITER ;
CALL get_cus_by_id(175);

-- THAM SỐ LOẠI OUT

DELIMITER //
CREATE PROCEDURE get_customers_count_by_city(IN in_city VARCHAR(50), OUT total INT
)
BEGIN
    SELECT COUNT(customernumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END//
DELIMITER ;
CALL get_customers_count_by_city('Lyon', @total);
SELECT @total;

-- HAM SỐ LOẠI INOUT

DELIMITER //
CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END//
DELIMITER ;
SET @counter = 1;
CALL SetCounter(@counter,1); -- 2
CALL SetCounter(@counter,1); -- 3
CALL SetCounter(@counter,5); -- 8
SELECT @counter; -- 8
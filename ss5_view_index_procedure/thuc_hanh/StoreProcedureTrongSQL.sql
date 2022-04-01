-- Tạo Mysql Stored Procedure đầu tiên
DELIMITER //
CREATE PROCEDURE find_all_customers()
BEGIN
    SELECT * FROM customers;
END //
DELIMITER ;
-- Cách gọi procedure
CALL find_all_customers();
-- Sửa procedure
DELIMITER //
DROP PROCEDURE IF EXISTS `find_all_customers`//
CREATE PROCEDURE find_all_customers()
BEGIN
    SELECT * FROM customers WHERE customernumber = 175;
END //
CALL find_all_customers();
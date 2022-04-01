# Buoc 1
CREATE DATABASE demo;
USE demo;
# Buoc 2
CREATE TABLE products
(
    id                  int AUTO_INCREMENT,
    product_code        varchar(45),
    product_name        varchar(45),
    product_price       double,
    product_amount      int,
    product_description varchar(300),
    product_status      varchar(45),
    PRIMARY KEY (id)
);

INSERT INTO demo.products (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES ('APPLE12S', 'Iphone 12', 1500, 123, 'An apple product today', 'new'),
       ('APPLE13S', 'Iphone 13', 1600, 120, 'An apple product today', 'old'),
       ('APPLE14S', 'Iphone 14', 1700, 160, 'An apple product today', 'old'),
       ('APPLE15S', 'Iphone 15', 1800, 150, 'An apple product today', 'new'),
       ('APPLE16S', 'Iphone 14', 1900, 170, 'An apple product today', 'new'),
       ('APPLE17S', 'Iphone 17', 2000, 190, 'An apple product today', 'old');
# Buoc 3
ALTER TABLE products
    DROP INDEX idx_product_code;
EXPLAIN
SELECT *
FROM products
WHERE product_code = 'APPLE14S';
# -> 1,SIMPLE,products,,ALL,,,,,6,16.67,Using where

ALTER TABLE products
    ADD INDEX idx_product_code (product_code);
EXPLAIN
SELECT *
FROM products
WHERE product_code = 'APPLE14S';

# -> 1,SIMPLE,products,,ref,idx_product_code,idx_product_code,183,const,1,100,

ALTER TABLE products
    DROP INDEX idx_product_name_and_price;
EXPLAIN
SELECT *
FROM products
WHERE product_name = 'Iphone 14'
  AND product_price > 1800;
# -> 1,SIMPLE,products,,ALL,,,,,6,16.67,Using where
ALTER TABLE products
    ADD INDEX idx_product_name_and_price (product_name, product_price);
EXPLAIN
SELECT *
FROM products
WHERE product_name = 'Iphone 14'
  AND product_price > 1800;
# -> 1,SIMPLE,products,,range,idx_product_name_and_price,idx_product_name_and_price,192,,1,100,Using index condition

# Buoc 4
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW product_view AS
SELECT product_code, product_name, product_price, product_status
FROM products;
SELECT *
FROM product_view;
-- Tiến hành sửa đổi view
CREATE OR REPLACE VIEW product_view AS
SELECT product_code, product_name, product_price, product_status
FROM products
WHERE product_price > 1700;
SELECT *
FROM product_view;
-- Tiến hành xoá view
DROP VIEW product_view;
SELECT *
FROM product_view;
-- ERROR

# Buoc 5
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE find_all_products()
BEGIN
    SELECT * FROM products;
END //
DELIMITER ;
CALL find_all_products();
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE create_new_product(
    p_code varchar(45),
    p_name varchar(45),
    p_price double,
    p_amount int,
    p_description varchar(300),
    p_status varchar(45)
)
BEGIN
    INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status)
    VALUES (p_code,
            p_name,
            p_price,
            p_amount,
            p_description,
            p_status);
END//
DELIMITER ;
CALL create_new_product('APPLE18S', 'Iphone 18', 2100, 190, 'An apple product today', 'new');

-- Tạo store procedure sửa thông tin sản phẩm theo id



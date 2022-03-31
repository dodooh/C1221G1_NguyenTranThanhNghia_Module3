USE furama_resort;
SELECT customer_id,customer_name,TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()),address AS age
FROM customer
WHERE (TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 18 AND 50)
  AND (address LIKE '%Đà Nẵng' OR address LIKE '%Quảng Trị');
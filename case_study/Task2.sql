USE furama_resort;

SELECT staff_id, staff_name
FROM staff
WHERE (staff_name REGEXP '^[HTK]') AND CHAR_LENGTH(staff_name) <= 15;
USE furama_resort;

SELECT s.staff_id, s.staff_name, ed.education_degree_name, d.department_name, s.phone_number, s.address
FROM contract c
         INNER JOIN staff s ON c.staff_id = s.staff_id
         INNER JOIN department d ON s.department_id = d.department_id
         INNER JOIN education_degree ed ON s.education_degree_id = ed.education_degree_id
GROUP BY c.staff_id
HAVING COUNT(*) <= 3;

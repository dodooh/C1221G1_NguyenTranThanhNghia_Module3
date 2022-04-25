USE furama_resort;

drop view if EXISTS v_nhan_vien;
create view v_nhan_vien as
SELECT s.staff_id, staff_name, date_of_birth, identify_number, salary, phone_number, email, address, position_id, education_degree_id, department_id
FROM staff s
         INNER JOIN contract c ON s.staff_id = c.staff_id
WHERE s.address LIKE '%Hải Châu%'
  AND c.created_date = '2019-12-12';

select * from v_nhan_vien;

update v_nhan_vien as v inner join staff as s on s.staff_id = v.staff_id set v.address = 'Liên Chiểu';
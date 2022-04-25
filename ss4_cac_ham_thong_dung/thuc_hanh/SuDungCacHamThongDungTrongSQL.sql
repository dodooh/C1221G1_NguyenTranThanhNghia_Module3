USE QuanLySinhVien;
SELECT Address, COUNT(student_id) AS 'Số lượng học viên'
FROM QuanLySinhVien.Student
GROUP BY Address;

SELECT S.student_id,S.student_name, AVG(Mark)
FROM QuanLySinhVien.Student S join QuanLySinhVien.Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name;

SELECT S.student_id,S.student_name, AVG(Mark)
FROM QuanLySinhVien.Student S join QuanLySinhVien.Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name
HAVING AVG(Mark) > 15;

SELECT S.student_id, S.student_name, AVG(Mark)
FROM QuanLySinhVien.Student S join QuanLySinhVien.Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name
HAVING AVG(Mark) <= ALL (SELECT AVG(Mark) FROM QuanLySinhVien.Mark GROUP BY QuanLySinhVien.Mark.student_id);


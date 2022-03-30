USE quanlysinhvien;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT *
FROM student
WHERE student_name LIKE 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT *
FROM class
WHERE start_date LIKE '%-12-%';
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT *
FROM subject
WHERE credit >= 3
  AND credit <= 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
UPDATE student
SET class_id = 4
WHERE student_name = 'Hung';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT s.student_name, sj.sub_name, m.mark
FROM student s
         JOIN mark m ON s.student_id = m.student_id
         JOIN subject sj ON sj.sub_id = m.sub_id
ORDER BY m.mark DESC,
         s.student_name;



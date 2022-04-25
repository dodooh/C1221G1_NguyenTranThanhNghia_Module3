USE quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT sub_id, sub_name, credit
FROM subject
WHERE credit >= ALL (SELECT credit FROM subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT DISTINCT s.sub_id,s.sub_name, m.mark
FROM subject s
         INNER JOIN mark m ON s.sub_id = m.sub_id
WHERE m.mark >= ALL (SELECT mark FROM mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT s.student_id, s.student_name, AVG(m.mark) as 'averageMark'
FROM student s
    INNER JOIN mark m ON s.student_id = m.student_id
GROUP BY s.student_id, s.student_name
ORDER BY averageMark DESC ;
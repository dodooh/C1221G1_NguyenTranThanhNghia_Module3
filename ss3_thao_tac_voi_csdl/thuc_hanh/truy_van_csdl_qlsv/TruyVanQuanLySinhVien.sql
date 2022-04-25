USE quanlysinhvien;
SELECT *
FROM student;
SELECT *
FROM student
WHERE status = TRUE;

SELECT *
FROM subject
WHERE credit < 10;

SELECT s.student_id, s.student_name, c.class_name
FROM student s
         JOIN class c ON s.class_id = c.class_id;

SELECT s.student_id, s.student_name, c.class_name
FROM student s
         JOIN class c ON s.class_id = c.class_id
WHERE c.class_name = 'A1';

SELECT s.student_id, s.student_name, sub.sub_name, m.mark
FROM student s
         JOIN mark m ON s.student_id = m.student_id
         JOIN subject sub ON m.sub_id = sub.sub_id;

SELECT s.student_id, s.student_name, sub.sub_name, m.mark
FROM student s
         JOIN mark m ON s.student_id = m.student_id
         JOIN subject sub ON m.sub_id = sub.sub_id
WHERE sub.sub_name = 'CF';
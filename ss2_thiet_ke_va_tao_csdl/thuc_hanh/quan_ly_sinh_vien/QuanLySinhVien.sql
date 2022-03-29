DROP DATABASE IF EXISTS quanlysinhvien;
CREATE DATABASE quanlysinhvien;

USE quanlysinhvien;

CREATE TABLE class
(
    class_id   INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME,
    status    BIT
);
CREATE TABLE student
(
    student_id   INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(30),
    address     VARCHAR(50),
    phone       VARCHAR(20),
    `status`      BIT,
    class_id     INT NOT NULL,
    FOREIGN KEY (ClassID) REFERENCES class (ClassID)
);
CREATE TABLE Subject
(
    sub_id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name NVARCHAR(30) NOT NULL,
    credit  TINYINT      NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    `Status`  BIT                   DEFAULT 1
);
CREATE TABLE Mark
(
    mark_id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id     INT NOT NULL,
    student_id INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id, student_id),
    FOREIGN KEY (sub_id) REFERENCES Subject (sub_id),
    FOREIGN KEY (student_id) REFERENCES Student (student_id)
);


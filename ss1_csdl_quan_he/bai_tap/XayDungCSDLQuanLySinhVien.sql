drop database if exists student_management;
create database student_management;
use student_management;
create table class 
(id int not null auto_increment key,
name varchar(40));
CREATE TABLE teacher (
    id INT NOT NULL AUTO_INCREMENT KEY,
    name VARCHAR(40),
    age INT,
    country VARCHAR(40)
);
insert into student_management.class (name) VALUES ("C1221G1"), ("C1121G1"), ("C1021G1");
insert into student_management.teacher (name, age, country) VALUES ("Chanh TV", 30, "Viet Nam"), ("Trung DC", 28, "Viet Nam"), ("Chien TV", 25, "Viet Nam");
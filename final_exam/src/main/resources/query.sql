drop database if exists final_m3;
create database final_m3;
use final_m3;

create table rent_type
(
    rent_type_id   int,
    rent_type_name varchar(40),
    primary key (rent_type_id)
);

create table motel
(
    id_motel      int AUTO_INCREMENT,
    customer_name varchar(50),
    phone         varchar(50),
    day_rent      date,
    rent_type_id     int,
    note          varchar(200),
    PRIMARY KEY (id_motel),
    FOREIGN KEY (rent_type_id) REFERENCES rent_type (rent_type_id)
);

INSERT INTO rent_type (rent_type_id, rent_type_name)
VALUES (1, 'Theo Thang'),
       (2, 'Theo Quy'),
       (3, 'Theo Nam')

INSERT INTO motel (customer_name, phone, day_rent, rent_type_id, note)
VALUES
       ('Nguyen Van A', '0123456789', '2020-10-10',1,'Phong Co Dieu Hoa'),
       ('Nguyen Van B', '0123456789', '2020-10-10',2,''),
       ('Nguyen Van C', '0123456789', '2020-10-10',3,'Phong Co Dieu Hoa'),
       ('Nguyen Van D', '0123456789', '2020-10-10',1,'Phong Co Dieu Hoa')
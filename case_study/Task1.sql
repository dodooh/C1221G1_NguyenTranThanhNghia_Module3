DROP DATABASE IF EXISTS furama_resort;
CREATE DATABASE furama_resort;
USE furama_resort;

CREATE TABLE position
(
    position_id   int AUTO_INCREMENT,
    position_name varchar(45),
    PRIMARY KEY (position_id)
);
CREATE TABLE education_degree
(
    education_degree_id   int AUTO_INCREMENT,
    education_degree_name varchar(45),
    PRIMARY KEY (education_degree_id)
);

CREATE TABLE department
(
    department_id   int AUTO_INCREMENT,
    department_name varchar(45),
    PRIMARY KEY (department_id)
);

CREATE TABLE staff
(
    staff_id            int AUTO_INCREMENT,
    staff_name          varchar(45) NOT NULL,
    date_of_birth       DATE        NOT NULL,
    identify_number     varchar(45) NOT NULL,
    salary              double      NOT NULL,
    phone_number        varchar(45) NOT NULL,
    email               varchar(45),
    address             varchar(45),
    position_id         int,
    education_degree_id int,
    department_id       int,
    PRIMARY KEY (staff_id),
    FOREIGN KEY (department_id) REFERENCES department (department_id),
    FOREIGN KEY (education_degree_id) REFERENCES education_degree (education_degree_id),
    FOREIGN KEY (position_id) REFERENCES `position` (position_id)
);

CREATE TABLE customer_type
(
    customer_type_id   int AUTO_INCREMENT,
    customer_type_name varchar(45),
    PRIMARY KEY (customer_type_id)
);

CREATE TABLE customer
(
    customer_id      int AUTO_INCREMENT,

    customer_name    varchar(45)   NOT NULL,
    date_of_birth    DATE          NOT NULL,
    gender           bit DEFAULT 1 NOT NULL,
    identify_number  varchar(45)   NOT NULL,
    phone_number     varchar(45)   NOT NULL,
    email            varchar(45),
    address          varchar(45),
    customer_type_id int,
    PRIMARY KEY (customer_id),
    FOREIGN KEY (customer_type_id) REFERENCES customer_type (customer_type_id)
);

CREATE TABLE rent_type
(
    rent_type_id   int AUTO_INCREMENT,
    rent_type_name varchar(45),
    PRIMARY KEY (rent_type_id)
);

CREATE TABLE service_type
(
    service_type_id   int AUTO_INCREMENT,
    service_type_name varchar(45),
    PRIMARY KEY (service_type_id)
);

CREATE TABLE service
(
    service_id          int AUTO_INCREMENT,
    service_name        varchar(45) NOT NULL,
    area                int,
    price               double      NOT NULL,
    max_people_allowed  int,
    room_standard       varchar(45),
    convenient_describe varchar(45),
    pool_area           double,
    floors              int,
    rent_type_id        int,
    service_type_id     int,
    PRIMARY KEY (service_id),
    FOREIGN KEY (rent_type_id) REFERENCES rent_type (rent_type_id),
    FOREIGN KEY (service_type_id) REFERENCES service_type (service_type_id)
);

CREATE TABLE accompanied_service
(
    accompanied_service_id   int AUTO_INCREMENT,
    accompanied_service_name varchar(45) NOT NULL,
    price                    double      NOT NULL,
    unit                     varchar(10),
    status                   varchar(45),
    PRIMARY KEY (accompanied_service_id)
);

CREATE TABLE contract
(
    contract_id  int AUTO_INCREMENT,
    created_date date   NOT NULL,
    end_date     date   NOT NULL,
    deposit      double NOT NULL,
    staff_id     int,
    customer_id  int,
    service_id   int,
    PRIMARY KEY (contract_id),
    FOREIGN KEY (staff_id) REFERENCES staff (staff_id),
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    FOREIGN KEY (service_id) REFERENCES service (service_id)
);

CREATE TABLE contract_detail
(
    contract_detail_id     int AUTO_INCREMENT,
    quantity               int NOT NULL,
    contract_id            int,
    accompanied_service_id int,
    PRIMARY KEY (contract_detail_id),
    FOREIGN KEY (contract_id) REFERENCES contract (contract_id),
    FOREIGN KEY (accompanied_service_id) REFERENCES accompanied_service (accompanied_service_id)
);
INSERT INTO furama_resort.`position`(position_name)
VALUES ('Qu???n L??'),
       ('Nh??n Vi??n');

INSERT INTO furama_resort.department(department_name)
VALUES ('Sale-Marketing'),
       ('H??nh ch??nh'),
       ('Ph???c v???'),
       ('Qu???n l??');

INSERT INTO furama_resort.education_degree(education_degree_name)
VALUES ('Trung C???p'),
       ('Cao ?????ng'),
       ('?????i H???c'),
       ('Sau ?????i H???c');



INSERT INTO furama_resort.staff (staff_name, date_of_birth, identify_number, salary, phone_number, email, address, position_id, education_degree_id,
                                 department_id)
VALUES ('Nguy???n V??n An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguy???n T???t Th??nh, ???? N???ng', 1, 3, 1),
       ('L?? V??n B??nh', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Y??n B??i, ???? N???ng', 1, 2, 2),
       ('H??? Th??? Y???n', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 ??i???n Bi??n Ph???, Gia Lai', 1, 3, 2),
       ('V?? C??ng To???n', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Ho??ng Di???u, Qu???ng Tr???', 1, 4, 4),
       ('Nguy???n B???nh Ph??t', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Y??n B??i, ???? N???ng', 2, 1, 1),
       ('Kh??c Nguy???n An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguy???n T???t Th??nh, ???? N???ng', 2, 2, 3),
       ('Nguy???n H???u H??', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguy???n Ch?? Thanh, Hu???', 2, 3, 2),
       ('Nguy???n H?? ????ng', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 H??ng V????ng, H?? N???i', 2, 4, 4),
       ('T??ng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 H??m Nghi, ???? N???ng', 2, 4, 4),
       ('Nguy???n C??ng ?????o', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Ho?? Kh??nh, ?????ng Nai', 2, 3, 2);
INSERT INTO furama_resort.customer_type(customer_type_name)
VALUES ('Diamond'),
       ('Platinium'),
       ('Gold'),
       ('Silver'),
       ('Member');

INSERT INTO furama_resort.customer(customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id)
VALUES ('Nguy???n Th??? H??o', '1970-11-07', FALSE, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguy???n Ho??ng, ???? N???ng', 5),
       ('Ph???m Xu??n Di???u', '1992-08-08', TRUE, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Th??i Phi??n, Qu???ng Tr???', 3),
       ('Tr????ng ????nh Ngh???', '1990-02-27', TRUE, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 ??ng ??ch Khi??m, Vinh', 1),
       ('D????ng V??n Quan', '1981-07-08', TRUE, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 L?? L???i, ???? N???ng', 1),
       ('Ho??ng Tr???n Nhi Nhi', '1995-12-09', FALSE, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 L?? Th??i T???, Gia Lai', 4),
       ('T??n N??? M???c Ch??u', '2005-12-06', FALSE, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Y??n Th???, ???? N???ng', 4),
       ('Nguy???n M??? Kim', '1984-04-08', FALSE, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 L?? L???i, H??? Ch?? Minh', 1),
       ('Nguy???n Th??? H??o', '1999-04-08', FALSE, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguy???n V??n Linh, Kon Tum', 3),
       ('Tr???n ?????i Danh', '1994-07-01', TRUE, '432341235', '0643343433', 'danhhai99@gmail.com', '24 L?? Th?????ng Ki???t, Qu???ng Ng??i', 1),
       ('Nguy???n T??m ?????c', '1989-07-01', TRUE, '344343432', '0987654321', 'dactam@gmail.com', '22 Ng?? Quy???n, ???? N???ng', 2);

INSERT INTO furama_resort.rent_type(rent_type_name)
VALUES ('year'),
       ('month'),
       ('day'),
       ('hour');

INSERT INTO furama_resort.service_type(service_type_name)
VALUES ('Villa'),
       ('House'),
       ('Room');

INSERT INTO furama_resort.service (service_name, area, price, max_people_allowed, room_standard, convenient_describe, pool_area, floors,
                                   rent_type_id, service_type_id)
VALUES ('Villa Beach Front', 25000, 10000000, 10, 'vip', 'C?? h??? b??i', 500, 4, 3, 1),
       ('House Princess 01', 14000, 5000000, 7, 'vip', 'C?? th??m b???p n?????ng', NULL, 3, 2, 2),
       ('Room Twin 01', 5000, 1000000, 2, 'normal', 'C?? tivi', NULL, NULL, 4, 3),
       ('Villa No Beach Front', 22000, 9000000, 8, 'normal', 'C?? h??? b??i', 300, 3, 3, 1),
       ('House Princess 02', 10000, 4000000, 5, 'normal', 'C?? th??m b???p n?????ng', NULL, 2, 3, 2),
       ('Room Twin 02', 3000, 900000, 2, 'normal', 'C?? tivi', NULL, NULL, 4, 3);

INSERT INTO furama_resort.accompanied_service (accompanied_service_name, price, unit, status)
VALUES ('Karaoke', 10000, 'gi???', 'ti???n nghi, hi???n t???i'),
       ('Thu?? xe m??y', 10000, 'chi???c', 'h???ng 1 xe'),
       ('Thu?? xe ?????p', 20000, 'chi???c', 't???t'),
       ('Buffet bu???i s??ng', 15000, 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng'),
       ('Buffet bu???i tr??a', 90000, 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng'),
       ('Buffet bu???i t???i', 16000, 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng');

INSERT INTO furama_resort.contract (created_date, end_date, deposit, staff_id, customer_id, service_id)
VALUES ('2020-12-08', '2020-12-08', 0, 3, 1, 3),
       ('2020-07-14', '2020-07-21', 200000, 7, 3, 1),
       ('2021-03-15', '2021-03-17', 50000, 3, 4, 2),
       ('2021-01-14', '2021-01-18', 100000, 7, 5, 5),
       ('2021-07-14', '2021-07-15', 0, 7, 2, 6),
       ('2021-06-01', '2021-06-03', 0, 7, 7, 6),
       ('2021-09-02', '2021-09-05', 100000, 7, 4, 4),
       ('2021-06-17', '2021-06-18', 150000, 3, 4, 1),
       ('2020-11-19', '2020-11-19', 0, 3, 4, 3),
       ('2021-04-12', '2021-04-14', 0, 10, 3, 5),
       ('2021-04-25', '2021-04-25', 0, 2, 2, 1),
       ('2021-05-25', '2021-05-27', 0, 7, 10, 1);


INSERT INTO furama_resort.contract_detail (quantity, contract_id, accompanied_service_id)
VALUES (5, 2, 4),
       (8, 2, 5),
       (15, 2, 6),
       (1, 3, 1),
       (11, 3, 2),
       (1, 1, 3),
       (2, 1, 2),
       (2, 12, 2);

































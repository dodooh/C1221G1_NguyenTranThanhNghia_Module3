DROP DATABASE IF EXISTS order_management;
CREATE DATABASE order_management;
USE order_management;
CREATE TABLE customer
(
    cID   int AUTO_INCREMENT NOT NULL,
    cName varchar(40),
    cage  tinyint            NOT NULL,
    PRIMARY KEY (cID)
);
CREATE TABLE `order`
(
    oID         int AUTO_INCREMENT NOT NULL,
    cID         int,
    oDate       datetime,
    oTotalPrice double             NOT NULL,
    CONSTRAINT fk_cID FOREIGN KEY (cID) REFERENCES customer (cid),
    PRIMARY KEY (oid)
);

CREATE TABLE product
(
    pID    int AUTO_INCREMENT NOT NULL,
    pname  varchar(60),
    pprice double             NOT NULL,
    PRIMARY KEY (pID)
);

CREATE TABLE OrderDetail
(
    oID   int,
    pID   int,
    odQty int,
    PRIMARY KEY (oid, pid),
    FOREIGN KEY (oid) REFERENCES `order` (oID),
    FOREIGN KEY (pID) REFERENCES product (pID)
);

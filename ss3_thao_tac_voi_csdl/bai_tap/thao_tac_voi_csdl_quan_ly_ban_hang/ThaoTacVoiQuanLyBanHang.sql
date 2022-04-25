INSERT INTO order_management.customer (cid, cname, cage)
VALUES (1, 'Minh Quan', 10),
       (2, 'Ngoc Oanh', 20),
       (3, 'Hong Ha', 50);

INSERT INTO order_management.`order` (oid, cid, odate)
VALUES (1, 1, '2006-03-21'),
       (2, 2, '2006-03-23'),
       (3, 1, '2006-03-16');

INSERT INTO order_management.product (pid, pname, pprice)
VALUES (1, 'May Giat', 3),
       (2, 'Tu Lanh', 5),
       (3, 'Dieu Hoa', 7),
       (4, 'Quat', 1),
       (5, 'Bep Dien', 2);

INSERT INTO order_management.orderdetail (oid, pid, odqty)
VALUES (1, 1, 3),
       (1, 3, 7),
       (1, 4, 2),
       (2, 1, 1),
       (3, 1, 8),
       (2, 5, 4),
       (2, 3, 3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT `order`.oid, `order`.odate, p.pname, p.pprice
FROM `order`
         JOIN orderdetail o ON `order`.oid = o.oid
         JOIN product p ON o.pid = p.pid
ORDER BY `order`.oid;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c.cname, p.pname
FROM `order` o
         JOIN customer c ON c.cid = o.cid
         JOIN orderdetail o2 ON o.oid = o2.oid
         JOIN product p ON p.pid = o2.pid
ORDER BY c.cname;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.*
FROM `order` o
         RIGHT JOIN customer c ON c.cid = o.cid
WHERE o.cid IS NULL;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

SELECT o.oid, o.odate, SUM(p.pprice * o2.odqty) AS `Total`
FROM `order` o
         JOIN orderdetail o2 ON o.oid = o2.oid
         JOIN product p ON p.pid = o2.pid
GROUP BY o.oid;

# SELECT *
# FROM `order` o
#          JOIN orderdetail o2 ON o.oid = o2.oid
#          JOIN product p ON p.pid = o2.pid;

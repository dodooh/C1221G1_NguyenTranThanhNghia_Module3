USE furama_resort;
-- Tim  customer_name khong trung lap
    -- Cach 1
    SELECT DISTINCT  customer_name from customer;

    -- Cach 2
    select customer_name FROM customer GROUP BY customer_name;

    -- Cach 3
    SELECT customer_name FROM customer
    UNION
    SELECT customer_name FROM customer;

-- Tim customer_name trung lap
    -- Cach 1
    SELECT customer_name
    FROM customer
    GROUP BY customer_name
    HAVING COUNT(*) > 1;

    -- Cach 2
    SELECT DISTINCT c.customer_name
    FROM customer c
             INNER JOIN customer d ON c.customer_name = d.customer_name
    WHERE c.customer_id <> d.customer_id;

    -- Cach 3
    select DISTINCT customer_name
    from customer c
    where (select count(*)
        from customer d
        where d.customer_name = c.customer_name) > 1;


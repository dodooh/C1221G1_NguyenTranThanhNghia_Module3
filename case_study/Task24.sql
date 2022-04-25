USE furama_resort;

DELIMITER ##
CREATE PROCEDURE sp_add_new_contract(new_created_date DATE,
                                     new_end_date DATE,
                                     new_deposit double,
                                     new_staff_id int,
                                     new_customer_id int,
                                     new_service_id int)
BEGIN
    insert into contract set created_date = new_created_date,
                             end_date = new_end_date,
                             deposit = new_deposit,
                             staff_id = new_staff_id,
                             customer_id = new_customer_id,
                             service_id = new_service_id;
END ##;
DELIMITER ;

call sp_add_new_contract('2020-03-02', '2021-03-02', 500000,3,4,2);

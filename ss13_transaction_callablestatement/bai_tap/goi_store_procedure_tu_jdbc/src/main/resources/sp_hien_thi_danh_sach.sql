use demo;

Delimiter //
create procedure show_list()
begin
select * from users;
end //
delimiter ;

call show_list();

Delimiter //
create procedure update_user(IN inp_id int, IN new_name VARCHAR(100), IN new_email VARCHAR(100),
                             IN new_country VARCHAR(100))
begin
update users set name = new_name, email= new_email, country =new_country where id = inp_id;
end //
delimiter ;


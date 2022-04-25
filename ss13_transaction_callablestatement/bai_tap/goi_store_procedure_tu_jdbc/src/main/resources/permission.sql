use demo;

create table Permision
(
    id   int(11) primary key,
    name varchar(50)
);

create table User_Permision
(
    permision_id int(11),
    user_id      int(11)
);


insert into Permision(id, name)
values (1, 'add');
insert into Permision(id, name)
values (2, 'edit');
insert into Permision(id, name)
values (3, 'delete');
insert into Permision(id, name)
values (4, 'view');

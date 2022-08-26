create database key_prim
use key_prim

create table ineuron(
course_id int not null,
course_name varchar(60),
course_status varchar(40),
number_of_enro int ,
primary key(course_id));

insert  into ineuron values(10, 'FSDA', 'Active',100)

select * from ineuron
insert  into ineuron values(10, 'FSDY', 'Non- Active',100) # throwing error bcz primary key can not be dublicated or not be null
insert  into ineuron values(11, 'FSDY', 'Non- Active',100)

create table student_ineuron(
student_id int,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(40),
course_id1 int,
primary key(course_id1)
foreign key(course_id1) references ineuron(course_id))

select * from student_ineuron

insert into student_ineuron values(101, 'FSDA', 'test@gmail.com', 'Active', 05) # throwing error bcz 05 has no assocition with primary key(course_id)
insert into student_ineuron values(101, 'FSDA', 'test@gmail.com', 'Active', 11) # findout relations


insert into student_ineuron values(101, 'FSDA', 'test@gmail.com', 'Active', 11)
insert into student_ineuron values(101, 'FSDA', 'test@gmail.com', 'Active', 11)
insert into student_ineuron values(101, 'FSDA', 'test@gmail.com', 'Active', 11) #one to many relationship ( one course id multipal student enroll)


create table payment(
course_name varchar (60),
course_id int,
course_live_status varchar(60),
course_launch_date varchar(60),
foreign key(course_id) references ineuron(course_id))

insert into payment values('FSDA',06,'not-active','7th Aug') #error bcz course id 06 not in parent table not relatable
insert into payment values('FSDA',10,'not-active','7th Aug')
insert into payment values('FSDA',10,'not-active','7th Aug')
insert into payment values('FSDA',10,'not-active','7th Aug')

create table class(
course_id int,
class_name varchar (60),
class_topic varchar (60),
class_duration int,
primary key(course_id),
foreign key(course_id) references ineuron(course_id))

alter table ineuron drop primary key

alter table class drop primary key #not allowing me to drop bcz its connected with forign key

drop table class # 1st delete all child table then u can drop parent table

create table test(
id int not null,
name varchar (60),
email_id varchar (60),
mobile_no varchar (9),
addresss varchar (60))

alter table test add primary key(id)

alter table test drop primary key

alter table test add constraint test_prim primary key(id, email_id) # 2 primary key combination created after droping child table 
# multipal primary key can not create in 1 table


create table parent(
id int not null,
primary key(id))

create table child(
id int,
parent_id int,
foreign key (parent_id) references parent(id)) # baseed on child table we are creating associatin btwen parent table 

insert into parent values(1)
select * from parent
insert into child values(1,1)
select * from child
insert into child values(1,2) # showing error

delete from parent where id= 1 # error bcz its association with parent and child table
delete from child where id = 1 # 1st delete child then only delete parent

# casecade
drop table child

create table child(
id int,
parent_id int,
foreign key (parent_id) references parent(id) on delete cascade) #delete

insert into child values(1,1),(1,2),(2,3),(3,2) #error reason value 

select * from child # auto updated prant_id deleted 1 

delete from parent where id = 1 # this time its allowing bccz of cascade automatically updated 

select * from parent

update parent set id = 3 where id = 2

drop table child

create table child(
id int,
parent_id int,
foreign key (parent_id) references parent(id) on update cascade) # update

insert into child values(1,1),(1,2),(2,3),(3,2)

select * from child 
select * from parent

update parent set id = 3 where id = 2




create database ineuron
use ineuron

create table course2(
course_id int,
course_desc varchar(60),
course_mentor varchar(60),
course_price int,
course_disc int,
create_date date,
user_info varchar(60))

create table course_update(
course_metor_update varchar(50),
course_price_update int ,
course_discount_update int )

#------------BEFORE INSERT TRIGERRS----------------------------------

delimiter //
create trigger course_before_insert1123
before insert
on course2 for each row
begin
	declare user_val varchar(60);
	set new.create_date = sysdate();
    select user() into user_val;
    set new.user_info = user_val;
    insert into ref_course values (sysdate(),user_val);
end; //

create table ref_course (
record_insert_date date,
record_insert_user varchar(60))


select * from course2;
select * from ref_course

insert into course2 (course_id,course_desc,course_mentor,course_price,course_disc) values(101,'FSDA','Sudhanshu',4000,10)


create table test1(
c1 varchar (50),
c2 date ,
c3 int)

create table test2(
c1 varchar (50),
c2 date ,
c3 int)

create table test3(
c1 varchar (50),
c2 date ,
c3 int)


delimiter //
create trigger to_update_others
before insert on test1 for each row
begin
	insert into  test2 values("xyz",sysdate(),23354);
	insert into  test3 values("xyz",sysdate(),23354);
end ;//


insert into test1 values("sudhanshu",sysdate(),234234);

select * from test1;
select * from test2;
select * from test3;

#-----------AFTER INSERT----------------------------------

delimiter //
create trigger to_update_after_table
after insert on test1 for each row
begin
	update test2 set c1= 'abc' where c1 = 'xyz';
	delete from test3 where c1 = 'xyz' ;
end ;//

insert into test1 values("mick",sysdate(),987654);

#-----------AFTER AND BEFORE DELETE----------------------------------

delimiter //
create trigger to_delete_after
after delete on test1 for each row
begin
	insert into test3 values("after_delete_opera",sysdate(),123456) ;
end ;//

select * from test1;

delete from test1 where c1 = 'krish';

select * from test3;

delimiter //
create trigger to_delete_before
before delete on test1 for each row
begin
	insert into test3 values("after_delete_opera",sysdate(),123456) ;
end ;//


select * from test1;

delete from test1 where c1 = 'sudhanshu'; #sudhanshu will delete from test1 and it will updtae in test3 as per trigers 

select * from test3;


delimiter //
create trigger we_are_doing_in_same_table_check
before delete on test1 for each row
begin
	insert into test3 values(old.c1,old.c2,old.c3) ;
end ;//

select * from test1;

delete from test1 where c1 = 'sbc';

create table test11(
c1 varchar(50),
c2 date,
c3 int)


create table test12(
c1 varchar(50),
c2 date,
c3 int )


create table test13(
c1 varchar(50),
c2 date,
c3 int )


#---------- before delete perform-----------
delimiter //
create trigger to_delete_others_before_observation3
before delete on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //



insert into test11 values("mark" , sysdate(), 435456);
select * from test11

delete from test11 where c1 = 'sudhanshu'

select * from test12

#---------- after delete perform-----------
delimiter //
create trigger to_delete_others_before_observation4
after delete on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

delete from test11 where c1 = 'sudhanshu';

select * from test12

#---------- after update perform-----------
delimiter //
create trigger to_update_others_after_observation4
after update on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

select * from test11;

insert into test11 values("after update" , sysdate(), 654321); 

update test11 set c1 = "after update" where c1 = "after delete";

insert into test11 values("sudh",sysdate(),12345)

select * from test12; 


#---------- before update perform-----------
delimiter //
create trigger to_update_others_before_observation4
before update on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(new.c1, new.c2,new.c3);
end; //


update test11 set c1 = "insert new" where c1 = "sudh";

#Conclusion - before triggers happens 1st then after one will use 

#---------------- CAse Statement-----------
use ineuron_partition;

SELECT * FROM ineuron_partition.ineuron_course;

select * ,
case
	when course_name = 'FSDA' then 'This is my batch'
    else 'its not your batch'
end as statement
from ineuron_course    


select * ,
case
	when length(course_name) = 4 then 'length is 4'
    when length(course_name) = 2 then 'length is 2'
    else 'no lenth find'
end as statement
from ineuron_course    

create database ineuron_partition
use ineuron_partition

create table ineuron_course(
course_name varchar(50),
course_id int,
course_tital varchar(60),
course_disc varchar(60),
launch_date date,
course_fees int ,
course_mentor varchar(60),
course_launch_year int )

insert into ineuron_course values('machine_learning', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('aiops', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('dlcvnlp', 101, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('awl_cloud', 101, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('block_chain', 101, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('rl', 101, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('big_data', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('FSDS', 101, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('FSDA', 101, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Java', 101, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Data_analytics', 101, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('febe', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('Python', 101, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022)

select * from ineuron_course

select * from ineuron_course where course_launch_year = 2020

create table ineuron_courses1(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range(course_launch_year)(
partition p0 values less than (2019),
partition p1 values less than (2020),
partition p2 values less than (2021),
partition p3 values less than (2022),
partition p4 values less than (2023));

insert into ineuron_courses1 values('machine_learning', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('aiops', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('dlcvnlp', 101, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('awl_cloud', 101, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('block_chain', 101, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('rl', 101, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('big_data', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('FSDS', 101, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('FSDA', 101, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Java', 101, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Data_analytics', 101, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('febe', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('Python', 101, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022);

select * from ineuron_courses1 where course_launch_year = 2020;

select partition_name , table_name , table_rows from information_schema.partitions where table_name  = 'ineuron_courses1';

create table ineuron_courses2(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by hash(course_launch_year)
partitions 5; #crating 5 partition 

select partition_name , table_name , table_rows from information_schema.partitions where table_name  = 'ineuron_courses2';

create table ineuron_courses3(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by hash(course_launch_year)
partitions 10; #crating 5 partition 

insert into ineuron_courses3 values('machine_learning', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('aiops', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('dlcvnlp', 101, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('awl_cloud', 101, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('block_chain', 101, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('rl', 101, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('big_data', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('FSDS', 101, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('FSDA', 101, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Java', 101, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Data_analytics', 101, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('febe', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('Python', 101, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022);

select partition_name , table_name , table_rows from information_schema.partitions where table_name  = 'ineuron_courses3';

----------- KEY PARTITION---------------
create table ineuron_courses4(
course_name varchar(50),
course_id int(10) primary key,
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by key()
partitions 10; 

select partition_name , table_name , table_rows from information_schema.partitions where table_name  = 'ineuron_courses4';

insert into ineuron_courses4 values('machine_learning', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('aiops', 102, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('dlcvnlp', 103, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('awl_cloud', 104, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('block_chain', 105, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('rl', 106, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('big_data', 107, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('FSDS', 108, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('FSDA', 109, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Java', 110, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Data_analytics', 111, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('febe', 112, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('Python', 113, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022);

select * from ineuron_courses4;

SELECT MD5('MPythonERN') #shoiwng results of how sql storing in backend

create table ineuron_courses6(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by list(course_launch_year)(
partition p0 values in (2020,2021),
partition p1 values in (2019,2022)
); 

insert into ineuron_courses6 values('machine_learning', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('aiops', 102, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('dlcvnlp', 103, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('awl_cloud', 104, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('block_chain', 105, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('rl', 106, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('big_data', 107, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('FSDS', 108, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('FSDA', 109, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Java', 110, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Data_analytics', 111, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('febe', 112, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('Python', 113, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022);

select partition_name , table_name , table_rows from information_schema.partitions where table_name  = 'ineuron_courses6';

create table ineuron_courses7(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range columns(course_name , course_launch_year,course_id)(
partition p0 values less than ('aiops',105,2019),
partition p1 values less than ('fsds',110,2021),
partition p2 values less than ('Python',113,2022)
)

select partition_name , table_name , table_rows from information_schema.partitions where table_name  = 'ineuron_courses7';

insert ignore into ineuron_courses7 values('machine_learning', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('aiops', 102, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('dlcvnlp', 103, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('awl_cloud', 104, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('block_chain', 105, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('rl', 106, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('big_data', 107, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('FSDS', 108, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('FSDA', 109, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Java', 110, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Data_analytics', 111, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('febe', 112, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('Python', 113, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022);

select ('aiops',105,2019) < ('fsds' ,110,2021); # 1 means true tht means it will add in partition
select ('a') > ('b'); # 1 


create table ineuron_courses8(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by list columns(course_name )(
partition p0 values in ('aiops','big_data','Java','Data_analytics','febe'),
partition p1 values in  ('fsds','dlcvnlp','rl'),
partition p2 values in ('Python','awl_cloud','machine_learning')
);

insert ignore into ineuron_courses8 values('machine_learning', 101, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('aiops', 102, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('dlcvnlp', 103, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('awl_cloud', 104, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('block_chain', 105, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('rl', 106, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('big_data', 107, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('FSDS', 108, 'ML', "this is Ml class" , '2020-07-07' ,3540, 'sudhanshu', 2020),
('FSDA', 109, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Java', 110, 'ML', "this is Ml class" , '2021-07-07' ,3540, 'sudhanshu', 2021),
('Data_analytics', 111, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022),
('febe', 112, 'ML', "this is Ml class" , '2019-07-07' ,3540, 'sudhanshu', 2019),
('Python', 113, 'ML', "this is Ml class" , '2022-07-07' ,3540, 'sudhanshu', 2022);

select partition_name , table_name , table_rows from information_schema.partitions where table_name  = 'ineuron_courses8'

drop table ineuron_courses1

create table ineuron_courses10(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int)
partition by range(course_launch_year)
subpartition by hash(course_launch_year)
subpartitions 5 (
partition p0 values less than (2019) ,
partition p1 values less than (2020) ,
partition p2 values less than (2021) ,
partition p3 values less than (2022) 
);
select partition_name , table_name , table_rows from information_schema.partitions where table_name  = 'ineuron_courses10'





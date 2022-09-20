create database operation
use operation

create table if not exists course (
course_id int,
course_name varchar (60),
course_desc varchar (60),
course_tage varchar(60))

create table if not exists student(
student_id int,
student_name varchar(60),
student_mobile int,
student_course_enroll varchar (60),
student_course_id int)

insert into course values(101, 'fsda','full stack data analytics','Analytics'),
(102, 'fsds','full stack data analytics','Analytics'),
(103, 'fsds','full stack data science','Ds'),
(104, 'big data','full stack big data','BD'),
(105, 'mern','web dev','mern'),
(106, 'block chain','full stack block chain','BC'),
(101, 'java','full stack java','java'),
(102, 'testing','full stack testing','testing'),
(105, 'cyber security','full stack cyber security','CS'),
(109, 'C','C language','C'),
(108, 'C++','C ++ language','C++')

insert into student values(301 , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(301 , "sudhanshu", 3543453,'yes', 105),
(302 , "sudhanshu", 3543453,'yes', 106),
(303 , "sudhanshu", 3543453,'yes', 101),
(304 , "sudhanshu", 3543453,'yes', 103),
(305 , "sudhanshu", 3543453,'yes', 105),
(306 , "sudhanshu", 3543453,'yes', 107),
(306 , "sudhanshu", 3543453,'yes', 103)

select * from course

select * from student

-- Inner Join ----------------
select c.course_id, c.course_name, c.course_desc , s.student_id, s.student_name, s.student_course_id from course c
inner join student s on c.course_id = s.student_course_id

---- Left Join ------------
select c.course_id, c.course_name, c.course_desc , s.student_id, s.student_name, s.student_course_id from course c
left join student s on c.course_id = s.student_course_id

select c.course_id, c.course_name, c.course_desc , s.student_id, s.student_name, s.student_course_id from course c
left join student s on c.course_id = s.student_course_id where  s.student_id is null #all three courses not parchased by anyone

-------- Right Joint -------------------

select c.course_id, c.course_name, c.course_desc , s.student_id, s.student_name, s.student_course_id from course c
right join student s on c.course_id = s.student_course_id

select c.course_id, c.course_name, c.course_desc , s.student_id, s.student_name, s.student_course_id from course c
right join student s on c.course_id = s.student_course_id where  c.course_id is null #all three courses not parchased by anyone

--------- Cross Join ----------------------

select c.course_id, c.course_name, c.course_desc , s.student_id, s.student_name, s.student_course_id from course c
cross join student s # Combine all 

--------- Indexing -------------
create table if not exists course1 (
course_id int,
course_name varchar (60),
course_desc varchar (60),
course_tage varchar(60),
index (course_id)
)

insert into course1 values(101, 'fsda','full stack data analytics','Analytics'),
(102, 'fsds','full stack data analytics','Analytics'),
(103, 'fsds','full stack data science','Ds'),
(104, 'big data','full stack big data','BD'),
(105, 'mern','web dev','mern'),
(106, 'block chain','full stack block chain','BC'),
(101, 'java','full stack java','java'),
(102, 'testing','full stack testing','testing'),
(105, 'cyber security','full stack cyber security','CS'),
(109, 'C','C language','C'),
(108, 'C++','C ++ language','C++')

show index from course1

create table if not exists course2 (
course_id int,
course_name varchar (60),
course_desc varchar (60),
course_tage varchar(60),
index (course_id,course_name)
)

create table if not exists course4 (
course_id int,
course_name varchar (60),
course_desc varchar (60),
course_tage varchar(60),
index (course_id,course_name,course_tage)
)

show index from course4
insert into course4 values(101, 'fsda','full stack data analytics','Analytics'),
(102, 'fsds','full stack data analytics','Analytics'),
(103, 'fsds','full stack data science','Ds'),
(104, 'big data','full stack big data','BD'),
(105, 'mern','web dev','mern'),
(106, 'block chain','full stack block chain','BC'),
(101, 'java','full stack java','java'),
(102, 'testing','full stack testing','testing'),
(105, 'cyber security','full stack cyber security','CS'),
(109, 'C','C language','C'),
(108, 'C++','C ++ language','C++')

select * from course4 where course_id = 106

describe course4

----------- Union--------------------------------------

select course_id , course_name , course_desc from course
union 
select student_id , student_name from student ## no of coulums must be same

#------------ CTE --------------------

with sample_student as (
select * from course where course_id  in (101,102,106))
select * from sample_student where course_tage = 'java' # temp table created as Sample_student as CTE

with outcoume_corss as (select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
cross  join student s ) select course_id , course_name ,student_id from outcoume_corss where student_id = 301


#---------------- explain CTE------
with ctetest as (select 1 as col1, 2 as col2
union all 
select 3,4)
select col1 from ctetest # table created with help of CTE

with recursive cte(n) as
( select 1 union  all select n+1 from cte where n<5)
select * from cte   # means CTE ke under CTE like n, n+1 ....

with recursive sudh as
(select 1 as n, 1 as p , -1 as 	q
union all 
select n+1, p + 1,q+2 from sudh where n<5)
select * from sudh















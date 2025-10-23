show databases;
create database my;
use my;
create table student(
id INT PRIMARY KEY,
name varchar(30),
gpa decimal(3,2));
describe student;
alter table student add register_no varchar(30);
describe student;
alter table student add department varchar(30);
describe student;
alter table student drop department;
alter table student drop register_no;
insert into student values(1,"aadhish",9.0);
insert into student values(2,"kowsick",1.0);
insert into student values(3,"vasanth",9.0);
select * from student;
insert into student values(4,"prathish",9.0),(5,"kandha",9.0),(6,"vikaram",9.0);
select * from student;
insert into student (id,name) values(7,"shevak");
select * from student;
create table employee(
empid int primary key,
ename varchar(30),
job_dsec varchar(20),
salary int);
describe employee;
insert into employee (empid,ename,job_dsec,salary) values
(8101,"sakthi","df",10000),
(8102,"aadhish","df",150000),
(8103,"kowsick","df",170000),
(8104,"shevak","df",200000),
(8105,"deepak","df",156000),
(8106,"praba","df",1500010),
(8107,"vasanth","HR",1500056),
(8108,"yuvasri","df",1500156),
(8109,"sathish","df",15893),
(8110,"kowsi","df",155600),
(8112,"logapriya","df",1525);
-- inserting the data's in the table 
select * from employee
where ename<>"kowsick";
select * from employee
where ename="kowsick";
select * from employee
where salary>10000;
select * from employee
where salary<200000 and job_dsec="df";
select * from employee
where job_dsec in("df","df");
select * from employee
where job_dsec not in("df","df");
-- where keyword is used to find the data with conditions
select * from employee
limit 5;
select * from employee
where ename like 'a%';
select * from employee
where ename not like 'a%';
select * from employee
where ename like 'a%a';
select * from employee
where ename like '%i%';
update employee
set job_dsec='software_engineer'
where empid=8101;
select * from employee
where ename like '__i%';
describe employee;
SET SQL_SAFE_UPDATES=0;
update employee
set job_dsec='engineer'
where job_dsec='df';
-- to update the table
select * from employee;
delete from employee where empid=8104;
-- to delete a data in the table
select * from employee;
-- delete a data from the table
select distinct job_dsec from employee;
select *from employee
order by ename desc;
-- order the data in desending order
select *from employee
order by ename;
-- order the data in ascending order
select*from employee
order by salary;
select * from employee
where job_dsec='engineer'
order by salary;
select*from employee
order by (case job_dsec 
when 'engineer' then 1
when 'HR' then 2
else 100 end
);
-- if i need to priorties somebody for sorting
select count(*) total from  employee;
-- get the total count of table 
select count(*) no_of_HR from employee
where job_dsec='HR';
-- get the specific area counted in the table
select avg(salary) from employee where job_dsec='engineer';
-- to get the average value
select sum(salary) from employee where job_dsec='engineer';
-- to get the sum value 
select max(salary) from employee;
-- to get the maximum value
select min(salary) from employee;
-- to get the minimum value 
select ucase(ename),salary from employee;
-- to change data to upper case data
select lcase(ename),salary from employee;
-- to change data to lower case data
select ename,char_length(ename) char_count from employee;
-- to get the count of the char
select ename,concat('rs.',salary) from employee;
-- to concordinate the values
select ename,concat('rs.',format(salary,0)) from employee;
-- to format the values like this 10,000
select ename,left(job_dsec,3)
from employee;
-- to get the first three letters of the section
select job_dsec,avg(salary) from employee group by job_dsec;
-- to get the group of section avg
select job_dsec,count(empid) from employee group by job_dsec;
-- to get the group of a section count
select job_dsec,count(empid) from employee group by job_dsec having count(empid)>1;
-- to find the empid more than one
select job_dsec,count(empid) from employee group by job_dsec having count(empid)>1 order by job_dsec;
create table employ(
empid int primary key,
ename varchar(30)NOT NULL,
job_desc varchar(20) default 'assigned',
salary int,
pan varchar(10) unique);
describe employ;
create table employees(
empid int primary key,
ename varchar(30)NOT NULL,
job_desc varchar(20) default 'assigned',
salary int,
pan varchar(10) unique,
check (salary>10000));
describe employees;
alter table employees drop pan;
describe employees;
insert into employees values(1,'vasanth','admin',50000);
insert into employees values(2,'aadhish','topper',100000);
insert into employees values(3,'sandhosh','robot',5000);
alter table employees modify ename varchar(30);
describe employees;
alter table employees
alter job_desc drop default;
-- drop deafult constraint
alter table employees
alter job_desc set default 'assigned';
-- set deafult constraint
alter table employees
add check(salary>10000);
-- add check constraint
create table emp(
empid int primary key auto_increment,
ename varchar(30),
job_dsec varchar(20),
salary int);
create table branch(
branch_id int primary key auto_increment,
branch_name varchar(30) not null,
address varchar(200));
create table emp1(
emp_id int primary key auto_increment,
ename varchar(30) not null,
job_desc varchar(30),
salary int,
branch_id int,
constraint fk_branchId foreign key(branch_id) references branch(branch_id));
show index from emp1;
create index name_index on emp1(ename);
show index from emp1;
drop index name_index on emp1;
insert into branch values(1,'thanjai','120 15 th street');
insert into branch values(2,'chennai','sp bala 10th street');
insert into branch values(3,'new_york','11th street');
select*from branch;
insert into emp1 values(1,'kowsick','CEO_Google',10000,1);
insert into emp1 values(2,'dhanusri','youtubeceo',300000,3);
insert into emp1 values(3,'ahaan','robot',20000,2);
select emp1.emp_id,emp1.ename,emp1.job_desc,emp1.salary,branch.branch_name
 from emp1 
 join branch 
 on emp1.branch_id=branch.branch_id;
 -- linking the branch and emp1 table
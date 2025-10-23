create database jdbcdemo;
use jdbcdemo;
create table employee(
emp_id INT PRIMARY KEY,
ename VARCHAR(30),
salary INT);
insert into employee values(1,"ram",5000000);
insert into employee values(2,"KOWSICK",550456300);
select * from employee;
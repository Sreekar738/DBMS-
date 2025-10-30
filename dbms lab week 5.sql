drop database if exists employee;
create database employee;
use employee;
create table Department(
dept_no int primary key,
dept_name varchar(30),
dept_location varchar(30)
);
create table Employee(
emp_no int primary key,
emp_name varchar(30),
job_role varchar(30),
dept_no int,
foreign key(dept_no) references Department(dept_no)
);
create table Project(
project_no int primary key,
project_name varchar(30),
project_location varchar(30)
);
create table Incentive(
emp_no int,
incentive_amount decimal(10,2),
foreign key(emp_no) references Employee(emp_no)
);
create table Works_on (
emp_no int,
project_no int,
primary key(emp_no,project_no),
foreign key(emp_no) references Employee(emp_no),foreign key(project_no)
references Project(project_no)
);
insert into Department values
(1,'IT','Bengaluru'),
(2,'HR','Hyderabad'),
(3,'Finance','Mysuru'),
(4,'Admin','Chennai'),
(5,'Sales','Delhi');
select * from Department;
insert into Employee values
(101,'Arjun','Developer',1),
(102,'Meena','HR executive',2),
(103,'Ravi','Analyst',3),
(104,'Kiran','Manager',1),
(105,'Sita','Clerk',4),
(106,'Varun','Sales Executive',5);
select * from Employee;
insert into Project values
(201,'ERP System','Bengaluru'),
(202,'Recruitment Portal','Hyderabad'),
(203,'Office Renovation','Chennai'),
(204,'Payroll System','Mysuru'),
(205,'Sales tracker','Delhi');
select * from project;

insert into Works_on values
(101,201),
(102,202),
(103,203),
(104,201),
(105,204),
(106,205);
select * from Works_on;
insert into Incentive values
(101,5000),
(103,3000),
(104,4000);
select * from Incentivce;
select emp_no from Employee where emp_no not in(select emp_no from Incentive);
select distinct e.emp_no from Employee e join Works_on w on e.emp_no=w.emp_no join Project p on w.project_no=p.project_no where p.project_location in ('Hyderabad','Bengaluru','Mysuru');
select e.emp_name,e.emp_no,d.dept_name,e.job_role,d.dept_location  as department_location p.project_location from Employee e join Department d on e.dept_no=d.dept_no join Works_on w on e.emp_no=w.emp_no join project
p on w.project_no=p.project_no where d.dept_location=p.project_location;



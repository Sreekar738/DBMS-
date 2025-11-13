create database bankdatabase;
use bankdatabase;

create table if not exists Branch(
    branch_name varchar(30),
    branch_city varchar(20),
    assets int(10),
    primary key(branch_name)
);

create table if not exists BankAccount(
    accno int(10),
    branch_name varchar(30),
    balance int(10),
    primary key(accno),
    foreign key(branch_name) references Branch(branch_name)
);

create table if not exists BankCustomer(
    customer_name varchar(30),
    customer_street varchar(30),
    customer_city varchar(20),
    primary key(customer_name)
);

create table if not exists Depositer(
    customer_name varchar(30),
    accno int(10),
    primary key(customer_name, accno),
    foreign key(customer_name) references BankCustomer(customer_name)
);

create table if not exists Loan(
    loan_number int(10),
    branch_name varchar(30),
    amount int(10),
    primary key(loan_number),
    foreign key(branch_name) references Branch(branch_name)
);

insert into Branch(branch_name, branch_city, assets)
values
('sbi_chamarajpet','bangalore',50000),
('sbi_residencyroad','bangalore',10000),
('sbi_shivajiroad','bombay',20000),
('sbi_parliamentroad','delhi',10000),
('sbi_jantarmantar','delhi',20000);
select * from Branch;

insert into BankAccount(accno, branch_name, balance)
values
(1,'sbi_chamarajpet',2000),
(2,'sbi_residencyroad',5000),
(3,'sbi_shivajiroad',6000),
(4,'sbi_parliamentroad',9000),
(5,'sbi_jantarmantar',8000),
(6,'sbi_shivajiroad',4000),
(7,'sbi_residencyroad',4000),
(8,'sbi_parliamentroad',3000),
(9,'sbi_residencyroad',5000),
(10,'sbi_jantarmantar',2000);
select * from BankAccount;

insert into BankCustomer(customer_name, customer_street, customer_city)
values
('avinash','bull_temple_road','bangalore'),
('dinesh','bannergatta_road','bangalore'),
('mohan','nationalcollege_road','bangalore'),
('nikil','akbar_road','delhi'),
('ravi','prithvirajroad','delhi');
select * from BankCustomer;

insert into Depositer(customer_name, accno)
values
('avinash',1),
('dinesh',2),
('nikil',4),
('ravi',5),
('avinash',8),
('nikil',9),
('dinesh',10),
('nikil',11);
select * from Depositer;

insert into Loan(loan_number, branch_name, amount)
values
(1,'sbi_chamarajpet',1000),
(2,'sbi_residencyroad',2000),
(3,'sbi_shivajiroad',3000),
(4,'sbi_parliamentroad',4000),
(5,'sbi_jantarmantar',5000);
select * from Loan;

SELECT branch_name,branch_city,(assets / 100000.0) AS `assets in lakhs`
FROM Branch;
CREATE VIEW BranchLoanSummary AS
SELECT branch_name, SUM(amount) AS total_loan_amount
FROM Loan
GROUP BY branch_name;

SELECT * FROM BranchLoanSummary;

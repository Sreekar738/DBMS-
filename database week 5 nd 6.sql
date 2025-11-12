CREATE DATABASE employee;
USE employee;

CREATE TABLE DEPT (
    DEPT_NO INT PRIMARY KEY,
    DEPT_NAME VARCHAR(50),
    DLOC VARCHAR(100)
);

CREATE TABLE EMPLOYEE (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(50),
    MGRNO INT,
    HIREDATE DATE,
    SAL DECIMAL(10, 2),
    DEPT_NO INT,
    FOREIGN KEY (DEPT_NO) REFERENCES DEPT(DEPT_NO)
);

CREATE TABLE PROJECT (
    PNO INT PRIMARY KEY,
    PNAME VARCHAR(50),
    PLOC VARCHAR(100)
);

CREATE TABLE ASSIGNED_TO (
    EMP_ID INT,
    PNO INT,
    JOB_ROLE VARCHAR(50),
    PRIMARY KEY (EMP_ID, PNO),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
    FOREIGN KEY (PNO) REFERENCES PROJECT(PNO)
);

CREATE TABLE INCENTIVES (
    EMP_ID INT,
    INCENTIVE_DATE DATE,
    INCENTIVE_AMOUNT DECIMAL(10, 2),
    PRIMARY KEY (EMP_ID, INCENTIVE_DATE),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID)
);

INSERT INTO DEPT (DEPT_NO, DEPT_NAME, DLOC) VALUES
    (1, 'Computer Science', 'Bangalore'),
    (2, 'Electrical', 'Delhi'),
    (3, 'Mechanical', 'Pune'),
    (4, 'Civil', 'Mumbai'),
    (5, 'Electronics', 'Chennai');

SELECT * FROM DEPT;

INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, MGRNO, HIREDATE, SAL, DEPTNO) VALUES
    (1001, 'John', NULL, '2020-05-01', 55000, 1),
    (1002, 'Smith', 1001, '2021-03-15', 60000, 2),
    (1003, 'Sam', 1001, '2019-11-23', 65000, 3),
    (1004, 'Alice Johnson', 1003, '2022-06-12', 70000, 4),
    (1005, 'Bob White', 1002, '2023-02-10', 72000, 5);

SELECT * FROM EMPLOYEE;

INSERT INTO PROJECT (PNO, PNAME, PLOC) VALUES
    (101, 'AI Research', 'Bangalore'),
    (102, 'Solar Panel Design', 'Delhi'),
    (103, 'Bridge Construction', 'Pune'),
    (104, 'Robotics', 'Chennai'),
    (105, 'Network Security', 'Mumbai');

SELECT * FROM PROJECT;

INSERT INTO ASSIGNED_TO (EMP_ID, PNO, JOB_ROLE) VALUES
    (1001, 101, 'Project Manager'),
    (1002, 102, 'Lead Engineer'),
    (1003, 103, 'Assistant Engineer'),
    (1004, 104, 'Researcher'),
    (1005, 105, 'Technician');

SELECT * FROM ASSIGNED_TO;

INSERT INTO INCENTIVES (EMP_ID, INCENTIVE_DATE, INCENTIVE_AMOUNT) VALUES
    (1001, '2022-12-15', 5000),
    (1002, '2023-01-10', 6000),
    (1003, '2023-03-05', 4500),
    (1004, '2023-06-20', 7000),
    (1005, '2023-07-25', 7500);

SELECT * FROM INCENTIVES;

SELECT EMP_ID FROM EMPLOYEE WHERE EMP_ID NOT IN (SELECT EMP_ID FROM INCENTIVES);

SELECT DISTINCT e.EMP_ID
FROM EMPLOYEE e
JOIN ASSIGNED_TO w ON e.EMP_ID = w.EMP_ID
JOIN PROJECT p ON w.PNO = p.PNO
WHERE p.PLOC IN ('Hyderabad', 'Bengaluru', 'Mysuru');

SELECT m.EMP_NAME AS Manager, COUNT(e.EMP_ID) AS No_of_Employees
FROM EMPLOYEE m
JOIN EMPLOYEE e ON m.EMP_ID = e.MGRNO
GROUP BY m.EMP_ID, m.EMP_NAME
ORDER BY No_of_Employees DESC;





SELECT e.*
FROM EMPLOYEE e
JOIN INCENTIVES i ON e.EMP_ID = i.EMP_ID
WHERE i.INCENTIVE_DATE BETWEEN '2019-01-01' AND '2019-01-31'
AND i.INCENTIVE_AMOUNT = (
    SELECT MAX(INCENTIVE_AMOUNT)
    FROM INCENTIVES
    WHERE INCENTIVE_DATE BETWEEN '2019-01-01' AND '2019-01-31'
);
select e.emp_name from employee e join employee m on e.mgrno=m.emp_id where e.deptno =m.deptno;

SELECT m.EMP_NAME AS Manager
FROM EMPLOYEE m
WHERE m.SAL > (
    SELECT AVG(e.SAL)
    FROM EMPLOYEE e
    WHERE e.MGRNO = m.EMP_ID
);
select distinct e2.emp_name as second_level_manager,d.dept_name from employee e join employee e1 on e.mgrno=e1.emp_id join employee e2 on e1.mgrno=e2.emp_id join dept d on e.dept_no=d.dept_no
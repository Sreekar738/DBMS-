drop database if exists Supplier;
CREATE DATABASE Supplier;
USE Supplier;

CREATE TABLE Supplier (
    sid INT PRIMARY KEY,
    sname VARCHAR(20),
    city VARCHAR(20)
);

CREATE TABLE Parts (
    pid INT PRIMARY KEY,
    pname VARCHAR(20),
    color VARCHAR(20)
);

CREATE TABLE Catalog (
    sid INT,
    pid INT,
    cost DECIMAL(10,2),
    FOREIGN KEY (sid) REFERENCES Supplier(sid),
    FOREIGN KEY (pid) REFERENCES Parts(pid)
);

INSERT INTO Supplier(sid, sname, city) VALUES
(10001,'Acme Widget','Bangalore'),
(10002,'Johns','Kolkata'),
(10003,'Vimal','Mumbai'),
(10004,'Reliance','Delhi');
select * from Supplier;

INSERT INTO Parts(pid, pname, color) VALUES
(20001,'Book','Red'),
(20002,'Pen','Red'),
(20003,'Pencil','Green'),
(20004,'Mobile','Green'),
(20005,'Charger','Black');
select * from Parts;

INSERT INTO Catalog(sid, pid, cost) VALUES
(10001,20001,10),
(10001,20002,10),
(10001,20003,30),
(10001,20004,10),
(10001,20005,10),
(10002,20001,10),
(10002,20002,20),
(10003,20003,30),
(10004,20003,40);
select * from Catalog;
3.select distinct p.pname from parts p join catalog c on p.pid=c.pid;

4.select s.sname from supplier s where not exists(select p.pid from parts p where not exists(select c.pid from catalog c where c.sid=s.sid and c.pid=p.pid
)
);

5.select s.sname from Supplier s where not exists(
select p.pid from Parts p where p.color='Red' and not exists(
select * from catalog c where c.sid=s.sid and c.pid=p.pid
)
);

6.SELECT p.pname
FROM Parts p
WHERE p.pid IN (
    SELECT c.pid
    FROM Catalog c
    JOIN Supplier s ON c.sid = s.sid
    WHERE s.sname = 'Acme Widget Suppliers'
)
AND p.pid NOT IN (
    SELECT c.pid
    FROM Catalog c
    JOIN Supplier s ON c.sid = s.sid
    WHERE s.sname <> 'Acme Widget Suppliers'
);
7.select distinct c.sid from Catalog c join(
select pid,avg(cost) as avg_cost from catalog group by pid ) as A on c.pid =A.pid  where c.cost>A.avg_cost;

8.select p.pname ,s.sname from Parts p join Catalog c on p.pid=c.pid join Supplier s on c.sid = s.sid where c.cost=(
select max(cost) from Catalog where pid=p.pid
);

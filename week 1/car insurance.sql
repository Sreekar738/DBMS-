CREATE DATABASE IF NOT EXISTS insurance_new;
USE insurance_new;


CREATE TABLE IF NOT EXISTS person_info (
    driver_id VARCHAR(10),
    name VARCHAR(20),
    address VARCHAR(20),
    PRIMARY KEY(driver_id)
);


CREATE TABLE IF NOT EXISTS car (
    reg_num VARCHAR(10),
    model VARCHAR(10),
    year INT,
    PRIMARY KEY(reg_num)
);

CREATE TABLE IF NOT EXISTS owns (
    driver_id VARCHAR(10),
    reg_num VARCHAR(10),
    PRIMARY KEY(driver_id, reg_num),
    FOREIGN KEY(driver_id) REFERENCES person_info(driver_id),
    FOREIGN KEY(reg_num) REFERENCES car(reg_num)
);

CREATE TABLE IF NOT EXISTS accident (
    report_num INT,
    accident_date DATE,
    location VARCHAR(20),
    PRIMARY KEY(report_num)
);


CREATE TABLE IF NOT EXISTS participated (
    driver_id VARCHAR(10),
    reg_num VARCHAR(10),
    report_num INT,
    damage_amount INT,
    PRIMARY KEY(driver_id, reg_num, report_num),
    FOREIGN KEY(driver_id) REFERENCES person_info(driver_id),
    FOREIGN KEY(reg_num) REFERENCES car(reg_num),
    FOREIGN KEY(report_num) REFERENCES accident(report_num)
);


INSERT INTO accident (report_num, accident_date, location) VALUES 
(21, '2003-01-01', 'Mysore Road'),
(22, '2004-02-02', 'South Circle'),
(23, '2003-01-21', 'Bull Temple Road'),
(24, '2008-02-17', 'Mysore Road'),
(25, '2004-03-05', 'Kanakpura Road');


SELECT * FROM accident;


INSERT INTO person_info(driver_id, name, address) VALUES
('A01', 'Richard', 'Srinivas nagar'),
('A02', 'Pradeep', 'Rajaji nagar'),
('A03', 'Smith', 'Ashok nagar'),
('A04', 'Venu', 'NR Colony'),
('A05', 'Jhon', 'Hanumanth nagar');


SELECT * FROM person_info;


INSERT INTO car(reg_num, model, year) VALUES
('KA052250', 'Indica', 1990),
('KA031181', 'Lancer', 1957),
('KA095477', 'Toyota', 1998),
('KA053408', 'Honda', 2008),
('KA041702', 'Audi', 2005);


SELECT * FROM car;


INSERT INTO owns(driver_id, reg_num) VALUES
('A01', 'KA052250'),
('A02', 'KA053408'),
('A03', 'KA031181'),
('A04', 'KA095477'),
('A05', 'KA041702');


SELECT * FROM owns;




INSERT INTO participated(driver_id, reg_num, report_num, damage_amount) VALUES
('A01', 'KA052250', 21, 10000),
('A02', 'KA053408', 22, 50000),
('A03', 'KA095477', 23, 25000),
('A04', 'KA031181', 24, 3000),
('A05', 'KA041702', 25, 5000);




SELECT * FROM participated;

UPDATE participated 
SET damage_amount = 25000 
WHERE reg_num = 'KA053408' AND report_num = 22;


SELECT COUNT(DISTINCT a.driver_id) AS CNT
FROM participated a
JOIN accident b ON a.report_num = b.report_num
WHERE MONTH(b.accident_date) = 8;

SELECT EMP_ID FROM EMPLOYEE WHERE EMP_ID NOT IN (SELECT EMP_ID FROM INCENTIVES);

3.SELECT DISTINCT e.EMP_ID 
FROM EMPLOYEE e 
JOIN ASSIGNED_TO w ON e.EMP_ID = w.EMP_ID 
JOIN PROJECT p ON w.PNO = p.PNO 
WHERE p.PLOC IN ('Hyderabad', 'Bengaluru', 'Mysuru');

4.SELECT m.EMP_NAME AS Manager, COUNT(e.EMP_ID) AS No_of_Employees 
FROM EMPLOYEE m 
JOIN EMPLOYEE e ON m.EMP_ID = e.MGRNO 
GROUP BY m.EMP_ID, m.EMP_NAME 
ORDER BY No_of_Employees DESC;





6.SELECT e.*
FROM EMPLOYEE e
JOIN INCENTIVES i ON e.EMP_ID = i.EMP_ID
WHERE i.INCENTIVE_DATE BETWEEN '2019-01-01' AND '2019-01-31'
AND i.INCENTIVE_AMOUNT = (
    SELECT MAX(INCENTIVE_AMOUNT)
    FROM INCENTIVES
    WHERE INCENTIVE_DATE BETWEEN '2019-01-01' AND '2019-01-31'
);
7.select e.emp_name from employee e join employee m on e.mgrno=m.emp_id where e.deptno =m.deptno;

4.SELECT m.EMP_NAME AS Manager
FROM EMPLOYEE m
WHERE m.SAL > (
    SELECT AVG(e.SAL)
    FROM EMPLOYEE e
    WHERE e.MGRNO = m.EMP_ID
);
5.select distinct e2.emp_name as second_level_manager,d.dept_name from employee e join employee e1 on e.mgrno=e1.emp_id join employee e2 on e1.mgrno=e2.emp_id join dept d on e.dept_no=d.dept_no



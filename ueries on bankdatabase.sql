1.SELECT d.customer_name, b.branch_name, COUNT(d.accno) AS account_count
FROM Depositer d
JOIN BankAccount b ON d.accno = b.accno
GROUP BY d.customer_name, b.branch_name
HAVING COUNT(d.accno) >= 2;


2.select accno,branch_name,(balance*(1.05)) as 'updated balance' from BankAccount;

3.SELECT branch_name
FROM Branch
WHERE assets > (SELECT MAX(assets) FROM Branch WHERE branch_city = 'bangalore');
DELETE  from BankAccount where branch_name in (select branch_name from Branch where branch_city='delhi');
select * from BankAccount;

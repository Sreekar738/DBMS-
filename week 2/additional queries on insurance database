1.UPDATE participated 
SET damage_amount = 25000 
WHERE reg_num = 'KA053408' AND report_num = 22;


2.SELECT COUNT(DISTINCT a.driver_id) AS CNT
FROM participated a
JOIN accident b ON a.report_num = b.report_num
WHERE MONTH(b.accident_date) = 8;

3.SELECT * FROM participated ORDER BY damage_amount DESC;

4.select avg(damage_amount) from participated;

5.select MAX(damage_amount) from participated;

6.select driver_id from participated where damage_amount>(select avg(damage_amount) from participated);

7.delete from participated where damage_amount<(select avg(damage_amount) from participated);

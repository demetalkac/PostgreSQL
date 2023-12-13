CREATE TABLE my_companies
(
company_id integer,
company_name varchar(20)
);

INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');



CREATE TABLE orders
(
order_id integer,
company_id integer,
order_date date
);

INSERT INTO orders VALUES(11, 101, '17-Apr-2020');
INSERT INTO orders VALUES(22, 102, '18-Apr-2020');
INSERT INTO orders VALUES(33, 103, '19-Apr-2020');
INSERT INTO orders VALUES(44, 104, '20-Apr-2020');
INSERT INTO orders VALUES(55, 105, '21-Apr-2020');

CREATE TABLE workers
(
id integer,
name varchar(50),
state varchar(50),
salary integer,
company varchar(20)
	
);

INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

--UNION ALL :Does the same with UNION operator, just it returns repeated records if there is 
--Find the state whose salary is greater than 3000, employee names whose salary less than 2000 with duplication 

SELECT state AS "State or Employee Name", salary 
FROM workers
WHERE salary>3000

UNION ALL

SELECT name AS "State or Employee Name", salary 
FROM workers 
WHERE salary < 2000; 


--INTERSECT operator: 1)Returns the common records of two queries 
--					  2)It returns just the unique data 	

--Find all common employee names whose salary is greater than 2000 and company name is IBM, or APPLE, or MICROSOFT

SELECT name
FROM workers
WHERE salary >2000

INTERSECT 

SELECT name
FROM workers
WHERE company IN('IBM', 'APPLE', 'MICROSOFT');


--EXCEPT (MINUS) Operator: It returns the uncommon data from query1 and from query2.

--Find the employee names whose salary is less than 3000 and not working in Google
--NOT condition is coming from the EXCEPT operator

SELECT name 
FROM workers 
WHERE salary <3000

EXCEPT

SELECT name 
FROM workers 
WHERE company = 'GOOGLE';  


--JOINS 
--1) INNER JOIN: Returns the common data from 2 tables 
--2) LEFT JOIN: Returns the data from the first table 
--3) RIGHT JOIN: Returns the data from the second table
--4) FULL JOIN: Returns the data from both tables 
--5) SELF JOIN: You will have a single table but you will use it as if 2 tables.


--INNER JOIN: 
--Select company name, order id, order date for common companies
SELECT mc.company_name, o.order_id, o.order_date
FROM my_companies mc INNER JOIN orders o
ON o.company_id = mc.company_id;


--LEFT JOIN:
--Get the order id and order date for the companies in my_companies table
SELECT mc.company_name, o.order_id, o.order_date
FROM my_companies mc LEFT JOIN orders o 
ON o.company_id = mc.company_id;


--RIGHT JOIN:
--Get the order id and order date for the companies in orders table 
SELECT mc.company_name, o.order_id, o.order_date
FROM my_companies mc RIGHT JOIN orders o 
ON o.company_id = mc.company_id;

--FULL JOIN 
----Get the order id and order date for every company
SELECT mc.company_name, o.order_id, o.order_date
FROM my_companies mc FULL JOIN orders o 
ON o.company_id = mc.company_id;

--EXAMPLE ANSWER: There are 5 types of Joins. If we have two tables, and we want to get data from the first table and the common 
--data from the second table we use LEFT JOIN. 


CREATE TABLE workers
(
id integer,
name varchar(20),
title varchar(60),
manager_id integer
);

INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

--SELF JOIN:
--Create a table which displays the manager of employees 
SELECT w1.name AS "Employee Name", w2.name AS "Manager Name"
FROM workers w1 INNER JOIN workers w2
ON w1.manager_id=w2.id; 


SELECT * FROM my_companies;
SELECT * FROM orders;
SELECT * FROM workers;
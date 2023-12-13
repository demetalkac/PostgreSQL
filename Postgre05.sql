CREATE TABLE employees
(
employee_id smallint,
employee_first_name varchar(20),
employee_last_name varchar(20)
);     

INSERT INTO employees VALUES(14, 'Chris', 'Tae');
INSERT INTO employees VALUES(11, 'John', 'Walker');
INSERT INTO employees VALUES(12, 'Amy', 'Star');
INSERT INTO employees VALUES(13, 'Brad', 'Pitt');
INSERT INTO employees VALUES(15, 'Chris', 'Way');

SELECT * FROM employees;

CREATE TABLE addresses
(
employee_id smallint,
street varchar(20),
city varchar(20),
state char(2),
zipcode char(5)
);

INSERT INTO addresses VALUES(11, '32nd Star 1234', 'Miami', 'FL', '33018');
INSERT INTO addresses VALUES(12, '23rd Rain 567', 'Jacksonville', 'FL', '32256');
INSERT INTO addresses VALUES(13, '5th Snow 765', 'Hialeah', 'VA', '20121');
INSERT INTO addresses VALUES(14, '3rd Man 12', 'Weston', 'MI', '12345');
INSERT INTO addresses VALUES(15, '11th Chris 12', 'St. Johns', 'FL', '32259');

SELECT * FROM addresses;


--ALIASES

--Select the employee_first_name and state for employee first name use "first name" as field name and 
--for state use "employee state" as field name  

SELECT employees.employee_first_name AS "First Name", addresses.state AS "Employee State"
FROM employees, addresses
WHERE employees.employee_id = addresses.employee_id;

--ALIASES
--How to use aliases for table names 

SELECT e.employee_first_name, a.state
FROM employees e, addresses a
WHERE e.employee_id = a.employee_id;


--How to put multiple fields into a single field and use aliases for the field 
--Get the employee_id and use "id" as field name, get first name and last name put them into same field 
--and use "full name" as field name  

--1st Way:
SELECT employee_id AS id, employee_first_name || ' ' || employee_last_name AS full_name
FROM employees;

--2nd Way:
SELECT employee_id AS id, employee_first_name || employee_last_name AS "FULL NAME"
FROM employees;

CREATE TABLE workers
(
id integer,
name varchar(50),
state varchar(50),
salary smallint,
company varchar(20)
);

INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM workers;

--GROUP BY
--Find the total salary for every employee 

SELECT name, SUM(salary) AS total_salary
FROM workers
GROUP BY name;

--Find the total salary for every employee salary in descending order 

SELECT name, SUM(salary) AS total_salary
FROM workers
GROUP BY name
ORDER BY total_salary DESC; --ORDER BY is used after GROUP BY 
						    --We should type the alieses as field name in ORDER BY line after GROUP BY 

--Find the number of employees per state in descending order by employee name
SELECT state, COUNT(state) AS number_of_employees
FROM workers
GROUP BY state
ORDER BY number_of_employees DESC;

--Find the number of employees whose salary is more than 2000$ per company 
--1st Way
SELECT company, COUNT(company) AS number_of_worker
FROM workers
WHERE salary > 2000
GROUP BY company;

--2nd Way
SELECT company, COUNT(*) AS number_of_worker
FROM workers
WHERE salary > 2000
GROUP BY company;

CREATE TABLE workers
(
id integer,
name varchar(50),
state varchar(50),
salary smallint,
company varchar(20)
);

INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM workers; 


--HAVING Clause 
--Find the total salary if it is greater than 2500$ for every employee

SELECT name, SUM(salary) AS "Total Salary"
FROM workers 
GROUP BY name
HAVING SUM(salary) > 2500; --After "GROUP BY", "WHERE" cannot be used 

--GROUP BY statement groups rows that have the same values(name) into summary rows 
--After WHERE clause we cannot use aggregate functions; COUNT(), SUM(), MIN(), MAX() agggregations 

--Find the number of employees if it is more than 1 per state.
SELECT state, COUNT(state) AS "Number Of Employees"
FROM workers
GROUP BY state
HAVING COUNT(state)>1;

--HAVING clause functionality is same with WHERE clause but it is used with aggregate functions after GROUP BY.

--Find the companies that pay a minimum value of salary which is more than 2000$ for every company 
SELECT company
FROM workers
GROUP BY company
HAVING MIN(salary) >2000;

--Find the maximum salary if it is less than 3000 for every state 
SELECT state, MAX(salary) AS "Maximum SALARY"
FROM workers
GROUP BY state 
HAVING MAX(salary)<3000;


--	Union Operator:
--   i) It is used for joining the result of 2 queries 
--  ii) UNION operator returns unique records everytime, if there are repeated records it removes the repeated one
-- iii) By using UNION operator we are able to put different fields into a single field like in the following  example.
--  iv) When you put different field into a single field by using UNION operator, field must have same data type in the same size.

--Find the state  whose salary is greater than 3000, or employee names whose salary is less than 2000 without any duplication 
--"Find the states where salary is greater than 3000 and workers with a salary of less than 2000"
SELECT state AS "State or Employee Name", salary
FROM workers
WHERE salary>3000

UNION 								--UNION delete the repeated data and merge the results 

SELECT name AS "State or Employee Name", salary
FROM workers
WHERE salary<2000;
CREATE TABLE companies
(
  company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
SELECT * FROM companies;


--1.Example: Find the company and number_of_employees whose number_of_employees is the second highest from the companies table

--1st Way: By using OFFSET and FETCH NEXT
SELECT  company,  number_of_employees
FROM companies 
ORDER BY number_of_employees DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY

--2nd Way: By using Subquery
SELECT  company,  number_of_employees
FROM companies 
WHERE number_of_employees = (SELECT MAX(number_of_employees)
							FROM companies 
							WHERE number_of_employees < (SELECT MAX(number_of_employees) FROM companies));
							

--2.Example: Find the company names and number of employees whose number of employees is less than the average number of employees
SELECT  company,  number_of_employees
FROM companies 
WHERE number_of_employees < (SELECT AVG(number_of_employees) FROM companies);


--Update the number of employees to 16000 if the number of employees is less than the average number of employees
UPDATE companies
SET number_of_employees = 16000
WHERE number_of_employees < (SELECT AVG(number_of_employees) FROM companies);

--PreparedStatement

--//1.Example: Update the number of employees to 9999 if the company name is IBM by using prepared statement
UPDATE companies
SET number_of_employees = 9999
WHERE company ='IBM';

--2.Example: Update the number of employees to 5555 if the company name is GOOGLE by using prepared statement
UPDATE companies
SET number_of_employees = 5555
WHERE company ='GOOGLE';

--Callable Statement
--1.Example: Create a function which uses 2 parameters and return the sum of the parameters
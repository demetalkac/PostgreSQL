CREATE TABLE companie 
(  
  company_id CHAR(9), 
  company VARCHAR(20),
  number_of_employees SMALLINT
);

INSERT INTO companie VALUES(100, 'IBM', 12000);
INSERT INTO companie VALUES(101, 'GOOGLE', 18000);
INSERT INTO companie VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companie VALUES(103, 'APPLE', 21000);

SELECT * FROM companie;

--Find the employee and company names whose company has more than 15000 employees

SELECT company, name
FROM employee
WHERE company IN(SELECT company 
				 FROM companie
				 WHERE number_of_employees>15000);


--Find the company id and company names whic are in Florida 

SELECT company_id, company
FROM companie
WHERE company IN(SELECT company
				FROM employee
				WHERE state ='Florida');
				
--Find the employee name and state which has companies whose company id's are greater than 100

SELECT name, state
FROM employee
WHERE company IN(SELECT company 
				 FROM companie
				 WHERE company_id > '100');
				 
				 
--Find the company name, number_of_employees and average salary for every company 

SELECT company, number_of_employees, (SELECT AVG (salary)
									  FROM employee 
									  WHERE companie.company = employee.company) AS avg_salary_per_company
FROM companie;									  

--Find the name of the companies, company_id's and also maximum and minimum salaries per company

SELECT company, company_id, (SELECT MAX(salary) FROM employee WHERE companie.company = employee.company) AS maximum_salary,
						    (SELECT MIN(salary) FROM employee WHERE companie.company = employee.company) AS minimum_salary
FROM companie;	



--WildCard %: It represents zero or more characters
--LIKE Condition: It is used with WildCards 

--Select employee names which start with 'E'

SELECT name
FROM employee
WHERE name LIKE 'E%';--I am telling here the frist char should be uppercase E  
					 --the only data I am looking for in the name column starting with E 
					 -- % sign covers indefinite characters include zero after the uppercase E/ gives programmer flexibility


--Select employee names which ends with 'e'
SELECT name
FROM employee
WHERE name LIKE '%e';--I am telling here the last char should be lowercase e, the only data that I am looking for ends with e
                     -- % sign represents the indefinite characters (multiple or even zero) coming before 'e'

--Select the employee names which starts with 'B' and ends with 't'

SELECT name
FROM employee
WHERE name LIKE 'B%t';


--Select the employee names which has a in any position

SELECT name 
FROM employee
WHERE name LIKE '%a%';


--Select the employee names which has e and r in any position

SELECT name 
FROM employee
WHERE name LIKE '%e%r%' OR name LIKE '%r%e%'; 


--2. _ WildCard : It represents a single character 
--Select state whose second character is 'i' and forth character is 'n'

SELECT state
FROM employee
WHERE state LIKE '_e_n%';


--Select the state name whose last second character is 'i'

SELECT state
FROM employee
WHERE state LIKE '%i_';


--Select the states whose second character is lowercase 'e' and it has at least 6 characters 

SELECT state
FROM employee
WHERE state LIKE '_e____%';

--Select the states which has 'i' in any position after second character 

SELECT state
FROM employee
WHERE state LIKE '___%i%';


--3) REGEXP_LIKE Condition: You can use Regular Expression with REGEXP_LIKE Condition

CREATE TABLE words
(
word_id SMALLINT UNIQUE,
word varchar(50) NOT NULL,
number_of_letters SMALLINT
);


INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selena', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);

SELECT * FROM words;

--Select words whose first character is 'h', the last character is 't' and second character 'o', or 'a' or 'i' 
--1st Way:
SELECT word
FROM words
WHERE word LIKE 'hot' OR word LIKE 'hat' OR word LIKE 'hit';

--2nd Way:
SELECT word 
FROM words
WHERE REGEXP_LIKE(word, 'h[oai]t'); 


--Select words whose first character is 'h', the last character is 't' and second character can be any character from 'a' to 'e'.

SELECT word 
FROM words 
WHERE REGEXP_LIKE(word, 'h[a-e]t'); 

--Select words whose first character is 's' or 'a' or 'y'
SELECT word
FROM words
WHERE REGEXP_LIKE (word, '^[say]');
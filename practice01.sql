--IMPORTANT NOTE: Subquery or Inner query or Nested query is a query in a query. SQL subquery is usually added 
--in the WHERE Clause of the SQL statement. Most of the time, a subquery is used when you know how to search for a value using a SELECT statement, but do not know the exact value in the database.
--Subqueries are an alternate way of returning data from multiple tables.
--Subqueries can be used with the following SQL statements along with the comparision operators like =, <, >, >=, <= etc.


--SUBQUERY

CREATE TABLE employee 
(  
  id CHAR(9), 
  name VARCHAR(50), 
  state VARCHAR(50), 
  salary SMALLINT,
  company VARCHAR(20)
)

INSERT INTO employee VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employee VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employee VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employee VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employee VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employee VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employee VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM employee;
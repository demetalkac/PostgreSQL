CREATE TABLE workers
(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2)
);

INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);


--ALTER TABLE
-- The ALTER TABLE statement is used to add, delete or modify columns in an existing table.
-- The ALTER TABLE statement is also used to add and drop constraints in an existing table. 

--1) We can add a column to an existing table 

ALTER TABLE workers 
ADD company_industry VARCHAR(20);--Snake case ==> naming convention ==> company_industry

--2) How to add field with default value:
ALTER TABLE workers
ADD worker_address VARCHAR(80) DEFAULT 'Miami, FL, USA';

--3) How to add multiple fields into a table:
ALTER TABLE workers
ADD number_of_workers char(5) DEFAULT 0,
ADD name_of_ceo VARCHAR(20);

--4) How to drop fields from a table :
ALTER TABLE workers 
DROP COLUMN name_of_ceo;

--5) How to rename a field/column
ALTER TABLE workers 
RENAME COLUMN company_industry TO company_profession;

--6) How to rename a table:
ALTER TABLE workers
RENAME TO employees;

--7) How to modify a field(add constraint, change data types, change size...)

--NOTE: When you add a constraint into a field be careful about existing data. (e.g. If you try to set NOT NULL constraint we have to be sure
--if there is no existing null values)

--a)How to add constraint 
--a1) Add "NOT NULL" constraints to number_of_workers field 

ALTER TABLE employees
ALTER COLUMN number_of_workers SET NOT NULL; 

--a2) Add "UNIQUE" constraints to company_profession field 
ALTER TABLE employees 
ADD CONSTRAINT company_profession_unique UNIQUE(company_profession);--"UNIQUE"  constraints accept "multiple NULLS"

--a3) Add "UNIQUE" constraints to worker_address field 
ALTER TABLE employees 
ADD CONSTRAINT worker_address_unique UNIQUE(worker_address);--ERROR ==>"UNIQUE"  constraints does not accept "duplicated values"

--b)  How to change data size of a field
--b1) Change the data type of the company_profession to CHAR(5).
ALTER TABLE employees
ALTER COLUMN company_profession TYPE CHAR(5);--If we try to change an existing data type to narrower one, it is going to give Error. 

--NOTE: When you modify a field, a new size must be greater than or equal to the maximum value of existing size. 

--b2) Change the data type of the worker_address to CHAR(5).
ALTER TABLE employees
ALTER COLUMN worker_address TYPE CHAR(5); -- ERROR: value too long for type character(5)

--NOTE: Cannot decrease the column lenghth because some values are greater than CHAR(5).(But we can increase)

--b3)  Change the data type of the worker_address to CHAR(30).
ALTER TABLE employees
ALTER COLUMN worker_address TYPE CHAR(30);


SELECT * FROM employees;

--How to write a FUNCTION:

-- A function is created to do some tasks faster and easier.(Averaging...)
-- A function can be created for CRUD operation.
-- In SQL, every functions returns a data a return type.
-- Operations that do not return data as return type are called 'Procedure' 

CREATE OR REPLACE FUNCTION addf(x NUMERIC, y NUMERIC)
RETURNS NUMERIC 
LANGUAGE plpgsql  --procedure language postgre sql
AS 
$$                --$$ ==> parenthesis
BEGIN


RETURN x+y;


END
$$

SELECT * FROM addf(6,4) AS "Addition";

--Create a function that calculates the volume of the cone .
-- h * r

CREATE OR REPLACE FUNCTION volume_of_cone(r NUMERIC, h NUMERIC)
RETURNS NUMERIC 
LANGUAGE plpgsql  
AS 
$$                
BEGIN


RETURN 3.14*r*r*h*1/3;


END
$$

SELECT * FROM volume_of_cone(3,6) AS "Volume of Cone";--56.520000000..
SELECT to_char(volume_of_cone(3,6), '00.00');--56.52
--CREATING DATABASES AND TABLES

--DATA TYPES
--BOOLEAN ==>> TRUE or FALSE
--CHARACTER ==>> CHAR, VARCHAR, TEXT
--NUMERIC ==>> INTEGER, FLOATING-POINT NUMBER, SMALLINT(-32768 - +32767), BIGINT(8 BYTES), NUMERIC(variable)
--TEMPORAL ==>> DATE, TIME, TIMESTAMP, INTERVAL


--UUID ==>> unique identifier 
--ARRAY ==>> store an array of strings, numbers, etc
--JSON 

--Example:
-- phone number ==>> VARCHAR(text data type), ==>> it can cause variety of issues to store them numeric
-- e.g. 7 and 07 treated same numerically, but are not the same as phone number
-- age ==>> SAMLLINT 

-- PRIMARY KEY
-- is a column or group of columns used to identify a row uniquely in a table. 
-- FOREIGN KEY
-- is defined in a table that references to the primary key
-- The table to which the foreign key references is called parent/ referenced table.
-- A table can have multiple foreign key.
-- When a creating tables and defining columns we can use CONSTRAINS to define columns as Primary Key or attaching a Foreign Key. 

SELECT * FROM payment;
-- payment_id is Primary Key

-- CONSTRAINTS
-- prevent invalid data from being entered into the database.
-- ensures accuracy and reliability of the data.

-- 1. NOT NULL
-- 2. UNIQUE
-- 3. PRIMARY KEY
-- 4. FOREIGN KEY 
-- 5. CHECK ==>> ensures that all values in a column satisfy certain condition
-- EXCLUSION ==>> ensures that if any two rows are compared on the specified column or expression using the specified operator, not all of these comparisions will return true. 

-- TABLE CONSTRAINTS 
-- 1. CHECK ==>> to check a condition when inserting or updating data
-- 2. REFERENCES ==>> to constrain the value stored in the column that must exist in a column in another table
-- 2. UNIQUE
-- 3. PRIMARY KEY

-- CREATE TABLE
-- SERIAL ==>> special kind of database object that generates a sequence of integers ==>> a sequence is often used as the primary key column in a table 
















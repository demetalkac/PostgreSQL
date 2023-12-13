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

--Select the words whose first character is 's' or 'a' or 'y'
--(*) is optional to use after '^[say]'
SELECT word
FROM words
WHERE REGEXP_LIKE(word, '^[say]');--[] means we have multiple options for the required characters

--Select words whose last character is 'm' or 'a' or 'f'
SELECT word
FROM words 
WHERE REGEXP_LIKE (word, '[maf]$');

--Select words whose first character is s and last character 'a'
--1st Way:
SELECT word
FROM words 
WHERE word LIKE 's%a';

--2nd Way:
SELECT word
FROM words 
WHERE REGEXP_LIKE(word, '^[s].*[a]$');-- '*' means there may be zero or multiple characters 
									  -- '.' means there may be 1 single character(it may be any character)


--Select words which have 'a' in any position
SELECT word
FROM words
WHERE REGEXP_LIKE(word, 'a');-- 'a' is same with '%a%' with LIKE


--Select the words which have characters from 'd' to 't' at the beginning followed by any character then 'l'
SELECT word
FROM words
WHERE REGEXP_LIKE (word, '^[d-t].[l]');


--Select the words which have characters from 'd' to 't' at the beginning followed by any 2 characters and then  'e'
SELECT word
FROM words
WHERE REGEXP_LIKE (word, '^[d-t]..[e]');-- '..' ==> 2 undefined any characters 


--Select the words which do not have 'h' in any position.
--NOT LIKE Condition 
SELECT word
FROM words
WHERE word NOT LIKE '%h%';

--Select words which do not end with 't' and which do not end with 'f'
--1.Way
SELECT word
FROM words
WHERE word NOT LIKE '%t' AND word NOT LIKE '%f';

--2.Way
SELECT word
FROM words
WHERE NOT REGEXP_LIKE (word, '[tf]$');

--3.Way 
SELECT word
FROM words
WHERE word ~ '[^tf]$';

--Select words which start with any character, not followed by 'a', not followed by 'e'
SELECT word
FROM words
WHERE word NOT LIKE '_a%' AND word NOT LIKE '_e%';


--ORDER BY Function: To put the records in ascending or descending order we use ORDER BY
--ORDER BY statement can be used with SELECT clauses

--Put the records in ascending order by using number_of_letters 
SELECT * FROM words 
ORDER BY number_of_letters ASC;--ASC statement is optional here 
							   --because it is returning us default order (natural order \ numeric data => ASC)
							   --but if the task requires DESC order then put DESC explicitly 


--Put the records in descending order 

SELECT *
FROM words
ORDER BY word DESC; --DESC is not optional, if you do not type DESC, the output will be in ascending 


--Note: In ORDER BY, instead off field names, we can use field numbers as well.

SELECT *
FROM words
ORDER BY 3 ASC;--3 stands for number_of_letters column

--SELECT all the data from words table and then ORDER BY second column in DESC order 

SELECT *
FROM words 
ORDER BY 2 DESC;

CREATE TABLE points(
name VARCHAR(50),
point SMALLINT
);

INSERT INTO points VALUES ('Ali', 85);
INSERT INTO points VALUES ('Tom', 65);
INSERT INTO points VALUES ('Veli', 55);
INSERT INTO points VALUES ('Kemal', 75);
INSERT INTO points VALUES ('Eddie', 95);
INSERT INTO points VALUES ('Brad', 56);
INSERT INTO points VALUES ('Cynthia', 67);

SELECT * FROM points;

--Put the points of the students in descending order
SELECT * FROM points 
ORDER BY point DESC;

--Put the name column in order 
SELECT * FROM points 
ORDER BY name;

CREATE TABLE employees
(
employee_id SMALLINT,
employee_first_name VARCHAR(20),
employee_last_name VARCHAR(20)
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
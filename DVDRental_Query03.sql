--Select the first 10 paying customers
--What are the customer ids of the first 10 customers who created a payment
SELECT customer_id 
FROM payment
ORDER BY payment_date
LIMIT 10;

--What are the titels of the 5 shortest (in length of runtime) movies?
SELECT title
FROM film
ORDER BY length 
LIMIT 5;

SELECT title, length
FROM film
ORDER BY length 
LIMIT 5;

--If the previous customer can watch any movie that is 50 minutes or less in run time, how many options does she have?
SELECT COUNT(title)
FROM film
WHERE length <= 50;

--BETWEEN OPERATOR
-- value>= low AND value <=high ===>>> included low and high point
-- value NOT BETWEEN loc AND high ===>>> excluded low and high point
--BETWEEN operator can also be used with dates
--We need to format dates in the ISO 8601 standard format ===>>> YYY-MM-DD ===>>> date BETWEEN '2007-01-01'AND '2007-02-01'
--Be careful to using BETWEEN versus <=,>= comparison operators, due to the fact that a datetime starts at 0.00!!!!
--Let's see payment table structure
SELECT * FROM payment
LIMIT 2;

SELECT * FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT COUNT(*) FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT COUNT(*) FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-14';

--IN OPERATOR
--Multiple OR options
--value IN(option a, option b, ...option z)
--SELECT color FROM table WHERE color IN('red','blue')
--SELECT color FROM table WHERE color NOT IN('red','blue')

SELECT * FROM payment
LIMIT 2;

SELECT DISTINCT(amount) FROM payment
ORDER BY amount;

SELECT * FROM payment
WHERE amount IN(0.99, 1.98, 1.99);

SELECT COUNT(*) FROM payment
WHERE amount IN(0.99, 1.98, 1.99);

SELECT COUNT(*) FROM payment
WHERE amount NOT IN(0.99, 1.98, 1.99);

SELECT * FROM customer
WHERE first_name IN('John','Jake','Julie');

SELECT * FROM customer
WHERE first_name NOT IN('John','Jake','Julie');

--LIKE and ILIKE OPERATORS
--LIKE ===>>> allows us to perform pattern matching against string daata with the use of WILDCARD characters ===>>>'%' , '_'
--'%' ===>>> sequence of character
--'_' ===>>> single character 
--Note that LIKE is case-sensitive ===>> all names that beging with an 'A' : WHERE name LIKE 'A%' ===>>> all names that end with an 'a' ===>>>: WHERE name LIKE '%a'
--We can also use ILIKE which is case-insensitive
--We can combine pattern matching operators to create more complex patterns like ===>>> WHERE name LIKE '_her%'

SELECT * FROM customer
LIMIT 2;

SELECT * FROM customer
WHERE first_name LIKE 'J%';

SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'J%';

SELECT COUNT(*) FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%' ;

SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%' ;

SELECT * FROM customer
WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%' ;

SELECT * FROM customer
WHERE first_name LIKE 'j%' AND last_name LIKE 's%' ;

--Select all customer whose name contains 'er' anywhere inside 
SELECT * FROM customer
WHERE first_name LIKE '%er%';

SELECT * FROM customer
WHERE first_name LIKE '%her%';

SELECT * FROM customer
WHERE first_name LIKE '_her%';

--Select all customer whose firstname start with A and order them to their lastname
SELECT * FROM customer
WHERE first_name LIKE 'A%'
ORDER BY last_name;

--Select all customer whose firstname start with A and lastname does not start with B and order them to their lastname
SELECT * FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;

--CHALLENGE
--1. How many payment transactions were greater than $5.00?
SELECT * FROM payment
LIMIT 2;

SELECT COUNT(*) FROM payment
WHERE amount > 5.00;
--RESULT 3618

--2. How many actors have a first name that starts with the letter P?
SELECT * FROM actor
LIMIT 2;

SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';
--RESULT  5

--3. How many unique districts are our customers from?
SELECT * FROM address
LIMIT 1;

SELECT COUNT(DISTINCT (district)) FROM address;
--Result 378

--4. Retrieve the list of names for those distinct districts from the previous question.
SELECT DISTINCT(district) FROM address;

--5. How many films have a rating of R and a replacement cost between $5 and $15?
SELECT * FROM film
LIMIT 1;

SELECT COUNT(*)
FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15;
--Result 52

--6. How many films have the word Truman somewhere in the title?
SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%';

















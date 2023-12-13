--Aggregate Functions
--The main idea behind aggregate function is to take multiple inputs and return a single output

--COUNT()==>> returns number of rows
--AVG()==>> returns avarage value
--MAX()==>> returns maximum valuer
--MIN()==>> returns minimum value
--SUM()==>> returns the sum of the values

--AGGREGATE functions happen only in SELECT or HAVING clause
--ROUND()==>> is used to specify precision after the decimal of the result of AVG function like 2.3546......

SELECT * FROM film;

--MIN, MAX
SELECT MIN(replacement_cost) FROM film;
SELECT MAX(replacement_cost) FROM film;

--SELECT MAX(replacement_cost), film_id FROM film; ==>> Does not work, aggregate function returns only single value.
SELECT MAX(replacement_cost), MIN(replacement_cost) FROM film;

SELECT COUNT(*) FROM film;

--AVG, ROUND
SELECT AVG(replacement_cost) FROM film; --19.98400000...
SELECT ROUND(AVG(replacement_cost)) FROM film; --20
SELECT ROUND(AVG(replacement_cost),2) FROM film; --19.98

SELECT SUM(replacement_cost) FROM film;


--GROUP BY STATEMENT
--GROUP BY clause must appear right after a FROM or WHERE statement
--NOTE: In the  SELECT statement columns must either have an aggregate function(only exception) or be in   GROUP BY call.!!!
--We can group multiple columns as well. 

SELECT * FROM payment
LIMIT 1;

SELECT customer_id
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

--Total money customers spent per customer_id
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount);

--Count how many transactions are there per customer_id 
SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount);

-- Example
SELECT customer_id, staff_id, SUM(amount)
FROM payment
GROUP BY customer_id, staff_id
ORDER BY customer_id;

--Examples
SELECT staff_id, customer_id, SUM(amount)
FROM payment
GROUP BY staff_id, customer_id 
ORDER BY staff_id, customer_id;

SELECT staff_id, customer_id, SUM(amount)
FROM payment
GROUP BY staff_id, customer_id 
ORDER BY customer_id;

SELECT staff_id, customer_id, SUM(amount)
FROM payment
GROUP BY staff_id, customer_id 
ORDER BY  SUM(amount);

--GROUP BY date
SELECT * FROM payment;

SELECT DATE(payment_date) FROM payment;


SELECT DATE(payment_date) FROM payment
GROUP BY DATE(payment_date); --This is esentially returns the distict dates

--to see any data from the table per payment_date e.g total amount
SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date);

SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;

--CHALLENGE 1. GROUP BY
SELECT staff_id, COUNT(amount)
FROM payment
GROUP BY staff_id;

--CHALLENGE 2. GROUP BY
SELECT rating, ROUND(AVG(replacement_cost),2)
FROM film
GROUP BY rating;

--CHALLENGE 3. GROUP BY
--What are the customer ids of the top 5 customers by total spend?
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

--HAVING CLAUSE
--This allows us to filter after an aggregation has already taken place.

--We can filter before executing the Group By by using WHERE clasue, but what if I want to filter based on SUM(sales)
--WHERE clause cannot be used with aggregate functions
--To be able to filter based on aggregate functions, I need to use HAVING clause
--Example
-- SELECT company, SUM(sales)
-- FROM finance_table
-- WHERE company!='Google'
-- GROUP BY company
-- HAVING SUM(sales)>1000

SELECT customer_id, SUM(amount)
FROM payment
WHERE customer_id NOT IN (184,87.477)
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT store_id, COUNT(*)
FROM customer
GROUP BY store_id
HAVING COUNT(*) > 200
--OR
SELECT store_id, COUNT(customer_id)
FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 200

--CHALLENGE 1. HAVING CLAUSE
--We will assign platinum status to customers that have had 40 or more transaction payments. What customer_ids are eligible for platinum status?
SELECT customer_id, COUNT(amount)
FROM PAYMENT
GROUP BY customer_id
HAVING COUNT(amount) >= 40;

--Challenge 2. HAVING CLAUSE
--What are the customer_ids of customers who have spent more than $100 in payment transactions with our staff_id member 2?
SELECT customer_id, sum(amount)
FROM PAYMENT
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;



































































--MATHEMATICAL FUNCTIONS AND OPERATORS
SELECT * FROM film
LIMIT 2;

SELECT ROUND(rental_rate/replacement_cost, 4)*100 AS percent_cost
FROM film;

SELECT 0.1 * replacement_cost AS deposit
FROM film;

--STRING FUNCTIONS AND OPERATORS
--LENGTH
SELECT LENGTH(first_name) FROM customer;
--returns the kength of firstname

--CONCATENATION ||
SELECT first_name ||' '|| last_name
FROM customer;

SELECT first_name ||'--'|| last_name AS full_name
FROM customer;

--UPPER
SELECT UPPER(first_name) ||'--'|| UPPER(last_name) AS full_name
FROM customer;

--LOWER
SELECT LOWER(first_name) || LOWER(last_name) || '@gmail.com'
FROM customer;

--LEFT returns first 'n' letters/characters from the selected column
SELECT LOWER(LEFT(first_name, 1)) || LOWER(last_name) || '@gmail.com'
AS custom_email
FROM customer;


-- SUBQUERY
-- SubQuery help us get a result that requires 2 or more queries in a single query request.
-- Subquery is performed first since it is inside the parenthesis.
-- We can also use the IN operator in conjunction with a subquery to check against multiple results returned.

-- SELECT student, grade
-- FROM test_scores
-- WHERE grade> (SELECT AVG(grade) FROM test_scores);

-- There are 2 diff table in this example below. IN operator do as same as JOINs here. We could do this task with Joins possibly. 
-- SELECT student, grade
-- FROM test_scores
-- WHERE student IN
-- (SELECT student
-- FROM honor_roll_table)

-- A subquery can operate on a seperate table
-- SELECT student, grade
-- FROM test_scores
-- WHERE student IN
-- (('Zach','Chris','Karissa'));


-- EXISTS operator
-- is used to test for existence of rows in a subquery

-- SELECT coulumn_name
-- FROM table_name
-- WHERE EXISTS 
-- (SELECT column_name FROM table_name WHERE condition);

SELECT *
FROM film;

-- Example : Select all films their rental_rate is hogher than the average rental_rate
SELECT title, rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate)FROM film);

-- Example : Select all films that have been returned between May 29th of 2005 and 30th of 2005.
SELECT * FROM rental;

SELECT film_id, title
FROM film
WHERE film_id IN
(SELECT inventory.film_id
FROM rental
INNER JOIN inventory
ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY film_id;

--NOTE: A subquery cannot have more than one column after select(only 1)

-- Example: Select all customers who have at least one payment whose amount is greater than 11.
SELECT first_name, last_name, customer.customer_id
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 11
ORDER BY customer_id;

SELECT first_name, last_name, customer_id
FROM customer
AS c
WHERE EXISTS
(SELECT * FROM payment AS p 
WHERE p.customer_id = c.customer_id
AND amount>11)
ORDER BY customer_id;













































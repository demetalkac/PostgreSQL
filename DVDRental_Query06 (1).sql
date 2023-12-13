--AS CLAUSE
-- allows us to create "alias" for a column or result 
-- We cannot use ALIAS in the WHERE/HAVING statement

SELECT customer_id AS rental_price
FROM payment;

SELECT SUM(amount) AS net_revenue
FROM payment;

SELECT COUNT(amount) AS num_transactions
FROM payment;

SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100

--JOINS
--Joins allows us to combine multiple tables together.

--INNER JOIN
SELECT *
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

SELECT payment_id,payment.customer_id, first_name 
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;


--OUTER JOINS
--more complex joins and have differents types
--FULL OUTER, LEFT OUTER, RIGHT OUTER

--FULL OUTER JOIN
SELECT *
FROM payment
FULL OUTER JOIN customer
ON payment.customer_id = customer.customer_id;


--FULL OUTER JOIN WITH WHERE CLAUSE
-- SELECT *
-- FROM tableA
-- FULL OUTER JOIN TableB
-- ON TableA.col_match = TableB.col_match
-- WHERE TableA.id IS null OR
-- TableB.id IS null;

SELECT * FROM payment
SELECT * FROM customer

SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.customer_id IS null

--LEFT OUTER JOIN
--results in the set of records that are in the left table, if there is no match with the right table, theh results are null

-- SELECT * FROM TableA
-- LEFT OUTER JOIN TableB
-- ON TableA.col_match = TableB.col_Match;

--LEFT OUTER JOIN WITH WHERE CLAUSE
-- SELECT * FROM TableA
-- LEFT OUTER JOIN TableB
-- ON TableA.col_match = TableB.col_Match;
-- WHERE TableB.id IS null;


SELECT film.film_id, film.title, inventory_id, store_id   --inventory_id and store_id are unique for the inventory table
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id

--WITH WHERE CLAUSE
SELECT film.film_id, title, inventory_id, store_id   
FROM film
LEFT JOIN inventory
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL


--RIGTH JOIN OR RIGHT OUTER JOIN

-- SELECT * FROM TableA 
-- RIGHT OUTER JOIN TableB
-- ON TableA.col_match = TableB.col_match;

--It returns only the data that exclusively belongs to TableB or is common for the both table, but does not returns the data exclusively found in the TableA.

-- RIGTH JOIN WITH WHERE CLAUSE 
-- returns only the data that exclusively belongs to TableB, does not return the data which is common for the both table

-- SELECT * FROM TableA 
-- RIGHT OUTER JOIN TableB
-- ON TableA.col_match = TableB.col_match
-- WHERE TableA.id IS NULL;

--UNION OPERATOR
-- is used to combine the result-set of two or more queries(SELECET statements). Basically coccatenates two reslt together.

-- Example==>>
-- SELECT * FROM TableA
-- UNION
-- SELECT * FROM TableB;

-- JOIN CHALLANGES
-- 1. What are the emails of the customers who live in California?
SELECT * FROM customer
LIMIT 1;

SELECT * FROM address
LIMIT 3;

SELECT district, email
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'California';

-- 2. Get a list of the movies "Nick Wahlberg" has been in.
SELECT * FROM actor
LIMIT 1;

SELECT * FROM film
LIMIT 2;

SELECT title, first_name, last_name
FROM film_actor INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id 
WHERE first_name = 'Nick' AND last_name='Wahlberg';


























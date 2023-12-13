SELECT first_name, last_name, email FROM customer;

SELECT * FROM film;

-- How many different release years in film table?
SELECT DISTINCT release_year FROM film;
SELECT DISTINCT(release_year) FROM film;

--How many unique rental_rate do we have?
SELECT DISTINCT(rental_rate) FROM film;

--How many rating types do we have in out database?
SELECT DISTINCT(rating) FROM film;

SELECT * FROM payment;

--Count how many rows do we have in payment table
SELECT COUNT(*) FROM payment;

--How many rows are there in the amount column of payment tbale
SELECT COUNT(amount) FROM payment;

--How many distinct amount do we have in payment table
SELECT amount FROM payment;
SELECT DISTINCT(amount) FROM payment;
--SELECT COUNT DISTINCT(amount) FROM payment; ==>This statement fails
SELECT COUNT (DISTINCT amount) FROM payment;
SELECT COUNT (DISTINCT (amount)) FROM payment;

--WHERE STATEMENT
--Select all data from customer table where the name is Jared
SELECT * FROM customer;

SELECT * FROM customer
WHERE first_name = 'Jared';

--Select all data from film table where the rental rate greater than 4 
SELECT * FROM film;

SELECT * FROM film
WHERE rental_rate > 4;

--Select all data from film table where the rental rate greater than 4 and replacemet cost greater than or equal to 19.99
SELECT * FROM film
WHERE rental_rate > 4 AND replacement_cost>= 19.99;

--Select all data from film table where the rental rate greater than 4 and replacemet cost greater than or equal to 19.99 and rating is R
SELECT * FROM film
WHERE rental_rate > 4 AND replacement_cost>= 19.99
AND rating = 'R';

--Select title from film table where the rental rate greater than 4 and replacemet cost greater than or equal to 19.99 and rating is R
SELECT title FROM film
WHERE rental_rate > 4 AND replacement_cost>= 19.99
AND rating = 'R';

--COUNT
--Count all data from film table where the rental rate greater than 4 and replacemet cost greater than or equal to 19.99 and rating is R
SELECT COUNT(*) FROM film
WHERE rental_rate > 4 AND replacement_cost>= 19.99
AND rating = 'R';

--Select all from film table where rating is R or PG-13
SELECT * FROM film
WHERE rating = 'R' OR rating = 'PG-13';

--Select all from film table where rating is not R
SELECT * FROM film
WHERE rating != 'R'; 

--What is the email for the customer with the name Nancy Thomas?
SELECT email FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

--What is the description of the movie "Outlaw Hanky"
SELECT description FROM film
WHERE title = 'Outlaw Hanky';

--What is the phone number for the customer who lives at "259 Ipoh Drive"
SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

--ORDER BY
--ASC order (alphabetical) by default
SELECT * FROM customer
ORDER BY first_name; 

SELECT * FROM customer
ORDER BY first_name DESC; 

SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id; 

SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id, first_name; 

SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id ASC, first_name DESC; 

--We can also order by a column and not selected it with Select statement --not recommended
SELECT  first_name, last_name FROM customer
ORDER BY store_id ASC, first_name DESC; 

--LIMIT
--last command to be executed
--This will allows us to get the top/ most recent data depends on ascending or descending order
--Select most recent 10 purchases in the payment table
SELECT * FROM payment
ORDER BY payment_date DESC
LIMIT 10;

--Select most recent 5 purchases in the payment table where the amount is not equal to 0.00
SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;

--The query below is very useful to see quickly what a table looks like to work on it
SELECT * FROM payment
LIMIT 1;






















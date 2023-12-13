-- SELF JOIN
-- Self join is a query which a table is joined to itself.
-- useful for comparing values in a cloumn of rows within the same table
-- Teher is no speacial keyword for the self join. =>> JOIN syntax
-- When using self join it is necessary to use an alias for the table, otherwise the table names would be ambigiuous.

-- SYNTAX:
-- SELECT tableA.col, tebleB.col
-- FROM table AS tableA
-- JOIN table AS tableB
-- ON tableA.some_col = tableB.other_col

-- Examples:
SELECT * FROM film
LIMIT 2;

SELECT title, length
FROM film
WHERE length = 117;

-- Select all the film pairs they have the same length (I need to compare all the length in the same table)
SELECT f1.title, f2.title, f1.length
FROM film AS f1 
INNER JOIN film AS f2
ON f1.film_id != f2.film_id
AND f1.length = f2.length




















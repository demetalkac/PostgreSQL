--TIMESTAMPS AND EXTRACT
--PART 1 
--DISPLAYING CURRENT TIME INFORMATION
--These are more usefl when creating our own tables and databases.

--PostgreSQL can hold date and tome data:
--TIME - Contains only time
--DATE - Contains only date
--TIMESTAMP - Contains date and time
--TIMESTAMPTZ - Contaions time, date, timezone

--Functions and Operations
--TIMEZONE
--NOW
--TIMEOFDAY
--CURRENT_TIME
--CURRENT_DATE

SHOW ALL 
--returns all settings

SHOW TIMEZONE
-- returns timezone

SELECT NOW()
--returns what time you are in ==>> returns timestamp with timezone

SELECT TIMEOFDAY()
--basicallly same with NOW()
--and returns current date and time and time zone

SELECT CURRENT_TIME
--returns only current time and timezone 

SELECT CURRENT_DATE
-- returnss just the current date


--EXTRACTING INFORMATION FROM A TIME BASES DATA TYPE 

-- 1. EXTRACT()  ==>> allows us to extract or obtain a sub-component of a date value 
	  -- YEAR    ==>> EXTRACT(YEAR FROM date_col) ==>> EXTRACT(field FROM source)
	  -- MONTH
	  -- DAY
	  -- WEEK
	  -- QUARTER  (Jan-Feb-March ==>> first quarter)
	  
-- 2. AGE()      ==>> Calculates and returns the current age given a timestamp
      -- Usage   ==>> AGE(date_col)  ==>> returns 13 years 1 mon 5 days 01:34:13.003423
	  
-- 3. TO_CHAR()  ==>> General function to convert data types to text 
--               ==>> Useful for timestamp formatting
      --Usage    ==>> TO_CHAR(date_col, 'mm-dd-yyyy')

-- EXAMPLES EXTRACT()
SELECT * FROM payment
LIMIT 1;

SELECT EXTRACT(YEAR FROM payment_date) AS year
FROM payment;

SELECT EXTRACT(MONTH FROM payment_date) AS pay_month
FROM payment;
--For timestamp values, the number of the month within the year (1–12)

SELECT EXTRACT(QUARTER FROM payment_date) AS pay_month
FROM payment;

--EXAMPLES AGE()
SELECT AGE(payment_date)
FROM payment;

--EXAMPLES TO_CHAR()
SELECT TO_CHAR(payment_date, 'MONTH-YYYY')
FROM payment;
--MONTH returns full word of month name

SELECT TO_CHAR(payment_date, 'mon/dd/YYYY')
FROM payment;
-- mon ==>> abbreviated lower case month name (3 chars in English, localized lengths vary)

SELECT TO_CHAR(payment_date, 'MM/dd/YYYY')
FROM payment;
-- MM ==>> month number (01–12)


--NOTE: "blank padded to 9 characters", which means instead of returning 'Monday' it returns 'Monday   ' with extra spaces to fill up at least 9 spaces.

--Challange Task:
-- 1. During which months did payments occur? Return back the full month name. 
SELECT * FROM payment
LIMIT 1;

SELECT DISTINCT(TO_CHAR(payment_date, 'MONTH'))
FROM payment;

-- 2. How many payments occured on a Monday?
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1;  
-- PostgreSQL considers SUnday index 0, so the index of Moinday is 1. 
-- dow keyword ==>> Day Of the Week

--EXTRACT(field FROM source)
--SELECT EXTRACT(CENTURY FROM TIMESTAMP '2000-12-16 12:21:13');
-- Result: 20

-- SELECT EXTRACT(DAY FROM TIMESTAMP '2001-02-16 20:38:40');
-- Result: 16

-- SELECT EXTRACT(DECADE FROM TIMESTAMP '2001-02-16 20:38:40');
-- Result: 200
-- decade = The year field divided by 10

-- SELECT EXTRACT(DOW FROM TIMESTAMP '2001-02-16 20:38:40');
-- Result: 5
-- dow = The day of the week as Sunday (0) to Saturday (6)

-- SELECT EXTRACT(DOY FROM TIMESTAMP '2001-02-16 20:38:40');
-- Result: 47
-- doy = The day of the year (1–365/366)

--For timestamp values, the number of the month within the year (1–12)
--SELECT EXTRACT(MONTH FROM TIMESTAMP '2001-02-16 20:38:40');
--Result: 2








































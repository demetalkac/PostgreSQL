SELECT * FROM cd.bookings;

SELECT * FROM cd.facilities;

SELECT * FROM cd.members;


-- Task 1: How can you retrieve all the inf0rmation from the cd.facilities table? 
SELECT * FROM cd.facilities;

-- Task 2: You want to print out a list of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?
SELECT name, membercost
FROM cd.facilities;

-- Task 3: How can you produce a list of facilities that charge a fee to members?
SELECT name, membercost
FROM cd.facilities
WHERE membercost>0;

-- Task 4: How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of he monthly maintanence cost?
-- Return the facid, facility name, member cost, monthly maintenance of the facilities.  
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0 
AND membercost < (monthlymaintenance*0.02);

-- Task 5: How can you produce a list of facilities with the word Tennis in their name?
SELECT name
FROM cd.facilities
WHERE name LIKE '%Tennis%';

SELECT COUNT(name)
FROM cd.facilities
WHERE name LIKE '%Tennis%';

-- Task 6: How can you retrieve the details of facilities with ID 1 and 5 without usuing OR operator?
-- 1st way
SELECT * 
FROM cd.facilities
WHERE name LIKE '%2';

--2nd way
SELECT * 
FROM cd.facilities
WHERE facid IN(1, 5);

-- Task 7: How can you produce a list of members whos joined after the start of SEptember 2012? Return the memid, surname, firstname, joindate of the members.
SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-09-01';

-- TASK 8: How can you produce an ordered list of the 10 surnames in the members table? The list must not contain duplicates.
SELECT DISTINCT surname
FROM cd.members
ORDER BY surname
LIMIT 10;

-- TASK 9: You'd like to get the signup date of your last member. How can you retrieve this information?
-- 1st way
SELECT joindate
FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

--2nd way
SELECT MAX(joindate)
FROM cd.members;

-- TASK 10: Produce a count of the number of facilities that have a cost to guests of 10 or more
SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost >= 10;

-- TASK 11: Produce a list of the total number of slots booked per facility in the month of September 2012. 
--          Produce an output table consisting of facility id and slots, sorted by the number of slots. 
SELECT facid, SUM(slots) AS total_slots
FROM cd.bookings
WHERE starttime >= '2012-09-01' AND starttime <= '2012-10-01'  --BETWEEN OPERATOR CAN CAUSE CONFUSION DEPENDS ON THE SYSTEM, NOT RECOMMENDED
GROUP BY facid
ORDER BY SUM(slots);

-- TASK 12: Produce a list of facilities with more than 1000 slots booked. 
-- 			Produce an output table consisting of facility id and total slots, sorted by facility id.
SELECT facid, SUM(slots) AS total_slots
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid

-- TASK 13: How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'?
-- 			Return a list of start times and facility name pairings, ordered by the time.
SELECT cd.bookings.starttime, cd.facilities.name
FROM cd.facilities
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid
WHERE cd.facilities.name ILIKE '%Tennis%'  
AND cd.bookings.starttime >= '2012-09-21%'
AND cd.bookings.starttime < '2012-09-22%'
ORDER BY cd.bookings.starttime; 

 -- ===>> WHERE cd.facilities.name IN('Tennis Court 1', 'Tennis Court 2')
 -- ===>> WHERE cd.facilities.facid IN(1,2)
 
-- TASK 14: How can you produce a list of the start times for bookings by members named 'David Farrell'?
SELECT cd.members.firstname ||' '|| cd.members.surname AS full_name, cd.bookings.starttime
FROM cd.members
INNER JOIN cd.bookings
ON cd.members.memid = cd.bookings.memid
WHERE cd.members.firstname ||' '|| cd.members.surname LIKE 'David Farrell';






































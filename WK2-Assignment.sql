#1. How Many Airplanes have listed speeds? 
SELECT COUNT(*) FROM planes WHERE speed IS NOT NULL;

#1. What is the minimum listed speed and the maximum listed speed?

SELECT MIN(speed), MAX(speed) FROM planes WHERE speed IS NOT NULL;

#2. What is the total distance flown by all of the planes in January 2013?

SELECT SUM(distance) FROM flights WHERE YEAR = 2013 AND MONTH = 1;

#2. What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?

SELECT SUM(distance) FROM flights WHERE YEAR = 2013 AND MONTH = 1 AND tailnum IS NULL;

#3. What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer?

SELECT manufacturer, SUM(distance) FROM flights f INNER JOIN planes p  
WHERE p.tailnum = f.tailnum AND f.year = 2013 AND MONTH = 7 AND DAY = 5 GROUP BY manufacturer;


#3. Write this statement first using an INNER JOIN, then using a LEFT OUTER Join. How do results compare?

SELECT manufacturer, SUM(distance) FROM flights f LEFT OUTER JOIN planes p  
ON f.tailnum = p.tailnum WHERE f.year = 2013 AND MONTH = 7 AND DAY = 5 GROUP BY manufacturer;

#THIS QUERY BRINGS IN DATA FOR AIRPLANES WITH MISSING MANUFACTURERS IDENTIFICATION. 
# THE FIRST ROW IN THE QUERY IS A NULL** MANUFACTURER WITH SUM(DISTANCE) OF 127,761 ALL OTHER MANFCTR. ARE CORRECTLY REPORTED.


#4. What is the total flights manufactured by AIRBUS departing from JFK grouped by carrier?
SELECT a.name, COUNT(a.carrier) FROM flights f LEFT JOIN airlines a ON f.carrier = a.carrier INNER JOIN planes p
WHERE p.tailnum = f.tailnum AND p.manufacturer = 'AIRBUS INDUSTRIE' AND f.origin = 'JFK' GROUP BY a.name;

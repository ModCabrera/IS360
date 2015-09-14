SELECT a.name, a.lat, a.lon, f.origin, AVG(f.dep_delay), year, month 
FROM flights f INNER JOIN airports a 
ON a.faa = f.origin GROUP BY f.origin, year, month
INTO OUTFILE '/Users/cabmod/Documents/IS360/Week3-Assignment.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
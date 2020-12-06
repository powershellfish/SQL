# Trends in Startups

# Returns all entries in startup table

SELECT *
FROM startups;

# Returns total number of companies in the table

SELECT COUNT(*)
FROM startups;

# Returns total value of all companies in the table by calculating SUM 

SELECT SUM(valuation)
FROM startups;

# Returns highest amount raised by startup

SELECT MAX(raised)
FROM startups;

# Returns max amount of money raised during seed stage

SELECT MAX(raised)
FROM startups
WHERE stage = 'Seed';

# Returns which year the oldest company on the list was founded

SELECT MIN(founded)
FROM startups;

# Returns the average valuation

SELECT AVG(valuation)
FROM startups;

# Returns average valuation in each CATEGORY

SELECT category, AVG(valuation)
FROM startups
GROUP BY category;

# Returns average valuation by category and rounds averages to two decimal places

SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY category;

# Returns average valuation in each category, rounds averages to two decimal places, and orders list from highest averages to lowest.

SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY 1
ORDER BY 2 DESC;

# Returns name of each category with total number of companies that belong to it.

SELECT category, COUNT(*)
FROM startups
GROUP BY category;

# Returns same results as previous query but filters to only include categories that have more than three companies in them (most competitive markets)

SELECT category, COUNT(*)
FROM startups
GROUP BY category
HAVING COUNT(*) > 3
ORDER BY 2 DESC;

# Returns average size of a startup in each location

SELECT location, AVG(employees)
FROM startups
GROUP BY location;

# Returns the average size of a startup in each location with an average size above 500

SELECT location, AVG(employees)
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;
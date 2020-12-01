# New York Restaurants Project
# This is a project that involved progressively querying for different pieces of information. 
# The table nomnom contains the following columns: neighborhood, cuisine, review, price, and health rating.



# Returns all distinct neighborhoods from the neighborhood column

SELECT DISTINCT neighborhood
FROM nomnom;

# Returns all distinct cuisine from the cuisine column

SELECT DISTINCT cuisine
FROM nomnom;

# Returns all columns from nomnom table but only where the cuisine is Chinese

SELECT *
FROM nomnom
WHERE cuisine = 'Chinese'

# Returns all restaurants with a review of 4 or higher

SELECT *
FROM nomnom
WHERE review >= 4;

# Returns all restaurants that are Italian cuisine and $$$

SELECT *
FROM nomnom
WHERE cuisine = 'Italian'
    AND price = '$$$'

# Returns all results that contain 'meatball' in the restaurant name

SELECT *
FROM nomnom
WHERE name LIKE '%meatball%';

# Returns all results that are located in Midtown, Downtown, or Chinatown

SELECT *
FROM nomnom
WHERE neighborhood = 'Midtown'
  OR neighborhood = 'Downtown'
  OR neighborhood = 'Chinatown';

# Returns all results where there isn't a health score for a restaurant

SELECT *
FROM nomnom
WHERE health IS NULL;

# Returns top 10  reviewed restaurants in descending order 

SELECT *
FROM nomnom
ORDER BY review DESC
LIMIT 10;

# Changes the rating system from numbers to words and renames the column to 'Review'

SELECT review,
  CASE
    WHEN review > 4.5 THEN 'Extraordinary'
    WHEN review > 4 THEN 'Excellent'
    WHEN review > 3 THEN 'Good'
    WHEN review > 2 THEN 'Fair'
    ELSE 'Poor'
  END AS 'Review'
FROM nomnom;

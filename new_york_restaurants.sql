# New York Restaurants Project

# Pulls all distinct neighborhoods from the neighborhood column

SELECT DISTINCT neighborhood
FROM nomnom;

# Pulls all distinct cuisine from the cuisine column

SELECT DISTINCT cuisine
FROM nomnom;

# Selects all columns from nomnom table but only where the cuisine is Chinese

SELECT *
FROM nomnom
WHERE cuisine = 'Chinese'
#orders.sql

SELECT *
FROM orders
LIMIT 5;
 
SELECT *
FROM subscriptions
LIMIT 5;
 
SELECT * 
FROM customers
LIMIT 5;

SELECT *
FROM orders
JOIN customers
  ON orders.customer_id = customers.customer_id;

  #Line 15: selects all columns in combined table.
  #Line 16: specifies first table we want to look in (orders)
  #Line 17: uses JOIN to say we want to combine information from orders with customers.
  #Line 18: tells us HOW to combine the two tables. That way, we can match ORDERS table's CUSTOMER_ID column with CUSTOMERS table's CUSTOMER_ID column.

  -- First query (Join ORDERS table and SUBSCRIPTIONS and select all columns)
SELECT *
FROM orders
JOIN subscriptions
	ON orders.subscription_id = subscriptions.subscription_id;

-- Second query (Add second query that only selects rows from the join where DESCRIPTION is equal to FASHION MAGAZINE)
SELECT *
FROM orders
JOIN subscriptions
	ON orders.subscription_id = subscriptions.subscription_id
WHERE subscriptions.description = 'Fashion Magazine';

# INNER JOIN LESSON
# Count number of subscribers who get a print newspaper using COUNT()

SELECT COUNT(*)
FROM newspaper;

# Count the number of subscribers who get an online newspaper using COUNT()

SELECT COUNT(*)
FROM online;

# Join NEWSPAPER table and ONLINE table on their ID columns (unique identifier)

SELECT COUNT(*)
FROM newspaper
JOIN online
	ON newspaper.id = online.id;

# Start by performing a left join of newspaper table and online table on their id columns and selecting all columns.

SELECT *
FROM newspaper
LEFT JOIN online
  ON newspaper.id = online.id;

#Add second query after the first that finds out which users do NOT subscribe to the online edition.

SELECT *
FROM newspaper
LEFT JOIN online
	ON newspaper.id = online.id
WHERE online.id IS NULL;


# Perform inner join of CLASSES and STUDENTS using the primary and foreign keys, and select all columns

SELECT *
FROM classes
JOIN students
	ON classes.id = students.class_id;


# CROSS JOINING
# Count the number of customers who were subscribed to the newspaper during March.

SELECT COUNT(*)
FROM newspaper
WHERE start_month <= 3 
  AND end_month >= 3;
  
SELECT *
FROM newspaper
CROSS JOIN months;

SELECT *
FROM newspaper
CROSS JOIN months
WHERE start_month <= month 
  AND end_month >= month;

SELECT month, 
  COUNT(*)
FROM newspaper
CROSS JOIN months
WHERE start_month <= month 
  AND end_month >= month
GROUP BY month;

# Sometimes we just want to stack one dataset on top of the other. UNION allows us to do that. 
# Use UNION to stack newspaper table on TOP of the online table
# UNION combines results of two or more queries into a single result set that includes ALL rows that belong to the queries in that union. Indicates how SQL should use data from one table to select rows in another table.
# JOIN retrieves data from two or more tables based on logical relationships between the tables. 

SELECT *
FROM newspaper
UNION
SELECT *
FROM online;

# Using WITH on Multiple Tables
# Used when you want to combine two tables, but one of the tables is the result of another calculation. See following example:

WITH previous_results AS (
   SELECT ...
   ...
   ...
   ...
)
SELECT *
FROM previous_results
JOIN customers
  ON _____ = _____;

  WITH previous_query AS (
SELECT customer_id,
       COUNT(subscription_id) as subscriptions
FROM orders
GROUP BY customer_id)
SELECT customers.customer_name,
previous_query.subscriptions
FROM previous_query
JOIN customers
	ON customers.customer_id = previous_query.customer_id;
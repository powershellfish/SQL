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
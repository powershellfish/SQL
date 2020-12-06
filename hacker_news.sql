# Hacker News

# Lists the top 5 stories in Hacker News

SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

# Returns total score of all stories

SELECT  SUM(score)
FROM hacker_news;

# Returns all individual users who have gotten combined scores of more than 200 and their combined score.

SELECT user, SUM(score)
FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200
ORDER BY 2 DESC;

# Adds all the users' scores together and divides by total to get percentage. This means that 4 users have a combined 22% of the total scores in the table. Pretty significant!

SELECT (517 + 309 + 304 + 282) / 6366.0;

# Returns the number of times each Rickrolling offending user posted the link.

SELECT user,
   COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY 1
ORDER BY 2 DESC;

# Returns which sites feed Hacker News

SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source',
  COUNT(*)
FROM hacker_news
GROUP BY 1;

# Returns the best time of day to post a story on Hacker News

SELECT timestamp
FROM hacker_news
LIMIT 10;

# Using the strftime() function to return a reformatted date. In this case, we used it on the previous query.

SELECT timestamp,
  strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;

# Returns hours of timestamp column, average score for each hour, count of stores for each hour

SELECT strftime('%H', timestamp),
    AVG(score),
    COUNT(*)
FROM hacker_news
GROUP BY 1
ORDER BY 1;

# Reformats the previous query so that each value is rounded and each column is properly labeled.

SELECT strftime('%H', timestamp) AS 'Hour', 
   ROUND(AVG(score), 1) AS 'Average Score', 
   COUNT(*) AS 'Number of Stories'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 1;
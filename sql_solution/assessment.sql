/*SELECT *
FROM users
LIMIT 200;

SELECT *
FROM progress
LIMIT 200;*/

/*Top 25 schools (.edu domains*/
SELECT email_domain, COUNT(user_id) AS no_of_users
FROM users
GROUP BY 1
ORDER BY 2 DESC
LIMIT 25;

/*learners located in New York*/
SELECT city, COUNT(user_id) AS no_of_users
FROM users
WHERE city = 'New York';

/*number of learners using the mobile app*/
SELECT mobile_app, COUNT(mobile_app) AS no_of_users
FROM users
GROUP BY 1;

/*sign up counts for each hour*/
SELECT sign_up_at,
   strftime('%H', sign_up_at), COUNT(*)
FROM users
GROUP BY 1
LIMIT 25;

/*JOIN users and progress tables using user_id*/
SELECT *
FROM users
JOIN progress
  ON users.user_id = progress.user_id
LIMIT 25;

/*Do different schools (.edu domains) prefer different courses*/
SELECT email_domain, Count(*) AS learn_cpp
FROM users
JOIN progress
  ON users.user_id = progress.user_id
WHERE learn_cpp = 'completed' OR 'started'
LIMIT 25;

SELECT email_domain, Count(*) AS learn_sql
FROM users
JOIN progress
  ON users.user_id = progress.user_id
WHERE learn_sql = 'completed' OR 'started'
LIMIT 25;

SELECT email_domain, Count(*) AS learn_html
FROM users
JOIN progress
  ON users.user_id = progress.user_id
WHERE learn_html = 'completed' OR 'started'
LIMIT 25;

SELECT email_domain, Count(*) AS learn_javascript
FROM users
JOIN progress
  ON users.user_id = progress.user_id
WHERE learn_javascript = 'completed' OR 'started'
LIMIT 25;

SELECT email_domain, Count(*) AS learn_java
FROM users
JOIN progress
  ON users.user_id = progress.user_id
WHERE learn_java = 'completed' OR 'started'
LIMIT 25;

/*What courses are the New Yorkers students taking?*/
SELECT *
FROM users
JOIN progress
  ON users.user_id = progress.user_id
WHERE city = 'New York'
LIMIT 25;

SELECT city, count(learn_cpp)
FROM users
JOIN progress
  ON users.user_id = progress.user_id
WHERE learn_cpp = 'completed' OR 'started' AND city = 'New York'
LIMIT 25;

SELECT city, count(learn_sql)
FROM users
JOIN progress
  ON users.user_id = progress.user_id
WHERE learn_sql = 'completed' OR 'started' AND city = 'New York'
LIMIT 25;

SELECT city, count(learn_cpp) AS cpp, count(learn_sql) AS sql, count(learn_html) AS html, count(learn_javascript) AS javascript, count(learn_java) AS java
FROM users
JOIN progress
  ON users.user_id = progress.user_id
WHERE city = 'New York'
GROUP BY 1
LIMIT 25;

/*What courses are the Chicago students taking?*/
SELECT *
FROM users
JOIN progress
  ON users.user_id = progress.user_id
WHERE city = 'Chicago'
LIMIT 25;

SELECT city, count(learn_sql)
FROM users
JOIN progress
  ON users.user_id = progress.user_id
WHERE learn_sql = 'completed' OR 'started' AND city = 'Chicago'
LIMIT 25;

SELECT city, count(learn_cpp) AS cpp, count(learn_sql) AS sql, count(learn_html) AS html, count(learn_javascript) AS javascript, count(learn_java) AS java
FROM users
JOIN progress
  ON users.user_id = progress.user_id
WHERE city = 'Chicago'
GROUP BY 1
LIMIT 25;

/* courses by different cities*/

SELECT city, count(learn_cpp) AS cpp, count(learn_sql) AS sql, count(learn_html) AS html, count(learn_javascript) AS javascript, count(learn_java) AS java
FROM users
JOIN progress
  ON users.user_id = progress.user_id
GROUP BY 1
LIMIT 50;



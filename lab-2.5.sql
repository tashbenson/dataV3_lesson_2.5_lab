USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett’. --
SELECT * FROM actor
WHERE first_name = 'Scarlett';

-- 2. How many films (movies) are available for rent and how many films have been rented? --
SELECT COUNT(*) FROM film;

SELECT COUNT(*) FROM rental;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.--
SELECT MAX(length) as max_duration, MIN(length) as min_duration FROM film;

-- 4. What's the average movie duration expressed in format (hours, minutes)? --
SELECT (AVG(length)) AS 'average_movie_duration' FROM film;
SELECT time_format(AVG(length), "%h %i") AS 'average_movie_duration' FROM film;
-- I dont think the second command is working but not sure where I am going wrong --

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT(last_name)) FROM actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)? -- 
SELECT DATEDIFF('2023-01-19', MIN(rental_date) ) FROM rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results. --
SELECT *, DATE_FORMAT(rental_date, '%M') AS month, DATE_FORMAT(rental_date, '%a') AS weekday  FROM rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. --
SELECT *, DATE_FORMAT(rental_date, '%M') AS month, DATE_FORMAT(rental_date, '%a') AS weekday,  
CASE
WHEN  DATE_FORMAT(rental_date, '%a') = 'Sat' then 'Weekend'
WHEN  DATE_FORMAT(rental_date, '%a') = 'Sun' then 'Weekend'
ELSE 'Weekday'
END AS day_type
FROM rental;

-- 9. Get release years. --
SELECT release_year FROM film;

-- 10. Get all films with ARMAGEDDON in the title. --
SELECT * FROM film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO. --
SELECT * FROM film
WHERE title LIKE '%APOLLO%';

-- 12. Get 10 the longest films. -- 
SELECT * FROM film
ORDER BY length desc
LIMIT 10;

-- 13. How many films include Behind the Scenes content? --
SELECT COUNT(*) from film 
WHERE special_features = 'Behind the Scenes';






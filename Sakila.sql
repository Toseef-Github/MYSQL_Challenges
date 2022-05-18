USE sakila;
-- 1.	List all actors.

SELECT first_name, last_name FROM actor;

-- 2.	Find the surname of the actor with the forename 'John'.
SELECT first_name, last_name FROM actor 
WHERE first_name = 'John';

-- 3. Find all actors with surname 'Neeson'.

SELECT first_name, last_name FROM actor
WHERE last_name = 'Neeson';

-- 4. Find all actors with ID numbers divisible by 10.

SELECT first_name, actor_id FROM actor
WHERE actor_id%10=0;

-- 5. What is the description of the movie with an ID of 100?

SELECT film_id, `description` FROM film
WHERE film_id = 100;

-- 6. Find every R-rated movie.

SELECT title, rating FROM film
WHERE rating = 'R';

-- 7. Find every non-R-rated movie.

SELECT title, rating FROM film
WHERE rating != 'R';

-- 8. Find the ten shortest movies.

SELECT title, `length` FROM film 
ORDER BY `length` ASC LIMIT 10;

-- 9. Find the movies with the longest runtime, without using LIMIT.

SELECT title, `length` FROM film
ORDER BY `length`



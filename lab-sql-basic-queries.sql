USE sakila;

-- Question 1: Display all available tables in the Sakila database.
SHOW tables;

-- Question 2: Retrieve all the data from the tables actor, film and customer.
SELECT *
FROM actor, film, customer;

-- Question 3: Retrieve the following columns from their respective tables:
-- 3.1 Titles of all films from the film table
-- 3.2 List of languages used in films, with the column aliased as language from the language table
-- 3.3 List of first names of all employees from the staff table

SELECT film.title AS Title, language.name AS language, staff.first_name
FROM film, language, staff
ORDER BY film.title;

-- Question 4: Retrieve unique release years.
SELECT DISTINCT release_year
FROM film;

-- Question 5: Counting records for database insights:
-- 5.1 Determine the number of stores that the company has.
-- 5.2 Determine the number of employees that the company has.
-- 5.4 Determine the number of distinct last names of the actors in the database.

SELECT COUNT(store.store_id), COUNT(staff.staff_id), COUNT(DISTINCT actor.last_name)
FROM store, staff, actor ;

-- 5.3 Determine how many have been rented.
SELECT COUNT(DISTINCT inventory_id)
FROM rental
WHERE return_date IS NULL;

-- 5.3 Determine how many films are available for rent 
SELECT COUNT(DISTINCT inventory_id)
FROM rental
WHERE return_date IS NOT NULL;

-- Question 6: Retrieve the 10 longest films.

SELECT title, length 
FROM film
ORDER BY length DESC
LIMIT 10;

-- Question 7: Use filtering techniques in order to:
-- 7.1 Retrieve all actors with the first name "SCARLETT".

SELECT * 
FROM actor
WHERE actor.first_name LIKE "SCARLETT";

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.

SELECT title, length
FROM film
WHERE title LIKE '%ARMAGEDDON%' and length >100;

-- 	7.3 Determine the number of films that include Behind the Scenes content
SELECT COUNT(title)
FROM film
WHERE special_features LIKE '%Behind the Scenes%';

SELECT COUNT(DISTINCT inventory_id)
FROM rental;
-- 1a
USE sakila;
SELECT DISTINCT last_name, first_name FROM actor;
-- 1b 
SELECT CONCAT(first_name, ' ', last_name) AS name FROM actor;
ALTER TABLE actor ADD COLUMN Actor_Name VARCHAR(50);
UPDATE actor SET Actor_Name = CONCAT(first_name, ' ', last_name); 
-- 2a
SELECT last_name, actor_id FROM actor WHERE first_name="Joe";
-- 2b
SELECT * FROM actor WHERE last_name LIKE "%gen";
-- 2c
SELECT * FROM actor WHERE first_name LIKE "%li" ORDER BY last_name, first name;
-- 2d
SELECT * FROM country WHERE country IN ( "Afghanistan", "Bangladesh", "China");
-- 3a
ALTER TABLE actor ADD COLUMN middle_name VARCHAR(50) AFTER first_name;
-- 3b
ALTER TABLE actor MODIFY middle_name blob;
-- 3c
ALTER TABLE actor DROP middle_name;
-- 4a
SELECT last_name, count(*) from actor group by last_name;
-- 4b
SELECT last_name, count(*) from actor group by last_name HAVING count(*) > 1;
-- 4c
UPDATE actor SET first_name="HARPO" WHERE first_name=" GROUCHO";
-- 5a
SELECT * FROM address;
-- 6a
SELECT staff.first_name, staff.last_name, address.address FROM staff INNER JOIN address ON staff.address_id=address.address_id;
-- 6b
SELECT staff.first_name, staff.last_name, payment_amount FROM staff INNER JOIN payment ON staff.staff_id=payment.staff_id;


-- 6e
SELECT last_name, SUM(amount) 
FROM customer 
INNER JOIN payment 
ON payment.customer_id=customer.customer_id 
GROUP BY last_name;

-- 7a
SELECT DISTINCT title FROM film
WHERE (title LIKE "c%") OR (title LIKE "k%");

-- 7b 

SELECT actor_id 
FROM film INNER JOIN film_actor
ON film.film_id=film_actor.film_id
WHERE film.title = "Alone Trip";


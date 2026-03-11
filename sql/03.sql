/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

SELECT DISTINCT c.customer_id FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON r.inventory_id = i.inventory_id
JOIN customer AS c ON c.customer_id = r.customer_id
WHERE f.film_id IN (
    SELECT f.film_id FROM film AS f
    JOIN inventory AS i ON f.film_id = i.film_id
    JOIN rental AS r ON r.inventory_id = i.inventory_id
    JOIN payment AS p ON p.rental_id = r.rental_id
    GROUP BY f.film_id
    ORDER BY SUM(amount) DESC
    LIMIT 5
)
ORDER BY c.customer_id ASC;

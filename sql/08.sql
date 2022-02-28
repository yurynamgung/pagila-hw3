/*
 * The film 'BUCKET BROTHERHOOD' is your favorite movie, but you're tired of watching it.
 * You want to find something new to watch that is still similar to 'BUCKET BROTHERHOOD'.
 * To find a similar movie, you decide to search the history of movies that other people have rented.
 * Your idea is that if a lot of people have rented both 'BUCKET BROTHERHOOD' and movie X,
 * then movie X must be similar and something you'd like to watch too.
 * Your goal is to create a SQL query that finds movie X.
 * Specifically, write a SQL query that returns all films that have been rented by at least 3 customers who have also rented 'BUCKET BROTHERHOOD'.
 *
 * HINT:
 * This query is very similar to the query from problem 06,
 * but you will have to use joins to connect the rental table to the film table.
 *
 * HINT:
 * If your query is *almost* getting the same results as mine, but off by 1-2 entries, ensure that:
 * 1. You are not including 'BUCKET BROTHERHOOD' in the output.
 * 2. Some customers have rented movies multiple times.
 *    Ensure that you are not counting a customer that has rented a movie twice as 2 separate customers renting the movie.
 *    I did this by using the SELECT DISTINCT clause.
 */

with bucket_customers as (
    select distinct customer.customer_id
    from customer
    join rental on (rental.customer_id = customer.customer_id)
    join inventory on (inventory.inventory_id = rental.inventory_id)
    join film on (film.film_id = inventory.film_id)
    where film.title = 'BUCKET BROTHERHOOD'
), shared_cust_film as ( -- all films with shared rental customers as bucket brotherhood
    select distinct film.title, c1.customer_id
    from customer c1
    join rental on (rental.customer_id = c1.customer_id)
    join inventory on (inventory.inventory_id = rental.inventory_id)
    join film on (film.film_id = inventory.film_id)
    where c1.customer_id in (select * from bucket_customers)
), count_cust_film as (
    select title, count(customer_id) as cust_count
    from shared_cust_film
    group by title
)
select title 
from count_cust_film
where cust_count > 2 and title != 'BUCKET BROTHERHOOD'
order by title;

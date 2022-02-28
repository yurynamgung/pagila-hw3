/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */
select title 
from (
    select film.title, count(film_actor.actor_id) as actor_count
    from film_actor
    join film on (film.film_id = film_actor.film_id)
    where film_actor.actor_id in (
        select film_actor.actor_id
        from film_actor
        join film on (film.film_id = film_actor.film_id)
        where title = 'AMERICAN CIRCUS'
    )   
    group by film.title
) t1
where actor_count > 1
order by title;

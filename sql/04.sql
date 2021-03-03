/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
select distinct
    first_name || ' ' || last_name as "Actor Name"
from (
select
    film_id,
    unnest(special_features) as special_features
from film
) t
JOIN film_actor USING (film_id)
join actor using (actor_id)
where
    special_features = 'Behind the Scenes'
order by "Actor Name"

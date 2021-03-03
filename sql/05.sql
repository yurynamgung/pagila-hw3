/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

select t.title 
from (
select *
from (
    SELECT
        film_id,
        title,
        unnest(special_features) as special_feature
    from film
) t
where
    special_feature = 'Behind the Scenes'
) t
INNER JOIN (
select *
from (
    SELECT
        film_id,
        title,
        unnest(special_features) as special_feature
    from film
) t
where
    special_feature = 'Trailers'
) t2 USING (film_id)
order by title;

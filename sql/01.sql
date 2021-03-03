/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 */

select
    title
from (
select
    title,
    rating,
    unnest(special_features) as special_features
from film
) t
where
    special_features = 'Trailers' and rating='G'
order by title desc

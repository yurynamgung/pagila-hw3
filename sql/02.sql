/*
 * Count the number of movies that contain each type of special feature.
 */

select
    special_features,
    count(*)
from (
    select
        unnest(special_features) as special_features
    from film
) t
group by special_features
order by special_features;


/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
with bacall_1 as (
select distinct
    actor_id
from film_actor
where
    film_id in (
    select
        film_id
    from film_actor
    where
        actor_id = 112
    )
    and actor_id != 112
)
select distinct
    first_name || ' ' || last_name as "Actor Name"
from film_actor
inner join actor using (actor_id)
where film_id in (
    select 
        film_id
    from film_actor
    where
        actor_id in (select * from bacall_1)
    )
    and actor_id not in (select * from bacall_1)
    and actor_id != 112
order by "Actor Name"


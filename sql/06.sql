/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

with bacall_0 as (
    select actor_id from actor where actor.first_name = 'RUSSELL' and actor.last_name = 'BACALL'
)
select distinct a1.first_name || ' ' || a1.last_name as "Actor Name"
from actor a1
join film_actor fa1 on (a1.actor_id = fa1.actor_id)
join film_actor fa2 on (fa1.film_id = fa2.film_id)
join actor a2 on (fa2.actor_id = a2.actor_id)
where a2.actor_id in (select * from bacall_0)
    and a1.actor_id not in (select * from bacall_0)
order by "Actor Name";

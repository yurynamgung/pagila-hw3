/*
 * Compute the number of customers who live outside of the US.
 */

select count(customer.customer_id)
from customer
join address on (customer.address_id = address.address_id)
join city on (address.city_id = city.city_id)
join country on (city.country_id = country.country_id)
where country.country != 'United States';

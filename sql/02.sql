/*
 * Compute the country with the most customers in it. 
 */

select country
from ( -- table w customer count from most to least
    select country.country, count(customer.customer_id)
    from customer
    join address on (customer.address_id = address.address_id)
    join city on (address.city_id = city.city_id)
    join country on (city.country_id = country.country_id)
    group by country.country
) t1
order by count desc
limit 1;
    

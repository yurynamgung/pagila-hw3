/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */
select country, sum(customer_payments) as total_payments
from (
    select country.country, sum(payment.amount) as customer_payments
    from customer
    join payment on (payment.customer_id = customer.customer_id)
    join address on (address.address_id = customer.address_id)
    join city on (address.city_id = city.city_id)
    join country on (city.country_id = country.country_id)
    group by customer.customer_id, country.country
) t1
group by country
order by total_payments desc, country;

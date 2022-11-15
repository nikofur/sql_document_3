-- 1. List all customers who live in Texas (use JOINs)

select customer_id, first_name, last_name, district
from customer
inner join address
on address.address_id = customer.address_id
where district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, amount
from customer
inner join payment
on payment.customer_id = customer.customer_id 
where amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id 
	having sum(amount) > 175
);

-- 4. List all customers that live in Nepal (use the city table)
select first_name, last_name, city, country
from customer
full join address
on customer.address_id = address.address_id 
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Nepal';

-- 5. Which staff member had the most transactions?
select payment.staff_id, count(payment.staff_id) as transaction_count
from payment
group by staff_id
order by transaction_count desc;

-- 6. How many movies of each rating are there?
select film.rating, count(film.rating) as rating_count
from film
group by rating 
order by rating_count desc;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
);

-- 8. How many free rentals did our stores give away?
select count(amount) as free_rentals
from payment
where amount = 0;
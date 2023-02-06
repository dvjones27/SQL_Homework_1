--Week 5 - Monday Questions

--1. How many actors are there with the last name ‘Wahlberg’?

select first_name, last_name, actor_id
from actor
where last_name like 'W__%rg';

--2



--2. How many payments were made between $3.99 and $5.99?

SELECT amount, COUNT(amount), sum(amount)
FROM payment
WHERE amount between 3.99 and 5.99
GROUP BY rollup (amount)
order by amount asc;

--4794


--3. What film does the store have the most of? (search in inventory)

select film.title,  inventory.film_id,  count(inventory.inventory_id)
from inventory 
join film on inventory.film_id = film.film_id 
group by (inventory.film_id, film.title)
order by count(inventory.film_id) desc;

--There are many films with a count of 8.


--4. How many customers have the last name ‘William’?

select first_name, last_name
from customer
where last_name like 'William';

--0

--5. What store employee (get the id) sold the most rentals?

select payment.staff_id, count(payment.rental_id)
from payment
join staff on payment.staff_id = staff.staff_id 
group by payment.staff_id
order by count(payment.rental_id) desc;


--2--7304

--6. How many different district names are there?

select distinct(district), count(distinct(district))
--select distinct(district), count(district)
from address 
group by (district);

--378



--7. What film has the most actors in it? (use film_actor table and get film_id)
select film_actor.film_id, count(actor_id), film.title 
from film_actor
join film on film_actor.film_id = film.film_id 
group by film_actor.film_id, film.title
order by count(actor_id) desc;

--508--film id
--Lambs Cincinatti--title

/*8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)*/
select customer_id, store_id, last_name
from customer
where store_id = 1 and last_name like '%es';

--13



/*9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
 *  with ids between 380 and 430? (use group by and having > 250)*/
select payment.customer_id, count(rental.inventory_id)
from payment
join rental on payment.customer_id = rental.customer_id 
where payment.customer_id between 380 and 430 
group by payment.customer_id, rental.inventory_id 
having count(rental.inventory_id) > 250

--0

/*10. Within the film table, how many rating categories are there? And what rating has the most
movies total?*/
select distinct(rating), count(rating)
from film 
group by rating 
order by count(rating) desc;

--5
--PG-13--223

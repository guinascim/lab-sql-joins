USE sakila;

select c.name as category, count(*) as num_films from film_category fc
join category c on fc.category_id = c.category_id
group by c.name;

select s.store_id, a.city, co.country from store s
join address a on s.address_id = a.address_id
join city ci on a.city_id = ci.city_id
join country co on ci.country_id = co.country_id;

select s.store_id, SUM(p.amount) as total_revenue from store s
join staff st on s.manager_staff_id = st.staff_id
join payment p on st.staff_id = p.staff_id
group by s.store_id;

select c.name as category, AVG(f.length) as avg_running_time from film_category fc
join category c on fc.category_id = c.category_id
join film f on fc.film_id = f.film_id
group by c.name;


select c.name as category, AVG(f.length) as avg_running_time from film_category fc
join category c on fc.category_id = c.category_id
join film f on fc.film_id = f.film_id
group by c.name
order by avg_running_time desc
limit 1;


select f.title as film_title, count(*) as num_rentals from film f
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by f.title
order by num_rentals desc
limit 10;

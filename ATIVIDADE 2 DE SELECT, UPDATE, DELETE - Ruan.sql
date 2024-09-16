use sakila;

show tables;

select * from actor;
select first_name as 'Primeiro nome', last_name as 'Último nome'
from actor;

select * from city;
select city_id as 'Número identificador', city as Cidades
from city
where city_id < 20;

select * from film;
select title as Filme, description as Descrição
from film;

select * from language;
select language_id as 'Identificador linguagens', name Nome
from language;

select customer_id as 'Identificador cliente', concat(first_name, ' ', last_name) as Nome, email
from customer
where customer_id = 41;

select city as Cidade, country_id as 'Identificador país'
from city
where country_id = 15;

select * from country;
select country_id as 'Identificador país', country as País
from country
where country_id = 21;

select film_id as 'Identificador filme', title as Filme, language_id as 'Identificador linguagem'
from film
where film_id = 10;

update film
set language_id = 2
where film_id = 10;

select film_id as 'Identificador filme', title as Filme, language_id as 'Identificador linguagem'
from film
where film_id = 10;

select * from payment;

delete from payment
where payment_id = 18;

select * from payment;
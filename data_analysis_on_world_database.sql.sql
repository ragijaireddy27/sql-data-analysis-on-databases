-- DATA ANALYSIS.
-- The following questions are addressed by the queries in this file:

-- 1. What are the top 10 most populated countries?
use world;
select *from country;
select name, Population from country order by Population desc limit 10;

-- 2. What is the average population of countries by continent?
select *from country;
select continent,avg(Population) as avg_pop from country group by continent;

-- 3. Which countries have a GNP per capita greater than $50,000?
select *from country;
select name,gnp from country where gnp>50000;

-- 4. What are the 5 largest cities in the world by population?
select *from city;
select name, Population from city order by Population desc limit 5;

-- 5. What percentage of the world's population lives in each continent?

select continent,sum(percentage) from country group by Continent;

-- 6. Which official languages are spoken by at least 50% of the population in their respective countries?
select *from countrylanguage;
select language ,sum(percentage) from countrylanguage where IsOfficial='t' group by language having sum(percentage)>=50;

-- 7. How many countries are there in each continent?

select continent,count(name) from country group by Continent;

-- 8. Which countries have more than 75% of their population living in cities?

select c.name as country,(sum(ci.Population) / sum(c.Population))*100 as pop from country c join city ci on ci.countrycode=c.code
group by c.name having (sum(ci.Population) / sum(c.Population))*100>75;

-- 9. Which countries have the highest number of official languages?

select c.name as country,count(cl.Language) from country c join countrylanguage cl on cl.countrycode=c.code
where cl.IsOfficial='t' group by c.name order by count(cl.Language) desc ;

-- 10. What is the total GNP for each continent?

select continent,sum(gnp) from country group by Continent;

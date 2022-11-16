--1. Find the artist names who taken the minimum fee to perform in a concert
select artist_name,fee 
from artist as a join (select * from performed_by where fee = (select min(fee) from performed_by)) as p
on a.artist_id = p.artist_id;

--2. List the concert_id of all the concerts and the number of artists who performed in that concert
select concert_id, count(*)
from performed_by
group by concert_id;

--3. Retrieve the number of instruments played by artist with artist_id=1235
select artist_id,count(*)
from artist_instrument
group by artist_id
having artist_id = 1235;

--4. Find the the average of total cost of properties for concerts that took place in 'Bengaluru'
select avg(total_cost) as avg_total_cost
from prop_cost p, concert c
where p.concert_id = c.concert_id
and c.city = 'Bengaluru'
group by c.city;

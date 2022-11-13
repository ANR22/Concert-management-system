--1. Find user ids who have attended rock concert during the month of Oct 2022 or Nov 2022
select t.user_id
from ticket t, concert c
where t.concert_id = c.concert_id and c.theme='Rock' and Date_time like '2022-10-%'
union
select t.user_id
from ticket t, concert c
where t.concert_id = c.concert_id and c.theme='Rock' and Date_time like '2022-11-%';

--2. Artists who charged fee greater than 30000 and playes more than 2 instruments
select artist_id,artist_name
from artist natural join artist_instrument
group by artist_id
having count(*) > 2
intersect
select artist_id, artist_name
from artist natural join performed_by
where fee > 30000;

--3. Users who have attended concerts in which artist_id=1247 performed and not attended any other concerts

select user_id
from ticket natural join concert where concert_id in (select concert_id from performed_by where artist_id=1247)
not in(
select user_id
from ticket natural join concert where concert_id not in (select concert_id from performed_by where artist_id=1247));


--4. Artits who play Guitar and keyboard but not flute
(select artist_id,artist_name
from artist natural join artist_instrument
where instrument = 'Guitar'
intersect
select artist_id,artist_name
from artist natural join artist_instrument
where instrument = 'Keyboard')
except
(select artist_id,artist_name
from artist natural join artist_instrument
where instrument = 'Flute');
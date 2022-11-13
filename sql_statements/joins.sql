--1. Retreive the names and fee taken of all artists who performed in the concert with concert_id = 10002
SELECT artist_name,fee
from artist natural join performed_by 
where concert_id=10002;

--2. Retreive the names and phone numbers of users who have not bought any tickets
SELECT name,ph_no
from ticket as t right outer join user as u
on u.user_id = t.user_id
where ticket_id is NULL;

--3. List the artist names who play atleast one instrument
SELECT distinct artist_name 
from artist as a left outer join artist_instrument as ai
on a.artist_id = ai.artist_id
where instrument is not null; 

--4. List the user names and user_id of users who have attended atleast 1 concert in which artist with artist_id=1242 performed.
select distinct u.user_id,u.name
from user u,ticket t
where u.user_id = t.user_id and t.ticket_id in (
select ticket_id from
(select concert_id from artist natural join performed_by where artist_id=1242) as c
natural join ticket as t);



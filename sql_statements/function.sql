DELIMITER $$
CREATE FUNCTION is_performing(artist_id INT,date_time TimeStamp)
RETURNS INT
BEGIN
DECLARE performing INT;
insert into dummy values(date(date_time));
SET performing = (SELECT COUNT(*) 
FROM concert c,performed_by p
where c.concert_id=p.concert_id and  
date(c.Date_time)=date(date_time) and
p.artist_id=artist_id);
RETURN performing;
END
$$
DELIMITER ;

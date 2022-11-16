DELIMITER $$
CREATE TRIGGER insert_before_performed_by
BEFORE INSERT 
ON performed_by FOR EACH ROW
BEGIN

DECLARE concert_date date;
DECLARE performing INT;
DECLARE err_msg VARCHAR(100);

SET err_msg = 'Artist not available....performing in a different concert on the same day:(';
SET concert_date = (SELECT Date_time FROM concert c where c.concert_id=new.concert_id);
SET performing = (SELECT is_performing(new.artist_id,date(concert_date)));
IF performing > 0 THEN
    SIGNAL SQLSTATE'45000'
    SET MESSAGE_TEXT = err_msg;
END IF;
END
$$
DELIMITER ;



DELIMITER $$
CREATE FUNCTION calc_prop_cost(concert_id INT)
RETURNS INT
BEGIN
DECLARE cost INT;
SET cost = (SELECT SUM(quantity*price_per_unit) FROM properties as p WHERE p.concert_id=concert_id);
RETURN cost;
END
$$
DELIMITER ;
create view prop_cost as
select concert_id,SUM(quantity*price_per_unit) as total_cost
from properties
group by concert_id;
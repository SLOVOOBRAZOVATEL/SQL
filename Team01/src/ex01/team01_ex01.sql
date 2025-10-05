create or replace function nearest_rate_to_usd(pcur_id bigint, pdate timestamp)
returns numeric as $$
declare
	rtu numeric;
begin
	select rate_to_usd into rtu
	from (
		(
			select 
				c.rate_to_usd,
				(c.updated - pdate) as t_dif
			from currency as c
			where c.updated > pdate and c.id = pcur_id
			order by t_dif
			limit 1
		) union (
			select
				c.rate_to_usd,
				(pdate - c.updated) as t_dif
			from currency as c
			where c.updated < pdate and c.id = pcur_id
			order by t_dif
			limit 1
		)
		order by t_dif
		limit 1
	);
	return rtu;
end;
$$ language plpgsql;

select 
	coalesce(u.name, 'not defined') as name,
	coalesce(u.lastname, 'not defined') as lastname,
	c.name as currency_name,
	round(b.money * nearest_rate_to_usd(b.currency_id, b.updated), 2) as currency_in_usd
from balance as b
left join "user" as u on u.id = b.user_id
join (
	select distinct id, name
	from currency
) as c on c.id = b.currency_id
order by 1 desc, 2, 3;
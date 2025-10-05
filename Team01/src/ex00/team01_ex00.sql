with cte_last_rates as (
    select distinct on (id)
        id,
        name as currency_name,
        rate_to_usd as last_rate_to_usd
    from currency
    order by id, updated desc
)
select
	coalesce(u.name, 'not defined') as name,
	coalesce(u.lastname, 'not defined') as lastname,
	b.type,
	sum(coalesce(b.money, 0)) as volume,
	coalesce(ctelr.currency_name, 'not defined') as currency_name,
	coalesce(ctelr.last_rate_to_usd, 1) as last_rate_to_usd,
	(sum(coalesce(b.money, 0)) * coalesce(ctelr.last_rate_to_usd, 1))::float as total_volume_in_usd
from balance as b
full join "user" as u on u.id = b.user_id
left join cte_last_rates as ctelr on ctelr.id = b.currency_id
group by u.id, b.type, ctelr.id, ctelr.currency_name, ctelr.last_rate_to_usd
order by 1 desc, 2, 3;

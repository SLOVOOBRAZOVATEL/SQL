WITH visits AS (
    SELECT 
        pz.name,
        COUNT(*) AS count_visits
    FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
),
orders AS (
    SELECT 
        pz.name,
        COUNT(*) AS count_orders
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name
),
combined AS (
    SELECT name, count_visits, 0 AS count_orders FROM visits
    UNION ALL
    SELECT name, 0 AS count_visits, count_orders FROM orders
),
aggregated AS (
    SELECT 
        name,
        SUM(count_visits) AS total_visits,
        SUM(count_orders) AS total_orders,
        SUM(count_visits) + SUM(count_orders) AS total_count
    FROM combined
    GROUP BY name
)

SELECT name, total_count
FROM aggregated
ORDER BY total_count DESC, name ASC;
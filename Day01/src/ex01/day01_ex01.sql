SELECT object_name
FROM (SELECT name AS object_name,
1 AS source_order
FROM person

UNION ALL

SELECT pizza_name AS object_name, 
2 AS source_order
FROM menu
) combo
ORDER BY source_order ASC,
object_name ASC;
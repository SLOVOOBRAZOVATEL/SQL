
SELECT pz.name, 
COUNT(po.id) AS count_of_orders, 
ROUND(AVG(m.price),2) AS average_price, 
MAX(m.price) AS max_price, 
MIN(m.price) AS min_price
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person_order po ON m.id = po.menu_id
GROUP BY pz.name
ORDER BY pz.name
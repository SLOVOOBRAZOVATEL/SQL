SELECT p.name AS person_name,
m.pizza_name,
m.price,
ROUND(m.price * (100 - pd.discount)/ 100) AS discount_price,
pz.name AS pizzeria_name
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person_discounts pd ON pd.person_id = p.id AND pd.pizzeria_id = pz.id
ORDER BY 1,2
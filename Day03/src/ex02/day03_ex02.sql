SELECT menu.pizza_name AS pizza_name, menu.price AS price, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
LEFT JOIN person_order ON menu.id = person_order.menu_id
WHERE person_order.id IS NULL
ORDER BY 1,2 
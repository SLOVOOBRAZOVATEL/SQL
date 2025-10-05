SELECT DISTINCT name
FROM person
WHERE person.gender = 'female' 
AND person.id IN (
    SELECT person_order.person_id
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    WHERE menu.pizza_name = 'pepperoni pizza'
) AND person.id IN (
    SELECT person_order.person_id
    FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    WHERE menu.pizza_name = 'cheese pizza'
)
ORDER BY name 
WITH 
    who_order AS (
        SELECT
        person.gender,
        pizzeria.name AS pizzeria_name
        FROM person_order
        JOIN person ON person_order.person_id = person.id
        JOIN menu ON person_order.menu_id = menu.id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
        ),
    order_female AS (
        SELECT *
        FROM who_order
        WHERE who_order.gender = 'female'
        ),
    order_male AS (
        SELECT *
        FROM who_order
        WHERE who_order.gender = 'male'
        ),
    only_female AS (
        SELECT pizzeria_name
        FROM order_female

        EXCEPT

        SELECT pizzeria_name
        FROM order_male
    ),
    only_male AS (
        SELECT pizzeria_name
        FROM order_male

        EXCEPT

        SELECT pizzeria_name
        FROM order_female
    )

SELECT pizzeria_name
FROM only_female

UNION 

SELECT pizzeria_name
FROM only_male

ORDER BY pizzeria_name
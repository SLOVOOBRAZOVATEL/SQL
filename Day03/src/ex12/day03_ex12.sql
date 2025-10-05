INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
    ((SELECT COALESCE(MAX(id),0) 
    FROM person_order)+gs),
    gs,
    (SELECT id
    FROM menu
    WHERE pizza_name = 'greek pizza'),
    '2022-02-25'
FROM generate_series(
    (SELECT MIN(id)
    FROM person),
    (SELECT MAX(id)
    FROM person)
) AS gs

-- SELECT *
-- FROM person_order
-- JOIN menu ON person_order.menu_id = menu.id
-- WHERE order_date = '2022-02-25'
-- ORDER BY person_order.id DESC


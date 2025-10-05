DELETE FROM person_order
WHERE order_date = '2022-02-25' AND menu_id IN (
    SELECT id
    FROM menu
    WHERE pizza_name = 'greek pizza'
);

DELETE FROM menu
WHERE pizza_name = 'greek pizza'

-- SELECT *
-- FROM person_order
-- JOIN menu ON person_order.menu_id = menu.id
-- WHERE order_date = '2022-02-25'
-- ORDER BY person_order.id DESC

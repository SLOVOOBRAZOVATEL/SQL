SELECT id, person_id, 
    menu_id, .order_date 
FROM(
    SELECT person_order.id, person_order.person_id, 
    person_order.menu_id, person_order.order_date 
    FROM person_order
    WHERE person_order.id % 2=0
    ORDER BY id
)sub;
INSERT INTO menu (id,pizza_name,price,pizzeria_id)
VALUES (
    (
        SELECT COALESCE(MAX(id), 0)+1 
        FROM menu
    ),
    'sicilian pizza',
    900,
    (
        SELECT id
        FROM pizzeria
        WHERE name = 'Dominos'
    )
)

-- SELECT *
-- FROM menu
-- WHERE pizza_name = 'sicilian pizza';

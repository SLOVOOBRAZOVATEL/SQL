SELECT DISTINCT pizza_name
FROM menu m1
WHERE m1.id = 
(
    SELECT MIN((m2.id))
    FROM menu m2
    WHERE m2.pizza_name = m1.pizza_name
)
ORDER BY pizza_name DESC
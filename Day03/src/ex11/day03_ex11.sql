UPDATE menu
SET price = ROUND(price *0.9)
WHERE pizza_name = 'greek pizza'

-- SELECT pizza_name, price
-- FROM menu
-- WHERE pizza_name = 'greek pizza'

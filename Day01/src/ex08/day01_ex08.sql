SELECT order_date, name || '(age:' || age ||')' AS info_about_person
FROM person_order
NATURAL JOIN (
SELECT id AS person_id, name, age
FROM person
)
ORDER BY order_date ASC, info_about_person ASC 
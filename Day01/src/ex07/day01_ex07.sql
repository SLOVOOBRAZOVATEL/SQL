SELECT order_date, person.name || '(age:' || age ||')' AS info_about_person
FROM person_order
INNER JOIN person
ON person_order.person_id=person.id
ORDER BY order_date ASC, info_about_person ASC 
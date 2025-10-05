SELECT person.id, person.name, person.age, person.gender, person.address,
pizzeria.id, pizzeria.name, pizzeria.rating
FROM person CROSS JOIN pizzeria
ORDER BY person.id ASC, pizzeria.id ASC
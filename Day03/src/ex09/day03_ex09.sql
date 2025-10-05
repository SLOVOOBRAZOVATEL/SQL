INSERT INTO person_visits (id,person_id,pizzeria_id,visit_date)
VALUES (
    (
        SELECT COALESCE(MAX(id), 0)+1
        FROM person_visits
    ),
    (
        SELECT person.id
        FROM person
        WHERE person.name = 'Denis'
    ),
    (
        SELECT pizzeria.id
        FROM pizzeria
        WHERE pizzeria.name = 'Dominos'
    ),
    '2022-02-24'
);
INSERT INTO person_visits (id,person_id,pizzeria_id,visit_date)
VALUES (
    (
        SELECT COALESCE(MAX(id), 0)+1
        FROM person_visits
    ),
    (
        SELECT person.id
        FROM person
        WHERE person.name = 'Irina'
    ),
    (
        SELECT pizzeria.id
        FROM pizzeria
        WHERE pizzeria.name = 'Dominos'
    ),
    '2022-02-24'
)

-- SELECT *
-- FROM person_visits
-- JOIN person ON person_visits.person_id = person.id
-- WHERE person.name IN ('Denis', 'Irina') AND person_visits.visit_date = '2022-02-24'


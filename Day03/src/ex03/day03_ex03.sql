WITH 
    who_visit AS (
        SELECT 
            person_visits.pizzeria_id,
            pizzeria.name AS pizzeria_name,
            person.gender
        FROM person_visits
        JOIN person ON person_visits.person_id = person.id
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    ),
    visit_female AS (
        SELECT *
        FROM who_visit
        WHERE who_visit.gender = 'female'
    ),
        visit_male AS (
        SELECT *
        FROM who_visit
        WHERE who_visit.gender = 'male'
    ),
    common_visit AS (
        SELECT
        visit_female.pizzeria_id,
        visit_female.pizzeria_name
        FROM visit_female

        INTERSECT ALL

        SELECT 
        visit_male.pizzeria_id,
        visit_male.pizzeria_name
        FROM visit_male
    ),
    more_female AS (
        SELECT
        visit_female.pizzeria_name
        FROM
        visit_female

        EXCEPT ALL

        SELECT
        common_visit.pizzeria_name
        FROM
        common_visit
    ),
    more_male AS (
        SELECT
        visit_male.pizzeria_name
        FROM
        visit_male

        EXCEPT ALL

        SELECT
        common_visit.pizzeria_name
        FROM
        common_visit
    )

SELECT *
FROM more_female

UNION ALL

SELECT *
FROM more_male

ORDER BY pizzeria_name
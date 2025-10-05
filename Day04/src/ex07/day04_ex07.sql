WITH max_id_cte AS (
    SELECT COALESCE(MAX(id), 0) AS max_id
    FROM person_visits
),
candidate_pizzeria AS (
    SELECT pizzeria.id
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    WHERE menu.price < 800
    AND pizzeria.id NOT IN (
        SELECT DISTINCT person_visits.pizzeria_id
        FROM person_visits
      JOIN person ON person_visits.person_id = person.id
      WHERE person.name = 'Dmitriy' AND person_visits.visit_date = DATE '2022-01-08'
    )
  LIMIT 1
)

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT
  max_id + 1,
  (SELECT id FROM person WHERE name = 'Dmitriy'),
  id,
  DATE '2022-01-08'
FROM max_id_cte, candidate_pizzeria;

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

-- SELECT * 
-- FROM mv_dmitriy_visits_and_eats;

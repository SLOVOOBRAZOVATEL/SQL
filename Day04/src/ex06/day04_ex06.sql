CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT DISTINCT pz.name AS pizzeria_name
FROM person_visits pv
JOIN person p ON pv.person_id = p.id
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
JOIN menu m ON pz.id = m.pizzeria_id
WHERE p.name = 'Dmitriy'
  AND pv.visit_date = DATE '2022-01-08'
  AND m.price < 800;

-- SELECT * 
-- FROM mv_dmitriy_visits_and_eats;

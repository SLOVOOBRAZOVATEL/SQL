WITH date_series AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, INTERVAL '1 day') AS visit_date
),
missing_visits AS (
    SELECT date_series.visit_date::date
    FROM date_series
    LEFT JOIN person_visits ON date_series.visit_date = person_visits.visit_date
    AND person_visits.person_id IN (1,2)
    WHERE person_visits.person_id IS NULL
)
SELECT visit_date AS missing_date
FROM missing_visits
ORDER BY missing_date
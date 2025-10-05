CREATE VIEW v_generated_dates AS
SELECT generate_series::date AS generated_date
FROM generate_series(DATE '2022-01-01', DATE '2022-01-31', INTERVAL '1 day')
ORDER BY 1

-- SELECT *
-- FROM v_generated_dates
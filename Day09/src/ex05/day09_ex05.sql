DROP FUNCTION IF EXISTS fnc_persons_female();
DROP FUNCTION IF EXISTS fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS TABLE ( id BIGINT,
name VARCHAR,
age INT,
gender VARCHAR,
address VARCHAR) AS $$
SELECT id,name,age,gender,address
FROM person
WHERE gender = pgender $$
LANGUAGE sql STABLE;

-- select *
-- from fnc_persons(pgender := 'male');

-- select *
-- from fnc_persons();

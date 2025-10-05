CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson VARCHAR DEFAULT 'Dmitriy',
    IN pprice NUMERIC DEFAULT 500,
    IN pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE(pizzeria VARCHAR)
AS $$
BEGIN
    RETURN QUERY
    SELECT DISTINCT pz.name
    FROM pizzeria pz
    JOIN person_visits pv ON pz.id = pv.pizzeria_id
    JOIN person p ON pv.person_id = p.id
    JOIN menu m ON m.pizzeria_id = pz.id
    WHERE p.name = pperson AND m.price <pprice AND pv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql STABLE;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');

CREATE OR  REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fibnum INTEGER) AS $$
DECLARE
    f1 INTEGER := 0;
    f2 INTEGER := 1;
    f3 INTEGER;
BEGIN
RETURN QUERY SELECT f1;
    WHILE f2< pstop LOOP
        RETURN QUERY SELECT f2;
        f3 := f1+f2;
        f1:=f2;
        f2:=f3;
    END LOOP;
END;
$$ LANGUAGE plpgsql STABLE;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();

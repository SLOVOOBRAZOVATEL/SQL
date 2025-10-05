CREATE INDEX IF NOT EXISTS idx_person_name ON person (UPPER(name));

set enable_seqscan=off;

EXPLAIN ANALYZE
SELECT *
FROM person
WHERE UPPER(name) = 'DENIS';



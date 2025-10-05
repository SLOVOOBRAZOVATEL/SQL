CREATE TABLE person_audit
(
    created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type_event CHAR(1) NOT NULL DEFAULT 'I',
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INT,
    gender VARCHAR,
    address VARCHAR,
    CONSTRAINT ch_te CHECK(type_event IN('I','U','D'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO person_audit(row_id, name, age, gender, address, type_event)
  VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address, 'I');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

-- INSERT INTO person(id, name, age, gender, address) 
-- VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

-- SELECT * FROM person_audit WHERE row_id = 10;

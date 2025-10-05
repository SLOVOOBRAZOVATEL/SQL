-- Сеанс №1
BEGIN;
-- Начинаем транзакцию (уровень изоляции по умолчанию — READ COMMITTED)

-- Сеанс №2 
BEGIN;
-- Начинаем вторую транзакцию

-- Сеанс №1
-- Обновляем рейтинг в первой транзакции
UPDATE pizzeria SET rating = 0 WHERE id = 1;
-- Захватываем блокировку на строке с id=1

-- Сеанс №2
UPDATE pizzeria SET rating = 0 WHERE id = 2;
-- Захватываем блокировку на строке с id=2

-- Сеанс №1
-- Пытаемся получить блокировку на строке с id=2
UPDATE pizzeria SET rating = 1 WHERE id = 2;
-- Транзакция блокируется, ждёт освобождения ресурса,
-- но ресурс удерживается вторым сеансом, создаётся круговая зависимость

-- Сеанс №2
-- Пытаемся получить блокировку на строке с id=1
UPDATE pizzeria SET rating = 1 WHERE id = 1;
-- Здесь зависание и далее возникнет deadlock
-- В результате получаем ошибку:
-- ERROR: deadlock detected
-- DETAIL: Process 5962 waits for ShareLock on transaction 845; blocked by process 5951.
-- Process 5951 waits for ShareLock on transaction 846; blocked by process 5962.
-- HINT:  See server log for query details.
-- CONTEXT:  while updating tuple (0,23) in relation "pizzeria"




.

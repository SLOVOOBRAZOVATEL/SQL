-- Сеанс №1
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Устанавливаем самый строгий уровень изоляции

-- Сеанс №2
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Начинаем вторую транзакцию
-- Таймлайн независимый, снимок для этой транзакции фиксируется тоже при запуске

-- Сеанс №1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Данные снимка текущей транзакции фиксируются сейчас


-- Сеанс №2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
-- Обновляем рейтинг в этой транзакции

COMMIT;
-- Фиксируем изменения, теперь рейтинг 3.0 в базе

-- Переходим к Сеансу №1 
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Видим старый рейтинг 3.6 (снимок с начала транзакции)

-- Для корректного завершения нужно сделать:
ROLLBACK;
-- Откатываем текущую транзакцию из-за ошибки сериализации

-- Запускаем транзакцию заново:

BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Видим уже обновлённый рейтинг 3.0

COMMIT;
-- Фиксируем с учётом последних изменений

-- Итоговый запрос в любом из сеансов:
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Рейтинг будет 3.0
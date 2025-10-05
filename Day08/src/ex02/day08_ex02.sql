-- Сеанс №1
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Устанавливаем уровень изоляции REPEATABLE READ

-- Сеанс №2
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Начинаем вторую транзакцию

-- Сеанс №1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Смотрим текущий рейтинг 

-- Сеанс №2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Видим старый рейтинг 4.6 (снимок с начала транзакции)

-- Сеанс №1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- Обновляем рейтинг, пока транзакция не подтверждена (COMMIT отсутствует)

-- Переходим к Сеансу №2 
-- Пробуем обновить рейтинг на 3.6
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- Здесь возникнет ошибка сериализации, если Сеанс №1 обновил строку и ещё не завершил транзакцию.
ROLLBACK;
-- Откатываем текущую неудачную транзакцию

-- Повторяем транзакцию заново
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Видим уже обновлённый первый рейтинг 4

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- Выполняем обновление корректно

COMMIT;

-- Сеанс №1
COMMIT;
-- Фиксируем изменения первой транзакции

-- Итоговый запрос в любом из сеансов:
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Рейтинг будет 3.6.
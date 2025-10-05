-- Сеанс №1
BEGIN;
-- Начинаем первую транзакцию, автокоммит отключён

-- Сеанс №2
BEGIN;
-- Начинаем вторую транзакцию

-- Сеанс №1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Смотрим текущий рейтинг

-- Сеанс №2
-- Обновляем рейтинг на 3.6
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

COMMIT;
-- Фиксируем вторую транзакцию.

-- Сеанс №1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Видим новый рейтинг 3.6
COMMIT;
-- Фиксируем изменения первого сеанса.

-- Итоговый запрос в любом из сеансов:
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Рейтинг будет 3.6.


-- Сеанс №1
BEGIN;
-- Запускаем транзакцию

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
-- Обновляем рейтинг (изменение локально видимо)

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Проверяем обновление - увидим rating = 5


-- Сеанс №2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Пока видим старый рейтинг, т.к. COMMIT не сделан

-- Возвращаемся в Сеанс №1
COMMIT;
-- Фиксируем транзакцию, изменения видны всем

-- Снова в Сеанс №2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Теперь видим рейтинг = 5

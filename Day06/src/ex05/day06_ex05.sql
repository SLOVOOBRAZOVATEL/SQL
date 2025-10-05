-- Комментарий к таблице
COMMENT ON TABLE person_discounts IS 'Таблица хранит информацию о персональных скидках клиентов в разных пиццериях';

-- Комментарии к столбцам
COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор записи скидки';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента, на которого действует скидка';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, к которой относится скидка';
COMMENT ON COLUMN person_discounts.discount IS 'Величина скидки в процентах, применяемая к заказам клиента';
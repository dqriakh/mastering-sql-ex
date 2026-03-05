-- ¬ предположении, что приход и расход денег на каждом пункте приема фиксируетс€ произвольное число раз
-- (первичным ключом в таблицах €вл€етс€ столбец code), требуетс€ получить таблицу, в которой каждому пункту за каждую дату 
-- выполнени€ операций будет соответствовать одна строка.
-- ¬ывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). 
-- ќтсутствующие значени€ считать неопределенными (NULL).

WITH daily_income AS (
    SELECT 
        point,
        date,
        SUM(inc) AS total_inc
    FROM Income
    GROUP BY point, date
),

daily_outcome AS (
    SELECT 
        point,
        date,
        SUM(out) AS total_out
    FROM Outcome
    GROUP BY point, date
)

SELECT 
    COALESCE(i.point, o.point) AS point,
    COALESCE(i.date, o.date) AS date,
    o.total_out AS out,
    i.total_inc AS inc
FROM daily_income i
FULL JOIN daily_outcome o ON i.point = o.point AND i.date = o.date
ORDER BY point, date

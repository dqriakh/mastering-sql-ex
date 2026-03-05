-- В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], 
-- написать запрос с выходными данными (пункт, дата, приход, расход). 
-- Использовать таблицы Income_o и Outcome_o.

SELECT 
    i.point,
    i.date,
    i.inc AS income,
    o.out AS outcome
FROM Income_o i
LEFT JOIN Outcome_o o ON i.point = o.point AND i.date = o.date

UNION

SELECT 
    o.point,
    o.date,
    NULL AS income,
    o.out AS outcome
FROM Outcome_o o
LEFT JOIN Income_o i ON o.point = i.point AND o.date = i.date
WHERE i.point IS NULL
ORDER BY point, date
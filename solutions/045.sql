-- Найдите названия всех кораблей в базе данных, состоящие из трех и более слов (например, King George V).
-- Считать, что слова в названиях разделяются единичными пробелами, и нет концевых пробелов.

SELECT name AS ship
FROM Ships
WHERE LEN(name) - LEN(REPLACE(name, ' ', '')) >= 2

UNION

SELECT DISTINCT ship
FROM Outcomes
WHERE LEN(ship) - LEN(REPLACE(ship, ' ', '')) >= 2

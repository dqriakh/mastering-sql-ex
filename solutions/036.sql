-- Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes).

SELECT name AS ship
FROM Ships
WHERE name = class

UNION

SELECT DISTINCT o.ship
FROM Outcomes o
WHERE o.ship IN (
	SELECT class 
	FROM Classes
	)
AND o.ship NOT IN (
	SELECT name 
	FROM Ships
	)

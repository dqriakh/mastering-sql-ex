-- Найдите классы, в которые входит только один корабль из базы данных (учесть также корабли в Outcomes).

WITH all_ships AS (
    SELECT s.class, s.name AS ship
    FROM Ships s
    
    UNION
    
    SELECT c.class, o.ship
    FROM Outcomes o
    JOIN Classes c ON o.ship = c.class
    WHERE o.ship NOT IN (SELECT name FROM Ships)
)

SELECT class
FROM all_ships
GROUP BY class
HAVING COUNT(DISTINCT ship) = 1

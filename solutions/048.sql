-- Найдите классы кораблей, в которых хотя бы один корабль был потоплен в сражении.

WITH sunk_ships AS (
    SELECT DISTINCT ship
    FROM Outcomes
    WHERE result = 'sunk'
)

SELECT DISTINCT 
    COALESCE(s.class, c.class) AS class
FROM sunk_ships ss
LEFT JOIN Ships s ON ss.ship = s.name
LEFT JOIN Classes c ON ss.ship = c.class
WHERE COALESCE(s.class, c.class) IS NOT NULL;
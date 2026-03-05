-- Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal), вывести название, водоизмещение и число орудий.

WITH guadalcanal_ships AS (
    SELECT DISTINCT ship
    FROM Outcomes
    WHERE battle = 'Guadalcanal'
)

SELECT 
    gs.ship,
    c.displacement,
    c.numGuns
FROM guadalcanal_ships gs
LEFT JOIN Ships s ON gs.ship = s.name
LEFT JOIN Classes c ON c.class = COALESCE(s.class, gs.ship)
WHERE c.class IS NOT NULL

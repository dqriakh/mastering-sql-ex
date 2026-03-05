-- Определить страны, которые потеряли в сражениях все свои корабли.

WITH all_ships AS (
    SELECT s.name, c.country
    FROM Ships s
    JOIN Classes c ON s.class = c.class
    
    UNION
    
    SELECT o.ship, c.country
    FROM Outcomes o
    JOIN Classes c ON o.ship = c.class
    WHERE o.ship NOT IN (SELECT name FROM Ships)
),
ship_status AS (
    SELECT 
        a.country,
        a.name,
        CASE WHEN EXISTS (
            SELECT 1 FROM Outcomes o 
            WHERE o.ship = a.name AND o.result = 'sunk'
        ) THEN 1 ELSE 0 END AS is_sunk
    FROM all_ships a
)

SELECT country
FROM ship_status
GROUP BY country
HAVING MIN(is_sunk) = 1; 
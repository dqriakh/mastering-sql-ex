-- Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК,
-- имеющих наименьший объем RAM. Вывести: Maker

WITH BestPCs AS (
    SELECT model
    FROM PC
    WHERE ram = (SELECT MIN(ram) FROM PC)
      AND speed = (
          SELECT MAX(speed)
          FROM PC
          WHERE ram = (SELECT MIN(ram) FROM PC)
      )
)

SELECT DISTINCT p.maker
FROM Product p
WHERE p.model IN (SELECT model FROM BestPCs)
  AND p.maker IN (
      SELECT DISTINCT maker
      FROM Product
      WHERE type = 'Printer'
  )


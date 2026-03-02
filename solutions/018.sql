-- Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price

WITH min_price AS (
    SELECT MIN(price) AS min_price
    FROM Printer
    WHERE color = 'y'
)

SELECT DISTINCT p.maker, pr.price
FROM Product p
JOIN Printer pr ON p.model = pr.model
WHERE pr.color = 'y'
  AND pr.price = (SELECT min_price FROM min_price);
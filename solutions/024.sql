-- Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.

WITH MaxPrice AS (
    SELECT MAX(price) AS max_price
    FROM (
        SELECT price FROM PC
        UNION ALL
        SELECT price FROM Laptop
        UNION ALL
        SELECT price FROM Printer
    ) AS AllPrices
)

SELECT model
FROM PC
WHERE price = (SELECT max_price FROM MaxPrice)

UNION

SELECT model
FROM Laptop
WHERE price = (SELECT max_price FROM MaxPrice)

UNION

SELECT model
FROM Printer
WHERE price = (SELECT max_price FROM MaxPrice)
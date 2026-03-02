-- Найдите производителей принтеров. Вывести: maker

SELECT maker as Maker
FROM Product
WHERE type = 'Printer';
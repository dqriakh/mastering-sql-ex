-- Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC. 
-- Вывести: maker, максимальная цена.

SELECT maker, MAX(price) 
FROM PC p, Product pr
WHERE p.model = pr.model
GROUP BY maker;
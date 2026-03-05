-- Найдите производителей, которые производили бы как ПК
-- со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц. Вывести: Maker

SELECT maker as Maker
FROM PC p, Product pr
WHERE p.model = pr.model 
AND speed >= 750

INTERSECT

SELECT maker as Maker
FROM Laptop l, Product pr
WHERE l.model = pr.model 
AND speed >= 750

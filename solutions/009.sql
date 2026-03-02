-- Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

SELECT DISTINCT maker as Maker
FROM Product, PC
WHERE Product.model = PC.model
AND PC.speed >= 450;
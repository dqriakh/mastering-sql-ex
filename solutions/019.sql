-- Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
-- Вывести: maker, средний размер экрана.

SELECT p.maker, AVG(l.screen) 
FROM Laptop l 
JOIN Product p ON p.model = l.model
GROUP BY p.maker;

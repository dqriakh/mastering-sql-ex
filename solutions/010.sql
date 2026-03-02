-- Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

SELECT model, price 
FROM Printer
WHERE price = (
	SELECT max(price) 
	FROM Printer
	);

-- Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. Вывести: type, model, speed

SELECT 
	'Laptop' as type,
	model,
	speed
FROM Laptop
WHERE speed < (
	SELECT MIN(speed) 
	FROM PC
	);
-- Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.

SELECT 
	speed, 
	AVG(price) as 'avg price'
FROM PC
GROUP BY speed
HAVING speed > 600;

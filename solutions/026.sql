-- Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.

SELECT AVG(price) AS avg_price
FROM (
    SELECT pc.price
    FROM Product p
    JOIN PC pc ON p.model = pc.model
    WHERE p.maker = 'A' AND p.type = 'PC'
    
    UNION ALL
    
    SELECT l.price
    FROM Product p
    JOIN Laptop l ON p.model = l.model
    WHERE p.maker = 'A' AND p.type = 'Laptop'
) AS all_prices;
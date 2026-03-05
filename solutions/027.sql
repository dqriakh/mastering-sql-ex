-- Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.

SELECT 
    p.maker, 
    AVG(pc.hd) AS avg_hd
FROM Product p
JOIN PC pc ON p.model = pc.model
WHERE p.maker IN (
    SELECT DISTINCT maker
    FROM Product
    WHERE type = 'Printer'
)
AND p.type = 'PC'
GROUP BY p.maker;
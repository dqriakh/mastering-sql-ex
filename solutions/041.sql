-- Для каждого производителя, у которого присутствуют модели хотя бы в одной из таблиц PC, Laptop или Printer,
-- определить максимальную цену на его продукцию.
-- Вывод: имя производителя, если среди цен на продукцию данного производителя присутствует NULL, 
-- то выводить для этого производителя NULL, иначе максимальную цену.

WITH all_prices AS (

    SELECT p.maker, pc.price
    FROM Product p
    JOIN PC pc ON p.model = pc.model
    
    UNION ALL
    
    SELECT p.maker, l.price
    FROM Product p
    JOIN Laptop l ON p.model = l.model
    
    UNION ALL
    
    SELECT p.maker, pr.price
    FROM Product p
    JOIN Printer pr ON p.model = pr.model
)

SELECT 
    maker,
    CASE 
        WHEN COUNT(*) - COUNT(price) > 0 THEN NULL
        ELSE MAX(price)                         
    END AS max_price
FROM all_prices
GROUP BY maker;

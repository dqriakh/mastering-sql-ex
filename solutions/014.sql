-- Ќайдите класс, им€ и страну дл€ кораблей из таблицы Ships, имеющих не менее 10 орудий.

SELECT 
	Classes.class, 
	Ships.name, 
	Classes.country 
FROM Classes, Ships
WHERE Classes.class = Ships.class 
AND Classes.numGuns >= 10;
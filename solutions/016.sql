-- Ќайдите пары моделей PC, имеющих одинаковые скорость и RAM. ¬ результате кажда€ пара указываетс€ только один раз, т.е. (i,j), 
-- но не (j,i), ѕор€док вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.

SELECT DISTINCT
    pc1.model AS model_max,
    pc2.model AS model_min,
    pc1.speed,
    pc1.ram
FROM PC pc1
JOIN PC pc2 ON pc1.speed = pc2.speed
    AND pc1.ram = pc2.ram
    AND pc1.model > pc2.model;


-- ======================================================
-- Схема базы данных "Компьютерная фирма"
-- Для заданий с сайта sql-ex.ru
-- ======================================================

-- ======================================================
-- Удаление существующих таблиц (если они есть)
-- ======================================================
DROP TABLE IF EXISTS Printer;
DROP TABLE IF EXISTS Laptop;
DROP TABLE IF EXISTS PC;
DROP TABLE IF EXISTS Product;

-- ======================================================
-- Создание таблицы Product (продукты)
-- ======================================================
CREATE TABLE Product (
    maker VARCHAR(10) NOT NULL,        -- Производитель
    model VARCHAR(50) PRIMARY KEY,      -- Номер модели (уникальный)
    type VARCHAR(20) NOT NULL           -- Тип продукта: 'PC', 'Laptop', 'Printer'
);

-- ======================================================
-- Создание таблицы PC (персональные компьютеры)
-- ======================================================
CREATE TABLE PC (
    code INT PRIMARY KEY,                -- Уникальный код ПК
    model VARCHAR(50) NOT NULL,          -- Модель (внешний ключ к Product)
    speed INT,                           -- Скорость процессора (МГц)
    ram INT,                             -- Объем памяти (МБ)
    hd INT,                              -- Размер жесткого диска (ГБ)
    cd VARCHAR(10),                      -- Скорость CD-привода (например, '4x')
    price DECIMAL(10, 2),                 -- Цена (доллары)
    FOREIGN KEY (model) REFERENCES Product(model)
);

-- ======================================================
-- Создание таблицы Laptop (ноутбуки)
-- ======================================================
CREATE TABLE Laptop (
    code INT PRIMARY KEY,                -- Уникальный код ноутбука
    model VARCHAR(50) NOT NULL,          -- Модель (внешний ключ к Product)
    speed INT,                           -- Скорость процессора (МГц)
    ram INT,                             -- Объем памяти (МБ)
    hd INT,                              -- Размер жесткого диска (ГБ)
    price DECIMAL(10, 2),                 -- Цена (доллары)
    screen INT,                           -- Размер экрана (дюймы)
    FOREIGN KEY (model) REFERENCES Product(model)
);

-- ======================================================
-- Создание таблицы Printer (принтеры)
-- ======================================================
CREATE TABLE Printer (
    code INT PRIMARY KEY,                -- Уникальный код принтера
    model VARCHAR(50) NOT NULL,          -- Модель (внешний ключ к Product)
    color CHAR(1),                       -- Цветной? 'y' - да, 'n' - нет
    type VARCHAR(20),                     -- Тип: 'Laser', 'Jet', 'Matrix'
    price DECIMAL(10, 2),                 -- Цена (доллары)
    FOREIGN KEY (model) REFERENCES Product(model)
);

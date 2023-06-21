-- Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными

-- Выведите название, производителя и цену для товаров, количество которых превышает 2

-- Выведите весь ассортимент товаров марки “Samsung”

-- CREATE DATABASE hw1;
-- USE hw1;
CREATE TABLE mobile_phones
(
ID INT PRIMARY KEY NOT NULL,
brend VARCHAR(45) NOT NULL,
model VARCHAR(45) NOT NULL,
color VARCHAR(30) NOT NULL,
RAM VARCHAR(30) NOT NULL,
quantity INT NOT NULL,
price BOOLEAN NOT NULL
);

INSERT INTO mobile_phones(ID, brend, model, color, RAM, quantity, price)
VALUES
(1,'Apple','iPhone 14','Deep Purple','128GB', 4, 10000),
(2,'Apple','iPhone 14 Pro','Deep Purple','128GB', 5, 9999),
(22,'Apple','iPhone 14 Pro Max','Deep Purple','128GB', 1, 888),
(111,'Apple','iPhone 14','Silver','256GB',1, 232323),
(3,'Apple','iPhone 14 Pro','Silver','256GB',5, 1222),
(4,'Apple','iPhone 14 Pro Max','Silver','256GB',6, 100000),
(6,'Samsung','S23+','Green','128GB',6, 110000),
(88,'Samsung','S21','White','512GB',0, 220000),
(76,'Samsung','S23','Black','256GB',1, 53444),
(11,'Nokia','n93','BLACK','128GB',1, 44000),
(12,'Xiaomi','Note 10s','White','128GB',2, 22000),
(13,'Huawei','P20','Silver','128GB',3, 11000),
(14,'Samsung','S22','Green','128GB',4, 30000);

SELECT brend, model, color, RAM, price FROM mobile_phones
WHERE quantity > 2;

SELECT * FROM mobile_phones 
WHERE brend = 'Samsung';
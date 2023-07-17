/* 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов

Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)

Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)

Доп задания:
1* Получить ранжированный список автомобилей по цене в порядке возрастания
2* Получить топ-3 самых дорогих автомобилей, а также их общую стоимость
3* Получить список автомобилей, у которых цена больше предыдущей цены
4* Получить список автомобилей, у которых цена меньше следующей цены
5*Получить список автомобилей, отсортированный по возрастанию цены, и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля

*/

CREATE DATABASE hw5;
USE hw5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;


-- 1.
CREATE OR REPLACE VIEW cars_v1 AS
SELECT id, name, cost
FROM cars
WHERE cost < 25000;

-- 2.
ALTER VIEW cars_v1 AS
SELECT id, name, cost 
FROM cars
WHERE cost < 30000;

-- 3. 
CREATE OR REPLACE VIEW skd_audi AS
SELECT id, name, cost
FROM cars
WHERE name IN ('Skoda', 'Audi');

SELECT * FROM cars_v1;
SELECT * FROM skd_audi;

-- 1* Получить ранжированный список автомобилей по цене в порядке возрастания
SELECT
DENSE_RANK() OVER(ORDER BY cost) AS 'dense_rank',
id, name, cost
FROM cars;

-- 2* Получить топ-3 самых дорогих автомобилей, а также их общую стоимость
SELECT id, name, cost,
SUM(cost) over (partition by cost) as 'sum_cost'
FROM cars
ORDER BY cost DESC
LIMIT 3;

-- 3. Получить список автомобилей, у которых цена больше предыдущей цены
SELECT id, name, cost,
LAG(id) OVER w AS 'lag',
LEAD(id) OVER w AS 'lead'
FROM cars
WINDOW w AS (PARTITION BY name);




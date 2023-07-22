CREATE DATABASE lesson6;
USE lesson6;

delimiter //
CREATE PROCEDURE proc1()
BEGIN
	CASE
		WHEN CURTIME() BETWEEN '06:00:00' AND '11:59:59' THEN
        SELECT 'Доброе утро' AS `time`;
		WHEN CURTIME() BETWEEN '12:00:00' AND '17:59:59' THEN
        SELECT 'Добрый день' AS `time`;
        WHEN CURTIME() BETWEEN '18:00:00' AND '23:59:59' THEN
        SELECT 'Добрый вечер' AS `time`;
        ELSE 
        SELECT 'Доброй ночи' AS `time`;
        END CASE;
END //
delimiter ;

CALL proc1();


delimiter $$a
CREATE FUNCTION fibonacci(num INT) -- колво чисел Фибоначчи для вывода 
RETURNS VARCHAR(50)  
DETERMINISTIC
BEGIN
DECLARE fib1 INT DEFAULT 0;
DECLARE fib2 INT DEFAULT 1;
DECLARE fib3 INT DEFAULT 0;
DECLARE result VARCHAR(50) DEFAULT '0 1'; -- Первые два числа Фибоначчи
IF num = 1 THEN
RETURN fib1;
ELSEIF num = 2 THEN
RETURN CONCAT(fib1,' ', fib2); -- = result
ELSE
WHILE num > 2 DO
SET fib3 = fib1 + fib2;
SET fib1 = fib2;
SET fib2 = fib3;
SET num = num - 1;
SET result = CONCAT(result, ' ', fib3);
END WHILE;
RETURN result;
END IF;
END $$a
delimiter ;


SELECT fibonacci(10);

/*
Создайте и вызовите процедуру, которая при ее вызове будет выводить:
«Однозначное число» - если ее параметр равен от 1 до 9
«Двухзначное число» - если ее параметр равен от 10 до 99
«Трехзначное число» - если ее параметр равен от 100 до 999

Создайте функцию которая будет вычислять сумму трех переменных
a = 2030, b = 5124, c = 7903.
*/

CREATE TABLE bankaccounts(accountno varchar(20) PRIMARY KEY NOT NULL, funds decimal(8,2));
INSERT INTO bankaccounts VALUES("ACC1", 1000);
INSERT INTO bankaccounts VALUES("ACC2", 1000);

SELECT * FROM bankaccounts;

START TRANSACTION;
UPDATE bankaccounts
SET funds = funds - 100 WHERE accountno = 'ACC1';
UPDATE bankaccounts
SET funds = funds + 100 WHERE accountno = 'ACC2';
COMMIT;

START TRANSACTION;
UPDATE bankaccounts
SET funds = funds - 100 WHERE accountno = 'ACC1';
UPDATE bankaccounts
SET funds = funds + 100 WHERE accountno = 'ACC2';
ROLLBACK;

START TRANSACTION;
UPDATE bankaccounts
SET funds = funds - 100 WHERE accountno = 'ACC1';
UPDATE bankaccounts
SET funds = funds + 100 WHERE accountno = 'ACC2';
TRUNCATE bankaccounts;
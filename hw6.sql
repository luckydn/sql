CREATE DATABASE hw7;
USE hw7;
 
-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

delimiter $$
CREATE FUNCTION sectotime(val INT)
RETURNS CHAR(50)
DETERMINISTIC
BEGIN
DECLARE DD CHAR(3);
DECLARE HH, MI, SS CHAR(2);
DECLARE res CHAR(50);
SET DD = CAST(FLOOR(VAL/60/60/24) AS CHAR(3));
SET HH = CAST(FLOOR(MOD(VAL/60/60/24,1)*24) AS CHAR(2));
SET MI = CAST(FLOOR(MOD(mod(VAL/60/60/24,1)*24,1)*60) AS CHAR(2));
SET SS = CAST(ROUND(MOD(MOD(MOD(VAL/60/60/24,1)*24,1)*60,1)*60) AS CHAR(2));
SET res = CONCAT(DD, ' Дней ', HH, ' Часов ', MI, ' Мминут ', SS, ' Секунд ');
RETURN res;
END $$
delimiter ;

SELECT sectotime(12311125);

-- Создайте процедуру которая, выводит только четные числа от 1 до 10. 
-- Пример: 2,4,6,8,10 


DELIMITER $$
CREATE PROCEDURE numbers()
BEGIN
    DECLARE n INT default 0;
    DROP TABLE IF EXISTS nums;
    CREATE TABLE nums (n INT);

    WHILE n < 10 DO
    SET n = n + 2;
    INSERT INTO nums VALUES(n);
    END WHILE;

SELECT * FROM nums;
END $$
DELIMITER ;

CALL numbers();



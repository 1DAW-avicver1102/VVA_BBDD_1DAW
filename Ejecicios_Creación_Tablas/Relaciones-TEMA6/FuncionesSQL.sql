-- 1.
ASCII ('A');
-- 2.
CHAR(65, 66, 67);
-- 3
CONCAT ('Hola', ', ¿Cómo estás?');
-- 4 
CONCAT ('JUAN', '-', 'PEDRO', '-', 'LUIS');
-- 5
LENGTH ('Hola');
-- 6
LOCATE ('o', 'como le va', 2);
-- 7
LPAD ('Hola', 10, 'o');
-- 8
LEFT('Buenos dias', 8) AS Substri;
-- 9
RIGHT('Buenos dias', 8) AS Substri;
-- 10
SUBSTR('Buenos dias', 3, 5);
-- 11
SUBSTR('Margarita', 4);
-- 12
LTRIM('             HOLA             ');
-- 13
RTRIM('             HOLA             ');
-- 14
LPAD('Hola', 12, 'Hola');
-- 15
REPLACE('xxx.mysql.com', 'xxx', 'www');
-- 16
REVERSE('Hola');
-- 17
LOWER('HOLA ESTudiante');
-- 18
UPPER('HOLA ESTudiante');
-- 19
CHAR_LENGTH("Hola")=CHAR_LENGTH("Chau");
-- 20
ABS(-20);
-- 21
CEIL(12.34);
-- 22
FLOOR (12.34);
-- 23
MOD(10, 3);
-- 24
POWER(2, 3);
-- 25
ROUND(12.34);
-- 26
ROUND(12.64);
-- 27
SQRT(121);
-- 28
ROUND(123.4567, 2);
-- 29
ADDDATE("2006-10-10", 25);
-- 30
DATE_ADD("2006-9-11", INTERVAL 5 MONTH);
-- 31
CURDATE();
-- 32
DATEDIFF('2013-11-25', '2006-10-10');
-- 33
DAYOFWEEK('2006-8-10');
-- 34
DAYOFMONTH('2006-8-10');
-- 35
SELECT DAYOFYEAR('2006-8-10');
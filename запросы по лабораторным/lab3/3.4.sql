--12.5
USE Hotel;
GO
CREATE SCHEMA my_schema AUTHORIZATION peter
GO
CREATE TABLE product
(product_no CHAR(10) NOT NULL UNIQUE,
product_name CHAR(20) NULL,
price MONEY NULL);
GO
CREATE VIEW product_info
AS SELECT product_no, product_name
FROM product;
GO
GRANT SELECT TO mary;
DENY UPDATE TO mary;

--12.6
USE Hotel;
ALTER SCHEMA dbo TRANSFER my_schema.Статистика;

--12.7
USE Hotel;
CREATE USER peter FOR LOGIN [DESKTOP-1BAV56O\max];
CREATE USER mary FOR LOGIN mary WITH DEFAULT_SCHEMA =
my_schema;


--4.2
-- Создаем схему Test
CREATE SCHEMA Test;
GO

-- Выдаем все права на схему Test пользователю Designer
GRANT CONTROL ON SCHEMA::Test TO Designer;
GO

SELECT * FROM sys.schemas;

--4.3
-- создаем представление на основе таблицы users
 CREATE VIEW Test.view_Статистика AS SELECT * FROM Статистика
 GO

 -- создаем функцию 
 CREATE FUNCTION Test.getStatistic
(
 @roomNum int -- Номер комнаты
)
RETURNS TABLE  
AS
RETURN
(
-- Оператор SELECT, результат которого возвращает функция
 SELECT * from Test.view_Статистика where НомерКомнаты=@roomNum
)
GO

-- Вызов функции 
select * from Test.getStatistic(50)

-- Вызов представления 
select * from Test.view_Статистика

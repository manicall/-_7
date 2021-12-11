--Пример 15.1. Сохранение больших данных вне строки
 USE sample;
 CREATE TABLE mytable
 (col1 VARCHAR(1000),
 col2 VARCHAR(3000),
 col3 VARCHAR(3000),
 col4 VARCHAR(3000));
 INSERT INTO mytable
 SELECT REPLICATE('a', 1000), REPLICATE('b', 3000),
 REPLICATE('c', 3000), REPLICATE('d', 3000); 

 --Пример 15.2. Отображение информации о типе страницы
 USE sample;
 SELECT rows, type_desc AS page_type, total_pages AS pages
 FROM sys.partitions p JOIN sys.allocation_units a ON
 p.partition_id = a.container_id
 WHERE object_id = object_id('mytable'); 

 --Пример 15.3. Использование утилиты bcp
 --bcp AdventureWorks2012.Person.Address out "address.txt" -T -c 
 bcp Hotel.dbo.Статистика out "address.txt" -T -c 

 --Пример 15.4. Выполнение пакета инструкций посредством утилиты sqlcmd
 sqlcmd -S NTB11901 -i C:\ms0510.sql -o C:\ms0510.rpt

 --Пример 15.5. Использование команды exit утилиты sqlcmd
 1>USE sample;
 2>SELECT * FROM project
 3>:EXIT(SELECT @@rowcount)
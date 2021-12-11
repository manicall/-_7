
--Пример 9.1. Выборка идентификатора таблицы, идентификатора пользователя
--и типа таблицы для таблицы Статистика
USE hotel;
 SELECT name, object_id, principal_id, type
 FROM sys.objects
 WHERE name = N'Статистика';

--Пример 9.2. Выборка имен всех таблиц базы данных Hotel,
--которые содержат столбец project_no
USE hotel;
 SELECT sys.objects.name
 FROM sys.objects INNER JOIN sys.columns
 ON sys.objects.object_id = sys.columns.object_id
 WHERE sys.objects.type = 'U'
 AND sys.columns.name = N'НомерКомнаты';

 --Пример 9.3. Определение владельца таблицы employee
 USE hotel;
 SELECT sys.database_principals.name
 FROM sys.database_principals INNER JOIN sys.objects
 ON sys.database_principals.principal_id = sys.objects.schema_id
 WHERE sys.objects.name =  N'Статистика'
 AND sys.objects.type = 'U'; 

 --Пример 9.4. Использование представления sys.dm_db_uncontained_entities
 USE hotel;
 GO
 CREATE PROC TwoSELECTS  
 AS
 SELECT id, ФИО_Клиента from Статистика where id
 BETWEEN 40000 and 41000;
 SELECT is_hidden hidden, column_ordinal ord,
 name, is_nullable nul, system_type_id id
 FROM sys.dm_exec_describe_first_result_set ('TwoSELECTS', NULL, 0);

 --Пример 9.5. Использование системной процедуры sp_configure
USE hotel;
 EXEC sp_configure 'show advanced options', 1;
 RECONFIGURE WITH OVERRIDE;
 EXEC sp_configure 'fill factor', 100;
 RECONFIGURE WITH OVERRIDE; 

 --Пример 9.6. Два разных способа выборки информации
USE hotel;
SELECT object_id
FROM sys.objects
WHERE name =  N'Статистика';
SELECT object_id(N'Статистика');
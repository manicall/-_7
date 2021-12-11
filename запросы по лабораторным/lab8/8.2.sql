 --13.4
 USE Hotel;
 SELECT resource_type, DB_NAME(resource_database_id) as db_name,
 request_session_id, request_mode, request_status
 FROM sys.dm_tran_locks

--13.5
USE Hotel;
BEGIN TRANSACTION
UPDATE Статистика
 SET ДлительностьПроживания = 35
 WHERE idЗаезд = 84100
WAITFOR DELAY '00:00:10'
UPDATE Заезд
 SET Цена_за_проживание = 5000
 WHERE id_Заезд = 83000
COMMIT
 --13.4
 USE Hotel;
 SELECT resource_type, DB_NAME(resource_database_id) as db_name,
 request_session_id, request_mode, request_status
 FROM sys.dm_tran_locks

--13.5
USE Hotel;
BEGIN TRANSACTION
UPDATE ����������
 SET ���������������������� = 35
 WHERE id����� = 84100
WAITFOR DELAY '00:00:10'
UPDATE �����
 SET ����_��_���������� = 5000
 WHERE id_����� = 83000
COMMIT
 --13.2
 BEGIN TRANSACTION;
 INSERT INTO �����(id������,
	������������,
	������������_id_������������,
	����������_id_����������, 
	����)
 VALUES(101, 101, 2, 3, 1500); 
 SAVE TRANSACTION a;
 INSERT INTO �����(id������, 
	������������,
	������������_id_������������,
	����������_id_����������,
	����)
 VALUES(102, 102, 2, 3, 1500); 
 SAVE TRANSACTION b;
 INSERT INTO �����(id������,
	������������,
	������������_id_������������,
	����������_id_����������,
	����)
 VALUES(103, 103, 2, 3, 1500); 
 ROLLBACK TRANSACTION b;
 INSERT INTO �����(id������,
	������������,
	������������_id_������������,
	����������_id_����������,
	����)
 VALUES(104, 104, 2, 3, 1500); 
 ROLLBACK TRANSACTION a;
 COMMIT TRANSACTION;

 select top 5 id������, ������������, ���� from ����� order by 1 desc

 --13.3
 USE Hotel;
 ALTER TABLE ���������� SET (LOCK_ESCALATION = DISABLE);

 --13.4
 USE Hotel;
 SELECT resource_type, DB_NAME(resource_database_id) as db_name,
 request_session_id, request_mode, request_status
 FROM sys.dm_tran_locks

 --13.5
 USE Hotel;
BEGIN TRANSACTION
UPDATE �����
 SET ����������_������� = 3
 WHERE id_����� = 83000
WAITFOR DELAY '00:00:10'
DELETE FROM ����������
 WHERE id����� = 84100
COMMIT 


select top 3 * from �����
where id_����� = 83000
select top 3 * from ����������
where id����� = 84100

 USE master;
backup DATABASE Hotel
to DISK = 'D:\hotelFull.bak'
WITH init;

 USE master;
RESTORE DATABASE Hotel
FROM DISK = 'D:\hotelFull.bak'
WITH REPLACE;

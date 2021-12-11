 --13.2
 BEGIN TRANSACTION;
 INSERT INTO Номер(idНомера,
	НомерКомнаты,
	Комфортность_id_Комфортность,
	Размещение_id_Размещение, 
	Цена)
 VALUES(101, 101, 2, 3, 1500); 
 SAVE TRANSACTION a;
 INSERT INTO Номер(idНомера, 
	НомерКомнаты,
	Комфортность_id_Комфортность,
	Размещение_id_Размещение,
	Цена)
 VALUES(102, 102, 2, 3, 1500); 
 SAVE TRANSACTION b;
 INSERT INTO Номер(idНомера,
	НомерКомнаты,
	Комфортность_id_Комфортность,
	Размещение_id_Размещение,
	Цена)
 VALUES(103, 103, 2, 3, 1500); 
 ROLLBACK TRANSACTION b;
 INSERT INTO Номер(idНомера,
	НомерКомнаты,
	Комфортность_id_Комфортность,
	Размещение_id_Размещение,
	Цена)
 VALUES(104, 104, 2, 3, 1500); 
 ROLLBACK TRANSACTION a;
 COMMIT TRANSACTION;

 select top 5 idНомера, НомерКомнаты, Цена from Номер order by 1 desc

 --13.3
 USE Hotel;
 ALTER TABLE Статистика SET (LOCK_ESCALATION = DISABLE);

 --13.4
 USE Hotel;
 SELECT resource_type, DB_NAME(resource_database_id) as db_name,
 request_session_id, request_mode, request_status
 FROM sys.dm_tran_locks

 --13.5
 USE Hotel;
BEGIN TRANSACTION
UPDATE Заезд
 SET Количество_человек = 3
 WHERE id_Заезд = 83000
WAITFOR DELAY '00:00:10'
DELETE FROM Статистика
 WHERE idЗаезд = 84100
COMMIT 


select top 3 * from Заезд
where id_Заезд = 83000
select top 3 * from Статистика
where idЗаезд = 84100

 USE master;
backup DATABASE Hotel
to DISK = 'D:\hotelFull.bak'
WITH init;

 USE master;
RESTORE DATABASE Hotel
FROM DISK = 'D:\hotelFull.bak'
WITH REPLACE;

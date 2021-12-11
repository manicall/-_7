--1
SELECT name, recovery_model_desc
FROM sys.databases

ALTER DATABASE Hotel
SET RECOVERY FULL;
GO

 BACKUP DATABASE Hotel
 TO DISK = N'D:\hotelFull.bak'
 WITH init;

 --2
 USE Hotel;
 create table users(
	id int not null, 
	userName varchar(20), 
	userPass varchar(20),
	encryptedUserPass varbinary(128))
go

insert into users (id, userName, userPass) values(1, 'Maxim', 'password')
insert into users (id, userName, userPass) values(1, 'Andrey', 'drowssap')

 --3
BACKUP LOG Hotel
TO DISK = N'D:\hotelLog.log'

 --4
 BACKUP DATABASE Hotel
 TO DISK = N'D:\hotelDiff.bak'
 WITH DIFFERENTIAL;

 --5
USE master;
BACKUP DATABASE Hotel
TO DISK = 'D:\hotelDiff.bak'

 --6
 USE master;
RESTORE DATABASE Hotel
FROM DISK = 'D:\hotelFull.bak'
WITH REPLACE, NORECOVERY;

--7
USE master;
RESTORE DATABASE Hotel
FROM DISK = 'D:\hotelLog.log'
WITH file = 5, RECOVERY;



BACKUP DATABASE Hotel
TO DISK = 'T:\oldHotel.bak'

use Hotel
select * from ����������

use Hotel
DELETE FROM ���������� WHERE ���������� < DATEADD(YEAR, -5, GETDATE());
DELETE FROM ���������� WHERE ���������� < DATEADD(MONTH, -2, GETDATE());

use master
RESTORE DATABASE Hotel
FROM DISK = 'T:\oldHotel.bak'
WITH REPLACE;


Use Hotel;
INSERT INTO dbo.����������
VALUES (N'text', N'text', N'text', N'text');  


sp_addmessage @msgnum=51234, @severity=16,
 @msgtext='My Error',
 @lang='us_english', @with_log='true'
 
RAISERROR (51234, 16, -1)


select 
* 
from msdb.dbo.sysschedules

delete from msdb.dbo.sysschedules where schedule_id = 12
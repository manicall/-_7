--declare 
--	@idArrive int, 
--	@fioClient nvarchar(100),
--	@numOfRoom int, 
--	@daysOfLiving int, 
--	@arriveDate smalldatetime,
--	@leaveDate smalldatetime,
--	@sumForLiving money;

INSERT INTO [dbo].[�����������]
           ([���������]
           ,[���_�������]
           ,[������������]
           ,[����������������������]
           ,[����������]
           ,[����������]
           ,[�����������������])
select 
id_�����,  
���_�������,
������������,
dateDiff(DAY, ����_������, ����_������) + 1,
����_������,
����_������,
����_��_����������+����_��_��������������_������
from �����
join ������ on ������_id_������=id_������
join ����� on id������=�����_id������

select * from �����������


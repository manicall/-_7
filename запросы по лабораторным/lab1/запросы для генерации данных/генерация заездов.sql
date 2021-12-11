declare 
	@idWorker int,
	@idRoom int = -1,
	@idClient int,
	@idReservation int = null,
	@priceForLiving money,
	@priceForServices money = 0,
	@fine money = 0,
	@planingLeaveDate smalldatetime,
	@arriveDate smalldatetime,
	@leaveDate smalldatetime,
	@countOfPeople tinyint,
	@countOfChildren tinyint = 0;
	
declare @startDate smalldatetime = '01.01.2000 13:00:00';

declare
	@min int,
	@max int;

declare 
	@day int,
	@hour int,
	@minutes int;


declare
	@start int = 0,
	@end int = 10000;

select top 1 @startDate = ����_������ from ����� order by id_����� desc
set @startDate = dateadd(month, 1, @startDate)

while @start < @end  begin
	-- ������

	if (exists (	
		SELECT TOP 1 * from �����
		where ��������������� = N'����� � ������������'
		ORDER BY NEWID()
	)) begin

	SELECT TOP 1 @idRoom = id������ from �����
	where ��������������� = N'����� � ������������'
	ORDER BY NEWID()
	update ����� set ��������������� = N'���������������' where id������ = @idRoom
	-- ����������
	SELECT TOP 1 @idWorker = id_���������� from ���������� 
	where ��������� = N'�����������' ORDER BY NEWID()

	-- �������
	SELECT TOP 1 @idClient = id_������ from ������ ORDER BY NEWID()

	-- ����_������
	set @min = 1;
	set @max = 28;
	set @day = round((rand() * @max) + @min, 0); 

	set @min = 1;
	set @max = 10 - @min + 1;
	set @hour = round((rand() * @max) + @min, 0); 


	set @arriveDate = @startDate;
	set @arriveDate = dateadd(DAY, @day, @arriveDate)
	set @arriveDate = dateadd(hour, @hour, @arriveDate)

	-- ���������������_����_������
	set @planingLeaveDate = @arriveDate;

	set @min = 1;
	set @max = 28;
	set @day = round((rand() * @max) + @min, 0); 
	set @planingLeaveDate = dateadd(DAY, @day, @arriveDate)
	set @planingLeaveDate = dateadd(hour, -@hour, @planingLeaveDate)

	set @min = 1;
	set @max = 10 - @min + 1;
	set @hour = round((rand() * @max) + @min, 0); 

	set @planingLeaveDate = dateadd(hour, @hour, @planingLeaveDate)

	-- ����_������
	set @LeaveDate = @planingLeaveDate;

	-- ����������_�������
	set @min = 1;
	set @max = 3 - @min;
	set @countOfPeople = round((rand() * @max) + @min, 0);

	--  ���� �� ���������� 
	set @priceForLiving = dateDiff(DAY, @arriveDate, @leaveDate) + 1 -- ���������� �������� ����
	-- ������ ���� �� ����������
	select @priceForLiving *= ���� from �����
	where id������ = @idRoom

	INSERT INTO [dbo].[�����]
	           ([����������_id����������]
	           ,[�����_id������]
	           ,[������_id_������]
	           ,[������������_id������������]
	           ,[����_��_����������]
	           ,[����_��_��������������_������]
	           ,[������_������]
	           ,[���������������_����_������]
	           ,[����_������]
	           ,[����_������]
	           ,[����������_�������]
	           ,[����������_�����])
	     VALUES
	           (@idWorker
	           ,@idRoom
	           ,@idClient
	           ,@idReservation
	           ,@priceForLiving
	           ,@priceForServices
	           ,@fine
	           ,@planingLeaveDate
	           ,@arriveDate
	           ,@LeaveDate
	           ,@countOfPeople
	           ,@countOfChildren)
	end	else begin
		set @startDate = dateadd(month, 1, @startDate)
		update ����� set ��������������� = N'����� � ������������'
		continue
	end
	set @start += 1;
end

select * from �����
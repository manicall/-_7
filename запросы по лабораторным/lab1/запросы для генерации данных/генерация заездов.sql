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

select top 1 @startDate = Дата_заезда from Заезд order by id_Заезд desc
set @startDate = dateadd(month, 1, @startDate)

while @start < @end  begin
	-- номера

	if (exists (	
		SELECT TOP 1 * from Номер
		where СостояниеНомера = N'готов к эксплуатации'
		ORDER BY NEWID()
	)) begin

	SELECT TOP 1 @idRoom = idНомера from Номер
	where СостояниеНомера = N'готов к эксплуатации'
	ORDER BY NEWID()
	update Номер set СостояниеНомера = N'эксплуатируется' where idНомера = @idRoom
	-- сотрудники
	SELECT TOP 1 @idWorker = id_Сотрудники from Сотрудники 
	where Должность = N'Регистратор' ORDER BY NEWID()

	-- клиенты
	SELECT TOP 1 @idClient = id_Клиент from Клиент ORDER BY NEWID()

	-- Дата_заезда
	set @min = 1;
	set @max = 28;
	set @day = round((rand() * @max) + @min, 0); 

	set @min = 1;
	set @max = 10 - @min + 1;
	set @hour = round((rand() * @max) + @min, 0); 


	set @arriveDate = @startDate;
	set @arriveDate = dateadd(DAY, @day, @arriveDate)
	set @arriveDate = dateadd(hour, @hour, @arriveDate)

	-- Запланированная_дата_выезда
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

	-- Дата_выезда
	set @LeaveDate = @planingLeaveDate;

	-- Количество_человек
	set @min = 1;
	set @max = 3 - @min;
	set @countOfPeople = round((rand() * @max) + @min, 0);

	--  цена за проживание 
	set @priceForLiving = dateDiff(DAY, @arriveDate, @leaveDate) + 1 -- количество прожитых дней
	-- расчет цены за проживание
	select @priceForLiving *= Цена from Номер
	where idНомера = @idRoom

	INSERT INTO [dbo].[Заезд]
	           ([Сотрудники_idСотрудники]
	           ,[Номер_idНомера]
	           ,[Клиент_id_Клиент]
	           ,[Бронирование_idБронирование]
	           ,[Цена_за_проживание]
	           ,[Цена_за_дополнительные_услуги]
	           ,[Размер_штрафа]
	           ,[Запланированная_дата_выезда]
	           ,[Дата_заезда]
	           ,[Дата_выезда]
	           ,[Количество_человек]
	           ,[Количество_детей])
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
		update Номер set СостояниеНомера = N'готов к эксплуатации'
		continue
	end
	set @start += 1;
end

select * from Заезд
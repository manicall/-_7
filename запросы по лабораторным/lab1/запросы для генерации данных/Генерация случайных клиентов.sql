declare 
	@passport char(10),
	@FIO nvarchar(100),
	@birthday date = '01.01.1970',
	@phone char(10),
	@randomNum bigint;


declare
	@start int = 0,
	@end int = 1000;

while @start < @end  begin

-- паспорт
declare
	@min bigint = 1000000000,
	@max bigint = 9999999999;
set @max -= @min;
set	@max += 1;

set @randomNum = round((rand() * @max) + @min, 0); 
set @passport = @randomNum;

-- имена
SELECT TOP 1 @FIO = ФИО from Table_1 ORDER BY NEWID()	

-- дата рождения 
set @birthday = DATEADD(DAY, 1, @birthday) --Увеличиваем значение даты на 1 день

-- телефон
set @min = 9087654321;
set @max = 9999999999;
set @max -= @min;
set	@max += 1;
set @randomNum = round((rand() * @max) + @min, 0); 
set @phone = @randomNum;


INSERT INTO [dbo].[Клиент]
           ([Номер_и_серия_паспорта]
           ,[ФИО_клиента]
           ,[Дата_рождения]
           ,[Номер_телефона])
     VALUES
           (@passport
           ,@FIO
           ,@birthday
           ,@phone)

set @start+=1;
end

select * from Клиент
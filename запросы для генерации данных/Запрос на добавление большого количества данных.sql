--declare 
--	@idArrive int, 
--	@fioClient nvarchar(100),
--	@numOfRoom int, 
--	@daysOfLiving int, 
--	@arriveDate smalldatetime,
--	@leaveDate smalldatetime,
--	@sumForLiving money;

INSERT INTO [dbo].[МногоДанных]
           ([КодЗаезда]
           ,[ФИО_Клиента]
           ,[НомерКомнаты]
           ,[ДлительностьПроживания]
           ,[ДатаЗаезда]
           ,[ДатаВыезда]
           ,[СуммаЗаПроживание])
select 
id_Заезд,  
ФИО_клиента,
НомерКомнаты,
dateDiff(DAY, Дата_заезда, Дата_выезда) + 1,
Дата_заезда,
Дата_выезда,
Цена_за_проживание+Цена_за_дополнительные_услуги
from Заезд
join Клиент on Клиент_id_Клиент=id_Клиент
join Номер on idНомера=Номер_idНомера

select * from МногоДанных


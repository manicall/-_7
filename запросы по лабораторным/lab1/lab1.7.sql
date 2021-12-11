set statistics time on
--14
SET SHOWPLAN_TEXT ON;
go 

SELECT * FROM Статистика
WITH (INDEX(PK_Статистика))
WHERE id = 40010;

go 
SET SHOWPLAN_TEXT OFF;

--15
SET SHOWPLAN_TEXT ON;
go

SELECT * FROM Статистика 
WITH (INDEX(0))
WHERE id = 40010;

go 
SET SHOWPLAN_TEXT OFF;

--16
SET SHOWPLAN_TEXT ON;
go

SELECT * FROM Заезд
JOIN Статистика ON Заезд.id_Заезд = Статистика.idЗаезд 
JOIN Номер on idНомера = Номер_idНомера
JOIN Размещение on id_Размещение = Размещение_id_Размещение
OPTION(FORCE ORDER);

go
SET SHOWPLAN_TEXT OFF;

--17
SET SHOWPLAN_TEXT ON;
go

SELECT * FROM Заезд
JOIN Статистика ON Заезд.id_Заезд = Статистика.idЗаезд 
OPTION(MERGE JOIN);

go
SET SHOWPLAN_TEXT OFF;

--18
SET SHOWPLAN_TEXT ON;
go

SELECT * FROM Заезд
INNER MERGE JOIN Статистика ON Заезд.id_Заезд = Статистика.idЗаезд 

go
SET SHOWPLAN_TEXT OFF;

--19
DECLARE @cost int SET @cost = 3 
SELECT * FROM Статистика WHERE ДлительностьПроживания = @cost 
OPTION (OPTIMIZE FOR (@cost = 6));

--20
SET SHOWPLAN_TEXT ON;
go
SELECT * FROM Заезд JOIN Статистика ON Заезд.id_Заезд = Статистика.idЗаезд
go
SET SHOWPLAN_TEXT OFF;
go
sp_create_plan_guide @name = N'Example_19_15',
@stmt = N'SELECT * FROM Заезд JOIN Статистика ON Заезд.id_Заезд = Статистика.idЗаезд', 
@type = N'SQL',
@module_or_batch = NULL,
@params = NULL, 
@hints = N'OPTION (MERGE JOIN)'
go
SET SHOWPLAN_TEXT ON;
go
SELECT * FROM Заезд JOIN Статистика ON Заезд.id_Заезд = Статистика.idЗаезд
go
SET SHOWPLAN_TEXT OFF;
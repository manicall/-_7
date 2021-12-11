set statistics time on 
SET SHOWPLAN_TEXT ON;
go

SELECT * FROM Заезд
JOIN Статистика ON Заезд.id_Заезд = Статистика.idЗаезд 
WHERE idЗаезд =  82082

go
SET SHOWPLAN_TEXT OFF;

SET SHOWPLAN_TEXT ON;
go

SELECT * FROM Заезд
JOIN Статистика ON Заезд.id_Заезд = Статистика.idЗаезд 

go
SET SHOWPLAN_TEXT OFF;

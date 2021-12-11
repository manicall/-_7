GO  
-- 1) Отображение текстового плана запроса посредством опции SHOWPLAN_TEXT
SET SHOWPLAN_TEXT ON;
GO

SELECT * FROM Заезд
JOIN Статистика ON Заезд.id_Заезд = Статистика.idЗаезд and Заезд.id_Заезд = 90000

GO
SET SHOWPLAN_TEXT OFF; 
GO

-- 2) Отображение плана выполнения посредством опции SHOWPLAN_XML
SET SHOWPLAN_XML ON; 
GO

SELECT * FROM Заезд
JOIN Статистика ON Заезд.id_Заезд = Статистика.idЗаезд and Заезд.id_Заезд = 90000

GO
SET SHOWPLAN_XML OFF; 
GO

-- 3) Использование опции STATISTICS PROFILE в инструкции SET
SET STATISTICS PROFILE ON;
GO

SELECT * FROM Заезд
JOIN Статистика ON Заезд.id_Заезд = Статистика.idЗаезд and Заезд.id_Заезд = 90000

GO
SET STATISTICS PROFILE OFF; 

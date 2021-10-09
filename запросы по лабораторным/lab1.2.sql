GO  
-- 1) Отображение текстового плана запроса посредством опции SHOWPLAN_TEXT
SET SHOWPLAN_TEXT ON;
GO

SELECT * FROM Заезд join клиент
ON Заезд.Клиент_id_Клиент = Клиент.id_Клиент and Заезд.id_Заезд = 82087

GO
SET SHOWPLAN_TEXT OFF; 
GO

-- 2) Отображение плана выполнения посредством опции SHOWPLAN_XML
SET SHOWPLAN_XML ON; 
GO

SELECT * FROM Заезд join клиент
ON Заезд.Клиент_id_Клиент = Клиент.id_Клиент and Заезд.id_Заезд = 82087

GO
SET SHOWPLAN_XML OFF; 
GO

-- 3) Использование опции STATISTICS PROFILE в инструкции SET
SET STATISTICS PROFILE ON;
GO

SELECT * FROM Заезд join клиент
ON Заезд.Клиент_id_Клиент = Клиент.id_Клиент and Заезд.id_Заезд = 82087

GO
SET STATISTICS PROFILE OFF; 

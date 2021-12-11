--1
USE Hotel;
GO
CREATE VIEW v_duration
	AS SELECT ФИО_Клиента, НомерКомнаты, ДлительностьПроживания
	FROM Статистика
	WHERE СуммаЗаПроживание < 50000;

--2
USE Hotel;
GO
CREATE VIEW v_last_three_columns
	AS SELECT ДатаЗаезда, ДатаВыезда, СуммаЗаПроживание
	FROM Статистика; 

--3
USE Hotel;
GO
CREATE VIEW v_count(ФИО_Клиента, Количество)
	AS SELECT ФИО_Клиента, COUNT(*)
	FROM Статистика
	GROUP BY ФИО_Клиента; 

--4
USE Hotel;
GO
CREATE VIEW v_count1
	AS SELECT ФИО_Клиента, COUNT(*) Количество
	FROM Статистика
	GROUP BY ФИО_Клиента; 

 --5
USE Hotel;
GO
CREATE VIEW v_duration_room60
	AS SELECT ФИО_Клиента
	FROM v_duration
	WHERE НомерКомнаты = 60; 

--6
USE Hotel;
GO
ALTER VIEW v_last_three_columns
	AS SELECT ДатаЗаезда, ДатаВыезда, СуммаЗаПроживание
	FROM Статистика
	WHERE СуммаЗаПроживание >= 50000; 

--7
USE Hotel;
 GO
 DROP VIEW v_count; 

--8
 USE Hotel;
 GO
 DROP VIEW v_duration; 

--9
 USE Hotel;
 GO
 CREATE VIEW v_d2 
 AS SELECT ФИО_Клиента, НомерКомнаты
 FROM Статистика
 WHERE НомерКомнаты = 10;
 GO
 SELECT ФИО_Клиента
 FROM v_d2
 WHERE ФИО_Клиента LIKE N'Ф%'; 


--10
 USE Hotel;
 GO
 CREATE VIEW v_room
 AS SELECT idНомера, НомерКомнаты, Цена
 FROM Номер;
 GO
 INSERT INTO v_room
 VALUES(101, 101, 1500); 

--11
 USE Hotel;
 GO
 CREATE VIEW v_40_60_check
 AS SELECT idНомера, НомерКомнаты, Цена
 FROM Номер
 WHERE НомерКомнаты BETWEEN 40 AND 60
 WITH CHECK OPTION;
 GO
 INSERT INTO v_40_60_check
 VALUES (102, 102, 1500); 

--12
USE Hotel;
 GO
 CREATE VIEW v_40_60_nocheck
 AS SELECT idНомера, НомерКомнаты, Цена
 FROM Номер
 WHERE НомерКомнаты BETWEEN 40 AND 60
 GO 
 INSERT INTO v_40_60_nocheck
 VALUES (102, 102, 1500); 

--13
 USE Hotel;
 GO
 CREATE VIEW v_sum(Сумма)
 AS SELECT SUM(СуммаЗаПроживание)
 FROM Статистика;
 GO
 SELECT *
 FROM v_sum;

--14
 USE Hotel;
 GO
 CREATE VIEW v_p1
 AS SELECT ФИО_Клиента, НомерКомнаты, ДлительностьПроживания
 FROM Статистика
 WHERE НомерКомнаты = 10;
 GO
 UPDATE v_p1
 SET ДлительностьПроживания = 35 
 WHERE ДлительностьПроживания = 26;

--15
USE Hotel;
 GO
 CREATE VIEW v_100000
 AS SELECT ФИО_Клиента, НомерКомнаты, СуммаЗаПроживание
 FROM Статистика
 WHERE СуммаЗаПроживание > 100000
 WITH CHECK OPTION;
 GO 
 UPDATE v_100000
 SET СуммаЗаПроживание = 93000
 WHERE НомерКомнаты = 18; 

--16
 USE Hotel;
 GO
 CREATE VIEW v_us_dollars (ФИО_Клиента, НомерКомнаты, [Сумма в долларах])
 AS SELECT ФИО_Клиента, НомерКомнаты, СуммаЗаПроживание*0.014
 FROM Статистика
 WHERE СуммаЗаПроживание > 100000;
 GO
 SELECT *
 FROM v_us_dollars; 

--17
 USE Hotel;
 GO
 CREATE VIEW v_project_p1
 AS SELECT ФИО_Клиента, НомерКомнаты, ДлительностьПроживания
 FROM Статистика
 WHERE ДлительностьПроживания = 35;
 GO
 DELETE FROM v_project_p1
 WHERE НомерКомнаты = 10; 

--18
USE Hotel;
 GO
 CREATE VIEW v_budget ([Понижение суммы])
 AS SELECT СуммаЗаПроживание*0.9
 FROM Статистика;
 GO
 DELETE FROM v_budget; 

--19
 USE Hotel;
 GO
 CREATE VIEW v_enter_date
 WITH SCHEMABINDING
 AS SELECT ФИО_Клиента, НомерКомнаты, ДатаЗаезда
 FROM dbo.Статистика; 


--20
 USE Hotel;
 GO
 CREATE UNIQUE CLUSTERED INDEX
 IX_date ON v_enter_date (ФИО_Клиента, НомерКомнаты, ДатаЗаезда); 

--21
USE Hotel;
 SELECT objectproperty(object_id('v_enter_date'), 'IsIndexable'); 

--22
SELECT sessionproperty ('QUOTED_IDENTIFIER');

--23
 USE Hotel;
 SELECT quoted_identifier, concat_null_yields_null, ansi_nulls,
 ansi_padding 
 FROM sys.dm_exec_sessions
 WHERE session_id = @@spid; 

--24
USE Hotel;
 EXEC sp_spaceused 'v_enter_date'; 

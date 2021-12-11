set statistics time on
--14
SET SHOWPLAN_TEXT ON;
go 

SELECT * FROM ����������
WITH (INDEX(PK_����������))
WHERE id = 40010;

go 
SET SHOWPLAN_TEXT OFF;

--15
SET SHOWPLAN_TEXT ON;
go

SELECT * FROM ���������� 
WITH (INDEX(0))
WHERE id = 40010;

go 
SET SHOWPLAN_TEXT OFF;

--16
SET SHOWPLAN_TEXT ON;
go

SELECT * FROM �����
JOIN ���������� ON �����.id_����� = ����������.id����� 
JOIN ����� on id������ = �����_id������
JOIN ���������� on id_���������� = ����������_id_����������
OPTION(FORCE ORDER);

go
SET SHOWPLAN_TEXT OFF;

--17
SET SHOWPLAN_TEXT ON;
go

SELECT * FROM �����
JOIN ���������� ON �����.id_����� = ����������.id����� 
OPTION(MERGE JOIN);

go
SET SHOWPLAN_TEXT OFF;

--18
SET SHOWPLAN_TEXT ON;
go

SELECT * FROM �����
INNER MERGE JOIN ���������� ON �����.id_����� = ����������.id����� 

go
SET SHOWPLAN_TEXT OFF;

--19
DECLARE @cost int SET @cost = 3 
SELECT * FROM ���������� WHERE ���������������������� = @cost 
OPTION (OPTIMIZE FOR (@cost = 6));

--20
SET SHOWPLAN_TEXT ON;
go
SELECT * FROM ����� JOIN ���������� ON �����.id_����� = ����������.id�����
go
SET SHOWPLAN_TEXT OFF;
go
sp_create_plan_guide @name = N'Example_19_15',
@stmt = N'SELECT * FROM ����� JOIN ���������� ON �����.id_����� = ����������.id�����', 
@type = N'SQL',
@module_or_batch = NULL,
@params = NULL, 
@hints = N'OPTION (MERGE JOIN)'
go
SET SHOWPLAN_TEXT ON;
go
SELECT * FROM ����� JOIN ���������� ON �����.id_����� = ����������.id�����
go
SET SHOWPLAN_TEXT OFF;
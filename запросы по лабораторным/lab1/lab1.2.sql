GO  
-- 1) ����������� ���������� ����� ������� ����������� ����� SHOWPLAN_TEXT
SET SHOWPLAN_TEXT ON;
GO

SELECT * FROM �����
JOIN ���������� ON �����.id_����� = ����������.id����� and �����.id_����� = 90000

GO
SET SHOWPLAN_TEXT OFF; 
GO

-- 2) ����������� ����� ���������� ����������� ����� SHOWPLAN_XML
SET SHOWPLAN_XML ON; 
GO

SELECT * FROM �����
JOIN ���������� ON �����.id_����� = ����������.id����� and �����.id_����� = 90000

GO
SET SHOWPLAN_XML OFF; 
GO

-- 3) ������������� ����� STATISTICS PROFILE � ���������� SET
SET STATISTICS PROFILE ON;
GO

SELECT * FROM �����
JOIN ���������� ON �����.id_����� = ����������.id����� and �����.id_����� = 90000

GO
SET STATISTICS PROFILE OFF; 

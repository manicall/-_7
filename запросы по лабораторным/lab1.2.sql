GO  
-- 1) ����������� ���������� ����� ������� ����������� ����� SHOWPLAN_TEXT
SET SHOWPLAN_TEXT ON;
GO

SELECT * FROM ����� join ������
ON �����.������_id_������ = ������.id_������ and �����.id_����� = 82087

GO
SET SHOWPLAN_TEXT OFF; 
GO

-- 2) ����������� ����� ���������� ����������� ����� SHOWPLAN_XML
SET SHOWPLAN_XML ON; 
GO

SELECT * FROM ����� join ������
ON �����.������_id_������ = ������.id_������ and �����.id_����� = 82087

GO
SET SHOWPLAN_XML OFF; 
GO

-- 3) ������������� ����� STATISTICS PROFILE � ���������� SET
SET STATISTICS PROFILE ON;
GO

SELECT * FROM ����� join ������
ON �����.������_id_������ = ������.id_������ and �����.id_����� = 82087

GO
SET STATISTICS PROFILE OFF; 


--������ 9.1. ������� �������������� �������, �������������� ������������
--� ���� ������� ��� ������� ����������
USE hotel;
 SELECT name, object_id, principal_id, type
 FROM sys.objects
 WHERE name = N'����������';

--������ 9.2. ������� ���� ���� ������ ���� ������ Hotel,
--������� �������� ������� project_no
USE hotel;
 SELECT sys.objects.name
 FROM sys.objects INNER JOIN sys.columns
 ON sys.objects.object_id = sys.columns.object_id
 WHERE sys.objects.type = 'U'
 AND sys.columns.name = N'������������';

 --������ 9.3. ����������� ��������� ������� employee
 USE hotel;
 SELECT sys.database_principals.name
 FROM sys.database_principals INNER JOIN sys.objects
 ON sys.database_principals.principal_id = sys.objects.schema_id
 WHERE sys.objects.name =  N'����������'
 AND sys.objects.type = 'U'; 

 --������ 9.4. ������������� ������������� sys.dm_db_uncontained_entities
 USE hotel;
 GO
 CREATE PROC TwoSELECTS  
 AS
 SELECT id, ���_������� from ���������� where id
 BETWEEN 40000 and 41000;
 SELECT is_hidden hidden, column_ordinal ord,
 name, is_nullable nul, system_type_id id
 FROM sys.dm_exec_describe_first_result_set ('TwoSELECTS', NULL, 0);

 --������ 9.5. ������������� ��������� ��������� sp_configure
USE hotel;
 EXEC sp_configure 'show advanced options', 1;
 RECONFIGURE WITH OVERRIDE;
 EXEC sp_configure 'fill factor', 100;
 RECONFIGURE WITH OVERRIDE; 

 --������ 9.6. ��� ������ ������� ������� ����������
USE hotel;
SELECT object_id
FROM sys.objects
WHERE name =  N'����������';
SELECT object_id(N'����������');
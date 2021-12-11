--1
USE Hotel;
GO
CREATE VIEW v_duration
	AS SELECT ���_�������, ������������, ����������������������
	FROM ����������
	WHERE ����������������� < 50000;

--2
USE Hotel;
GO
CREATE VIEW v_last_three_columns
	AS SELECT ����������, ����������, �����������������
	FROM ����������; 

--3
USE Hotel;
GO
CREATE VIEW v_count(���_�������, ����������)
	AS SELECT ���_�������, COUNT(*)
	FROM ����������
	GROUP BY ���_�������; 

--4
USE Hotel;
GO
CREATE VIEW v_count1
	AS SELECT ���_�������, COUNT(*) ����������
	FROM ����������
	GROUP BY ���_�������; 

 --5
USE Hotel;
GO
CREATE VIEW v_duration_room60
	AS SELECT ���_�������
	FROM v_duration
	WHERE ������������ = 60; 

--6
USE Hotel;
GO
ALTER VIEW v_last_three_columns
	AS SELECT ����������, ����������, �����������������
	FROM ����������
	WHERE ����������������� >= 50000; 

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
 AS SELECT ���_�������, ������������
 FROM ����������
 WHERE ������������ = 10;
 GO
 SELECT ���_�������
 FROM v_d2
 WHERE ���_������� LIKE N'�%'; 


--10
 USE Hotel;
 GO
 CREATE VIEW v_room
 AS SELECT id������, ������������, ����
 FROM �����;
 GO
 INSERT INTO v_room
 VALUES(101, 101, 1500); 

--11
 USE Hotel;
 GO
 CREATE VIEW v_40_60_check
 AS SELECT id������, ������������, ����
 FROM �����
 WHERE ������������ BETWEEN 40 AND 60
 WITH CHECK OPTION;
 GO
 INSERT INTO v_40_60_check
 VALUES (102, 102, 1500); 

--12
USE Hotel;
 GO
 CREATE VIEW v_40_60_nocheck
 AS SELECT id������, ������������, ����
 FROM �����
 WHERE ������������ BETWEEN 40 AND 60
 GO 
 INSERT INTO v_40_60_nocheck
 VALUES (102, 102, 1500); 

--13
 USE Hotel;
 GO
 CREATE VIEW v_sum(�����)
 AS SELECT SUM(�����������������)
 FROM ����������;
 GO
 SELECT *
 FROM v_sum;

--14
 USE Hotel;
 GO
 CREATE VIEW v_p1
 AS SELECT ���_�������, ������������, ����������������������
 FROM ����������
 WHERE ������������ = 10;
 GO
 UPDATE v_p1
 SET ���������������������� = 35 
 WHERE ���������������������� = 26;

--15
USE Hotel;
 GO
 CREATE VIEW v_100000
 AS SELECT ���_�������, ������������, �����������������
 FROM ����������
 WHERE ����������������� > 100000
 WITH CHECK OPTION;
 GO 
 UPDATE v_100000
 SET ����������������� = 93000
 WHERE ������������ = 18; 

--16
 USE Hotel;
 GO
 CREATE VIEW v_us_dollars (���_�������, ������������, [����� � ��������])
 AS SELECT ���_�������, ������������, �����������������*0.014
 FROM ����������
 WHERE ����������������� > 100000;
 GO
 SELECT *
 FROM v_us_dollars; 

--17
 USE Hotel;
 GO
 CREATE VIEW v_project_p1
 AS SELECT ���_�������, ������������, ����������������������
 FROM ����������
 WHERE ���������������������� = 35;
 GO
 DELETE FROM v_project_p1
 WHERE ������������ = 10; 

--18
USE Hotel;
 GO
 CREATE VIEW v_budget ([��������� �����])
 AS SELECT �����������������*0.9
 FROM ����������;
 GO
 DELETE FROM v_budget; 

--19
 USE Hotel;
 GO
 CREATE VIEW v_enter_date
 WITH SCHEMABINDING
 AS SELECT ���_�������, ������������, ����������
 FROM dbo.����������; 


--20
 USE Hotel;
 GO
 CREATE UNIQUE CLUSTERED INDEX
 IX_date ON v_enter_date (���_�������, ������������, ����������); 

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

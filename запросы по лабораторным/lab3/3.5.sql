--12.11
USE Hotel;
 GRANT CREATE TABLE, CREATE PROCEDURE
 TO peter, mary;

--12.12
 USE Hotel;
 GRANT CREATE FUNCTION
 TO mary; 

--12.13
USE Hotel;
 GRANT SELECT ON ����������
 TO peter, mary;

--12.14
USE Hotel;
 GRANT UPDATE ON ���������� (����������������������, �����������������)
 TO peter;

--12.15
USE Hotel;
 GRANT VIEW DEFINITION ON OBJECT::���������� TO peter;
 GRANT VIEW DEFINITION ON SCHEMA::dbo TO peter;

--12.16
USE Hotel;
 GRANT CONTROL ON DATABASE::Hotel TO peter;

--12.17
USE Hotel;
 GRANT SELECT ON ���������� TO mary
 WITH GRANT OPTION;

--12.18
USE Hotel;
 DENY CREATE TABLE, CREATE PROCEDURE
 TO peter;

--12.19
USE Hotel;
 GRANT SELECT ON ����������
 TO PUBLIC;
 DENY SELECT ON ����������
 TO peter, mary;

--12.20
USE Hotel;
 REVOKE SELECT ON ���������� FROM public;


--=================================================
--=================================================


-- ����� ������� ���������� (���������)
-- ��������� ������������� ������ �� ������� ����������
USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON ����������
TO FirstModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON ��������������_������
TO FirstModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON �����
TO FirstModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON ����������
TO FirstModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON ������������
TO FirstModerator;


USE Hotel;
GRANT SELECT ON ������������
TO FirstModerator;

USE Hotel;
GRANT SELECT ON �����
TO FirstModerator;

USE Hotel;
GRANT SELECT ON ������
TO FirstModerator;

USE Hotel;
GRANT SELECT ON �����������_���������������_��������
TO FirstModerator;

USE Hotel;
GRANT SELECT ON �������_�������
TO FirstModerator;



-- ����� ������� ���������� (�����������)
USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON ������������
TO SecondModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON �����
TO SecondModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON ������
TO SecondModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON �����������_���������������_��������
TO SecondModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON �������_�������
TO SecondModerator;


USE Hotel;
GRANT SELECT ON ��������������_������
TO SecondModerator;

USE Hotel;
GRANT SELECT ON �����
TO SecondModerator;

USE Hotel;
GRANT SELECT ON ����������
TO SecondModerator;

USE Hotel;
GRANT SELECT ON ������������
TO SecondModerator;

USE Hotel;
GRANT SELECT ON ����������
TO SecondModerator;

--=================================================
--=================================================


-- ����� �������
USE Hotel;
GRANT SELECT ON dbo.����� TO Client;
GRANT SELECT ON dbo.��������������_������ TO Client;


-- ������������� ��� ������� ����������
USE Hotel;
GRANT SELECT ON dbo.View_Arrival TO FirstModerator;
GRANT SELECT ON dbo.View_ClientChild TO FirstModerator;
GRANT SELECT ON dbo.View_Reservation TO FirstModerator;
GRANT SELECT ON dbo.View_Room TO FirstModerator;
GRANT SELECT ON dbo.View_UsageService TO FirstModerator;

 -- ������������� ��� ������� ����������
USE Hotel;
GRANT SELECT ON dbo.View_Arrival TO SecondModerator;
GRANT SELECT ON dbo.View_ClientChild TO SecondModerator;
GRANT SELECT ON dbo.View_Reservation TO SecondModerator;
GRANT SELECT ON dbo.View_Room TO SecondModerator;
GRANT SELECT ON dbo.View_UsageService TO SecondModerator;

-- ������������� ��� �������
USE Hotel;
GRANT SELECT ON dbo.View_Room TO Client;

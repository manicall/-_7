-- �������� ������
use Hotel
CREATE LOGIN SystemAdmin   
    WITH PASSWORD = '123';  
GO  
-- �������� ������������ �� �� ������
CREATE USER SystemAdmin FOR LOGIN SystemAdmin;  
GO  

-- �������� ������
CREATE LOGIN Designer  
    WITH PASSWORD = '123';  
GO  
-- �������� ������������ �� �� ������
CREATE USER Designer FOR LOGIN Designer;  
GO  

-- �������� ������
CREATE LOGIN Developer   
    WITH PASSWORD = '123';  
GO  
-- �������� ������������ �� �� ������
CREATE USER Developer FOR LOGIN Developer;  
GO  

-- �������� ������
CREATE LOGIN FirstModerator   
    WITH PASSWORD = '123';  
GO  
-- �������� ������������ �� �� ������
CREATE USER FirstModerator FOR LOGIN FirstModerator;  
GO  

-- �������� ������
CREATE LOGIN SecondModerator   
    WITH PASSWORD = '123';  
GO  
-- �������� ������������ �� �� ������
CREATE USER SecondModerator FOR LOGIN SecondModerator;  
GO  

-- �������� ������
CREATE LOGIN Client   
    WITH PASSWORD = '123';  
GO  
-- �������� ������������ �� �� ������
CREATE USER Client FOR LOGIN Client;  
GO

--========================================================================
--========================================================================

--12.3
USE Hotel;
CREATE LOGIN mary WITH PASSWORD = '123'; 
select * from sys.server_principals 

--12.4
USE Hotel;
CREATE LOGIN [DESKTOP-1BAV56O\max] FROM WINDOWS; 
select*from sys.server_principals

--12.8
USE Hotel;
 CREATE APPLICATION ROLE weekly_reports
 WITH PASSWORD ='123',
 DEFAULT_SCHEMA = my_schema;

--12.9
USE Hotel;
 GO
 CREATE SERVER ROLE programadmin;
 ALTER SERVER ROLE programadmin ADD MEMBER mary;

--12.10
USE Hotel;
 CREATE ROLE marketing AUTHORIZATION peter;
 GO
 ALTER ROLE marketing ADD MEMBER peter;
 ALTER ROLE marketing ADD MEMBER mary;


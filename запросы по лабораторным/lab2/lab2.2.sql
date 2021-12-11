--������ 15.1. ���������� ������� ������ ��� ������
 USE sample;
 CREATE TABLE mytable
 (col1 VARCHAR(1000),
 col2 VARCHAR(3000),
 col3 VARCHAR(3000),
 col4 VARCHAR(3000));
 INSERT INTO mytable
 SELECT REPLICATE('a', 1000), REPLICATE('b', 3000),
 REPLICATE('c', 3000), REPLICATE('d', 3000); 

 --������ 15.2. ����������� ���������� � ���� ��������
 USE sample;
 SELECT rows, type_desc AS page_type, total_pages AS pages
 FROM sys.partitions p JOIN sys.allocation_units a ON
 p.partition_id = a.container_id
 WHERE object_id = object_id('mytable'); 

 --������ 15.3. ������������� ������� bcp
 --bcp AdventureWorks2012.Person.Address out "address.txt" -T -c 
 bcp Hotel.dbo.���������� out "address.txt" -T -c 

 --������ 15.4. ���������� ������ ���������� ����������� ������� sqlcmd
 sqlcmd -S NTB11901 -i C:\ms0510.sql -o C:\ms0510.rpt

 --������ 15.5. ������������� ������� exit ������� sqlcmd
 1>USE sample;
 2>SELECT * FROM project
 3>:EXIT(SELECT @@rowcount)
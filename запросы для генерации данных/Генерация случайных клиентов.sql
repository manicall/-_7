declare 
	@passport char(10),
	@FIO nvarchar(100),
	@birthday date = '01.01.1970',
	@phone char(10),
	@randomNum bigint;


declare
	@start int = 0,
	@end int = 1000;

while @start < @end  begin

-- �������
declare
	@min bigint = 1000000000,
	@max bigint = 9999999999;
set @max -= @min;
set	@max += 1;

set @randomNum = round((rand() * @max) + @min, 0); 
set @passport = @randomNum;

-- �����
SELECT TOP 1 @FIO = ��� from Table_1 ORDER BY NEWID()	

-- ���� �������� 
set @birthday = DATEADD(DAY, 1, @birthday) --����������� �������� ���� �� 1 ����

-- �������
set @min = 9087654321;
set @max = 9999999999;
set @max -= @min;
set	@max += 1;
set @randomNum = round((rand() * @max) + @min, 0); 
set @phone = @randomNum;


INSERT INTO [dbo].[������]
           ([�����_�_�����_��������]
           ,[���_�������]
           ,[����_��������]
           ,[�����_��������])
     VALUES
           (@passport
           ,@FIO
           ,@birthday
           ,@phone)

set @start+=1;
end

select * from ������
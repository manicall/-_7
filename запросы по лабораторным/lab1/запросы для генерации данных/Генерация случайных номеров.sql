
declare
	@numOfRoom int = 1,
	@idComford int,
	@idPlacement int,
	@price money,
	@statement nvarchar(25);

declare
	@min int = 1000,
	@max int = 10000;
set @max -= @min;
set	@max += 1;



--declare @adultsCapacity tinyint,
--		@placement nvarchar(50);

--SELECT @placement=����������.��������
--FROM Hotel.dbo.�����
--join ���������� on ����������.id_���������� = �����.����������_id_����������
--where id������=@idRoom	

--if (@placement like N'�����������%')
--	set @adultsCapacity = 1;
--else if (@placement like N'�����������%')
--	set @adultsCapacity = 2;
--else if (@placement like '�����������%')
--	set @adultsCapacity = 3;

--print @placement
--print @adultsCapacity

declare
	@start int = 0,
	@end int = 100;

while @start < @end  begin
	select top 1 @numOfRoom = [������������] + 1 from ����� order by ������������ desc
	SELECT TOP 1 @idComford = id_������������ from ������������ ORDER BY NEWID()	
	SELECT TOP 1 @idPlacement = id_���������� from ���������� ORDER BY NEWID()	
	-- ��������� ���������� ����� �� 1000 �� 10000 � ����� ������ �� �����
	set @price = round((rand() * @max) + @min, -2); 
	set @statement = N'����� � ������������'

	INSERT INTO [dbo].[�����]
		([������������]
		,[������������_id_������������]
		,[����������_id_����������]
		,[����]
		,[���������������])
	VALUES
		(@numOfRoom
		,@idComford
		,@idPlacement
		,@price
		,@statement)

	set @start+=1;
end


select * from �����
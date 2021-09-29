
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

--SELECT @placement=Размещение.Название
--FROM Hotel.dbo.Номер
--join Размещение on Размещение.id_Размещение = Номер.Размещение_id_Размещение
--where idНомера=@idRoom	

--if (@placement like N'Одноместный%')
--	set @adultsCapacity = 1;
--else if (@placement like N'Двухместный%')
--	set @adultsCapacity = 2;
--else if (@placement like 'Трехместный%')
--	set @adultsCapacity = 3;

--print @placement
--print @adultsCapacity

declare
	@start int = 0,
	@end int = 100;

while @start < @end  begin
	select top 1 @numOfRoom = [НомерКомнаты] + 1 from Номер order by НомерКомнаты desc
	SELECT TOP 1 @idComford = id_Комфортность from Комфортность ORDER BY NEWID()	
	SELECT TOP 1 @idPlacement = id_Размещение from Размещение ORDER BY NEWID()	
	-- установка случайного числа от 1000 до 10000 с двумя нулями на конце
	set @price = round((rand() * @max) + @min, -2); 
	set @statement = N'готов к эксплуатации'

	INSERT INTO [dbo].[Номер]
		([НомерКомнаты]
		,[Комфортность_id_Комфортность]
		,[Размещение_id_Размещение]
		,[Цена]
		,[СостояниеНомера])
	VALUES
		(@numOfRoom
		,@idComford
		,@idPlacement
		,@price
		,@statement)

	set @start+=1;
end


select * from Номер
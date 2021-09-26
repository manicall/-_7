USE [Hotel]
GO

declare
 @i int = 1,
 @j int = 1,
 @k int = 1;

declare
	@Фамилия nvarchar(50),
	@Имя nvarchar(50),
	@Oтчество nvarchar(50);

while @i <= 10 begin -- {
	select @Фамилия = Фамилия from Имена
	where Id = @i;
	while @j <= 10 begin  -- { 
		select @Имя = Имя from Имена
		where Id = @j;

		while @k <= 10 begin -- {
			select @Oтчество = Отчество from Имена
			where Id = @k;

			INSERT INTO [dbo].[Table_1]
			([ФИО])
			VALUES
			(@Фамилия + @Имя + @Oтчество)

			set @k+=1;
		end --}
		set @k = 1;
		set @j += 1;
	end --}
	set @j = 1;
	set @i += 1;
end --}







--GO



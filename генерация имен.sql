USE [Hotel]
GO

declare
 @i int = 1,
 @j int = 1,
 @k int = 1;

declare
	@������� nvarchar(50),
	@��� nvarchar(50),
	@O������� nvarchar(50);

while @i <= 10 begin -- {
	select @������� = ������� from �����
	where Id = @i;
	while @j <= 10 begin  -- { 
		select @��� = ��� from �����
		where Id = @j;

		while @k <= 10 begin -- {
			select @O������� = �������� from �����
			where Id = @k;

			INSERT INTO [dbo].[Table_1]
			([���])
			VALUES
			(@������� + @��� + @O�������)

			set @k+=1;
		end --}
		set @k = 1;
		set @j += 1;
	end --}
	set @j = 1;
	set @i += 1;
end --}







--GO



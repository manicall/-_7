
--insert Hotel.dbo.[TABLE](PARAM,...) values (VALUE);


--���������� ��������
--insert Hotel.dbo.[TABLE](PARAM,...) values (VALUE);

declare
	@start int = 0,
	@end int = 10;

while @start < @end begin
	set @start+=1;
	SELECT TOP 1 * from ������
	ORDER BY NEWID()	
end
print @start

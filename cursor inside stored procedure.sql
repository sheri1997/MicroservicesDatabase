use MicroservicesDatabase;
select * from INFORMATION_SCHEMA.TABLES;
create proc cursor_inside_procedure
@hired_lab nvarchar(100)
as
begin
	declare cursor_procedure cursor  static for
	select Hired_Lab from Hired_Candidates
	open cursor_procedure
	if  @@CURSOR_ROWS > 0
	begin
		fetch next from cursor_procedure into @hired_lab
		while @@FETCH_STATUS = 0
			begin
			print 'Labs are = ' + @hired_lab
			fetch next from cursor_procedure into @hired_lab
			end
		end
	close cursor_procedure
	deallocate cursor_procedure
	set nocount off
end

exec cursor_inside_procedure 'wTvision'

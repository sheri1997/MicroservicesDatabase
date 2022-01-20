use MicroservicesDatabase;
select * from CPULogDatabse;
declare @username nvarchar(100)
declare @tech nvarchar(100)
declare cur_emp cursor
static for 
select user_name, technology from CPULogDatabse
open cur_emp
if @@cursor_rows >0
	begin
	fetch next from cur_emp into @username, @tech
	while @@FETCH_STATUS = 0
		begin
		print 'Username = ' + @username + 'Technolgy used = ' + @tech
		fetch next from cur_emp into @username, @tech
		end
	end
close cur_emp
deallocate cur_emp
set nocount off

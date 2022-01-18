use MicroservicesDatabase;
select * from CPULogDatabse;
declare cursor_cpuworkingtime cursor for
select user_name, technology from CPULogDatabse where Cpu_Working_Time < 2000
open cursor_cpuworkingtime
fetch next from cursor_cpuworkingtime into @username, @tech
while(@@FETCH_STATUS = 0)
begin
	print 'name = '+ cast(@username as nvarchar(50) + 'technology' + @tech
	fetch next from cursor_cpuworkingtime into @username, @tech
end
close cursor_cpuworkingtime
deallocate cursor_cpuworkingtime


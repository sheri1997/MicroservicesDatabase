use MicroservicesDatabase
select * from INFORMATION_SCHEMA.TABLES;
select * from CPULogDatabse;
create proc sptechnologyused1
@technology nvarchar(50)
as begin
	select DateTime, user_name from CPULogDatabse where technology = @technology
end

exec sptechnologyused1 'android'
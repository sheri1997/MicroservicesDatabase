use MicroservicesDatabase;
select * from INFORMATION_SCHEMA.TABLES;
select * from CPULogDatabse;
--vertical partition of cpu log table
set statistics io on
set statistics time on
select DateTime, Usage_Cpu_Count, number_of_software_interrupts_since_boot, user_name, technology from CPULogDatabse
set statistics io off
set statistics time off

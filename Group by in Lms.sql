use MicroservicesDatabase;
select * from INFORMATION_SCHEMA.TABLES;
select * from Hired_Candidates
select count(Id), First_Name
from Hired_Candidates
group by First_Name;

select * from CPULogDatabse;
select count(technology) as No_Of_Times, user_name
from CPULogDatabse
group by user_name;

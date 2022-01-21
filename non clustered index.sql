use MicroservicesDatabase;
select * from INFORMATION_SCHEMA.TABLES;
--creating non-clustered index on CPU log table
select * from Hired_Candidates;
create nonclustered index user_non_clustered
on CPULogDatabse(user_name ASC);

create nonclustered index date_non_clustered
on CPULogDatabse(DateTime ASC);

create nonclustered index first_non_clustered
on Hired_Candidates(First_Name ASC);

exec sp_helpindex CPULogDatabse;
exec sp_helpindex Hired_Candidates;

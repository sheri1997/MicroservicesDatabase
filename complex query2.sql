use MicroservicesDatabase;
select * from Hired_Candidates;
select * from INFORMATION_SCHEMA.TABLES;
select Hired_Candidates.First_Name,
	avg(isnull (datediff(second, call.Hired_Date, call.Mobile_Number),0) as date_difference
	from Hired_Candidates
	left join Fellowship_Candidates on Fellowship_Candidates.Id
	left join Company on Company.Id = Fellowship_Candidates.Id
	group by
		Fellowship_Candidates.Id
	order by Fellowship_Candidates.First_Name asc;

select * from CPULogDatabse;
select CPULogDatabse.Cpu_idle_Time,
	SUM(case when CPULogDatabse.boot_time is not null then 1 else 0 end) as calls,
	isnull(CPULogDatabse.Cpu_Count, CPULogDatabse.Cpu_Working_Time),0 as avg_diff
	from CPULogDatabse
group by 
	CPULogDatabse.boot_time,
	CPULogDatabse.technology
having avg(isnull(datediff(second, CPULogDatabse.DateTime, CPULogDatabse.DateTime),0))> (select avg(datediff(SECOND, CPULogDatabse.DateTime, CPULogDatabse.DateTime))from CPULogDatabse)
order by calls asc;

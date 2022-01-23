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
select CPULogDatabse.user_name,
	SUM(case when call.id is not null then 1 else 0 end) as calls,
	AVG(isnull(CPULogDatabse.Cpu_Count, CPULogDatabse.Cpu_Working_Time),0)) as avg_diff
	from CPULogDatabse
group by 
	CPULogDatabse.boot_time,
	CPULogDatabse.technology
having AVG(isnull(datediff(second, call.DateTime, call.DateTime),0))> (select avg(datediff(SECOND, call.DateTime, call.DateTime))from CPULogDatabse)
order by calls asc, CPULogDatabse.user_name asc;
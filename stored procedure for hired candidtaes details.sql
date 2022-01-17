use MicroservicesDatabase
select * from INFORMATION_SCHEMA.TABLES;
select * from Hired_Candidates;
create proc HiredcandidateDetailsname
@first_name nvarchar(100)
as begin
	select First_Name, Last_Name, EmailID, Mobile_Number, Permanent_Pincode from Hired_Candidates
	where First_Name = @first_name
end

create proc HiredcandidateDetailsmobile
@mobile int
as begin
	select First_Name, Last_Name, EmailID, Mobile_Number, Permanent_Pincode from Hired_Candidates
	where Mobile_Number = @mobile
end




alter proc HiredcandidateDetailsmobile
@mobile bigint
as begin
	select First_Name, Last_Name, EmailID, Mobile_Number, Permanent_Pincode from Hired_Candidates
	where Mobile_Number = @mobile
	order by First_Name asc
end

exec HiredcandidateDetailsname 'Shreesh'
exec HiredcandidateDetailsmobile '9454977489'




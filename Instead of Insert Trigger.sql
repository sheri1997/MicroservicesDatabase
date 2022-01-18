--Instead of Insert Trigger
use MicroservicesDatabase;
select * from fellowshipcandidateeducation;
create trigger tr_fellowshipcandidateeducation_insteadofinsert
on fellowshipcandidateeducation
instead of insert
as
begin
	 declare @id int
	 select @id = Id
	 from Candidate_Qualification
	 join inserted
	 on inserted.degree_name_is = Candidate_Qualification.degree_name_is
	 if(@id is null)
	begin
		raiserror('Invalid Department Name', 16, 1)
		return
	end
	insert into Fellowship_Candidates(First_Name, Last_Name, EmailID, Mobile_Number)
	select First_Name, Last_Name, EmailId, Mobile_Number
	from inserted
end


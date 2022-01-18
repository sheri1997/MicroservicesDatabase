--Instead of Delete Trigger
use MicroservicesDatabase;
select * from fellowshipcandidateeducation
create trigger tr_fellowshipcandidateeducation_insteadofdelete
on fellowshipcandidateeducation
instead of delete
as 
begin
	--delete Fellowship_Candidates
	--from Fellowship_Candidates
	--join deleted
	--on Fellowship_Candidates.Id = deleted.Id
	delete from Fellowship_Candidates
	where Id in (select Id from deleted)
end

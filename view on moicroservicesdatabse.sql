use MicroservicesDatabase
select * from INFORMATION_SCHEMA.TABLES;
select * from Candidate_Qualification
select * from Fellowship_Candidates;
create view fellowshipcandidateeducation
as
select First_Name, Last_Name, EmailId, Mobile_Number, degree_name_is, diploma
from Fellowship_Candidates
join Candidate_Qualification
on Fellowship_Candidates.Id = Candidate_Qualification.candidateId

select * from fellowshipcandidateeducation

select * from Maker_Program;
create view fellowshipmakerplan
as 
select First_Name, Last_Name, EmailId, Mobile_Number, programName, programType, Description_program
from Fellowship_Candidates
join Maker_Program
on Fellowship_Candidates.Id = Maker_Program.Id

select * from fellowshipmakerplan

use MicroservicesDatabase;
select * from INFORMATION_SCHEMA.TABLES;
create table AuditMessage(
	Id int identity(1,1) primary key,
	Audit_Message nvarchar(500)
	);

select * from AuditMessage;
--DML Triggers After Triggeres
--After Insert
create trigger tr_hiringcandidate
on Hired_Candidates
for insert
as 
begin
	Declare @Id int
	select @Id = Id from inserted
	insert into AuditMessage
	values('New Candidate with Id =' + CAST(@Id as nvarchar(5)) + 'is added at' + CAST(getdate() as nvarchar(20)))
end
--After Delete
create trigger tr_hiringcandidate_fordelete
on Hired_Candidates
for delete
as 
begin
	Declare @Id int
	select @Id = Id from deleted
	insert into AuditMessage
	values('Candidate with Id =' + CAST(@Id as nvarchar(5)) + 'is deleted at' + CAST(getdate() as nvarchar(20)))
end

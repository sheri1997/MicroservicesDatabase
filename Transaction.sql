use MicroservicesDatabase;
select * from INFORMATION_SCHEMA.TABLES;
select * from Hired_Candidates;
select * from Fellowship_Candidates;
--creating a transaction for updating the candidate first name in the hired candidates table.
create proc transaction_update_name
@id  int,
@first_name varchar(100)
as 
begin
	begin try
		begin transaction
			update Hired_Candidates set First_Name = @first_name
			where Id = @id

			update Fellowship_Candidates set First_Name = @first_name
			where Id = @id
		commit transaction
		print 'Name Changed Successfully'
	end try
	begin catch
		rollback transaction
		print 'Name Cannot be Changed'
	end catch
end
-- creating a stored procedure for error defining.
create proc catch_transaction_insert_company
as 
begin
	select  
		ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_MESSAGE() AS ErrorMessage;
end

-- Creating a transaction inside a stored procedure which will add a new company to the Company Table.
create proc transaction_insert_company
@name varchar(100),
@address nvarchar(100),
@location varchar(100),
@status varchar(100),
@cstamp varchar(100),
@cuser varchar(100)
as 
begin
	begin try
		begin transaction
			insert into Company values(@name, @address, @location, @status, @cstamp, @cuser);
		commit transaction;
		print 'Company added Successfully'
	end try
	begin catch
		exec catch_transaction_insert_company
		if(XACT_STATE()) = -1
			begin
				print 'The transaction is in an uncommittable state. Rolling back transaction.'
				rollback transaction;
			end
		if(XACT_STATE()) = 1
			begin
				print 'The transaction is in an committable state. Committing transaction.'
				commit transaction;
			end
	end catch
end

exec transaction_insert_company 'wtvision', 'Noida Uttar Pradesh', 'India', 'active', 'ok', 'ok';
exec transaction_update_name '9', 'Vibhu';

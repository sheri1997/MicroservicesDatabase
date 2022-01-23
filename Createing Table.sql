use MicroservicesDatabase;
--creating hired candidates Table 
create table Hired_Candidates(
	Id int identity(1,1) primary key,
	First_Name varchar(100) not null,
	Last_Name varchar(100) not null,
	EmailID nvarchar(100) unique,
	Hired_Date datetime not null,
	Mobile_Number bigint not null unique,
	Permanent_Pincode int,
	Hired_Lab varchar(50) not null,
	Attitude varchar(100) not null,
	Communication_Remark varchar(100) not null,
	Knowledge_Remark varchar(100) not null,
	Aggregate_Remark varchar(100),
	Creator_Stamp varchar(100),
	Creator_User varchar(100) not null,
	);
--Creating FellowShip Candidates Table
create table Fellowship_Candidates(
	Id int identity(1,1) primary key,
	First_Name varchar(100) not null,
	Last_Name varchar(100) not null,
	EmailID nvarchar(100) unique,
	Hired_Date datetime not null,
	Mobile_Number bigint not null unique,
	Permanent_Pincode int,
	Hired_Lab varchar(50) not null,
	Attitude varchar(100) not null,
	Communication_Remark varchar(100) not null,
	Knowledge_Remark varchar(100) not null,
	Aggregate_Remark varchar(100),
	Creator_Stamp varchar(100),
	Creator_User varchar(100) not null,
	Birth_Date date not null,
	Birth_Date_Verified varchar(4) not null,
	Parent_Name varchar(100) not null,
	Parent_Occupation varchar(100) not null,
	Parents_Mobile_Number bigint not null,
	Parents_Annual_Salery bigint not null,
	Local_Address nvarchar(500) not null,
	Permanent_Address nvarchar(500) not null,
	Photo_Path varchar(100) not null,
	Joining_Date datetime not null,
	Candidate_Status varchar(20) not null,
	Personal_Information varchar(100),
	Bank_Information varchar(100) not null,
	Educational_Information varchar(100) not null,
	Document_Status varchar(100) not null,
	Remark varchar(500) not null
	);
--Creating table for Candidates Personal Details Check
create table Candidates_Personal_Details_Check(
	Id int identity(1,1) primary key,
	candidateId int foreign key references Fellowship_Candidates(Id),
	FieldName varchar(100) not null,
	IsverifiedLastupdStamp varchar(100) not null,
	LastupdUser varchar(100) not null,
	CreatorStamp varchar(100),
	CreatorUser varchar(100)
	);
--Creating table for Candidates Bank Details
create table Candidate_Bank_Details(
	Id int identity(1,1) primary key,
	candidateId int foreign key references Fellowship_Candidates(Id),
	AccountNumberIs bigint not null,
	AccountNumberVerifiedIS int not null,
	IFSCCode bigint not null,
	is_isfc_code_verified varchar(4) not null,
	pan_number bigint not null,
	is_pan_number_verified varchar(4) not null,
	addhaar_number bigint not null,
	is_aadhaar_number_verified varchar(4) not null,
	creator_stamp varchar(100),
	creator_user varchar(100)
	);
--Creating table for Candidates Qualification
create table Candidate_Qualification(
	Id int identity(1,1) primary key,
	candidateId int foreign key references Fellowship_Candidates(Id),
	diploma varchar(20),
	degree_name_is varchar(20),
	degree_name_verified_is varchar(4) not null,
	employee_decipline varchar(100) not null,
	employee_decipline_verified varchar(4) not null,
	passing_year int not null,
	is_passing_year_verified varchar(4) not null,
	final_year_per int not null,
	is_final_year_per_verified varchar(4) not null,
	training_institue varchar(50) not null,
	is_training_institue_verified varchar(4) not null,
	training_duration_month int not null,
	is_training_durationmonth_verified varchar(4) not null,
	other_training varchar(50),
	is_other_training_institue_verified varchar(4),
	creator_stamp varchar(100),
	creator_user varchar(100),
	);
--Creating table for Candidates Education Detailed Check
create table Candidate_Education_Detailed_Check(
	Id int identity(1,1) primary key,
	candidateId int foreign key references Fellowship_Candidates(Id),
	field_name varchar(100) not null,
	is_field_name_verified varchar(4) not null,
	lastupd_stamp varchar(100) not null,
	lastupd_stamp_user varchar(100) not null,
	creator_stamp varchar(100),
	creator_user varchar(100)
	);
--Creating table for Candidates Documents
create table Candidate_Documents(
	Id int identity(1,1) primary key,
	candidateId int foreign key references Fellowship_Candidates(Id),
	doc_type varchar(10) not null,
	doc_pathStatus varchar(10) not null,
	creator_stamp varchar(100),
	creator_user varchar(100)
	);
--Creating table for User Details
create table User_Details(
	Id int identity(1,1) primary key,
	email nvarchar(100) not null unique,
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	password_user nvarchar(100) not null,
	contact_number bigint not null unique,
	verified varchar(4) not null
	);
--Creating table for User Roles
create table User_Roles(
	Id int foreign key references User_Details(Id),
	Role_name varchar(100) not null
	);
--Creating table for Company
create table Company(
	Id int identity(1,1) primary key,
	Company_Name varchar(100) not null,
	Company_address nvarchar(500) not null,
	Company_location nvarchar(100) not null,
	Company_status varchar(100) not null,
	creator_stamp varchar(100),
	creator_user varchar(100)
	);
--Creating table for Maker Program
create table Maker_Program(
	Id int identity(1,1) primary key,
	programName varchar(100) not null,
	programType varchar(100) not null,
	programLink varchar(100) not null,
	tech_stack_id int not null,
	tech_type_id int not null,
	is_program_approved varchar(100),
	Description_program varchar(500),
	Program_status varchar(50),
	creator_stamp varchar(100),
	creator_user varchar(100)
	);
--Creating table for App Parameters
create table App_Parameters(
	Id int identity(1,1) primary key,
	key_type varchar(20) not null,
	key_text varchar(100) not null,
	cur_status varchar(100) not null,
	lastupd_user varchar(100) not null,
	lastupd_stamp varchar(100) not null,
	creator_stamp varchar(100),
	creator_user varchar(100) ,
	seq_num int not null
	);
--Creating table for Mentor
create table Mentor(
	Id int identity(1,1) primary key,
	Mentor_Name varchar(100) not null,
	mentor_type varchar(20) not null,
	lab_id_status int not null,
	creator_stamp varchar(100),
	creator_user varchar(100)
	);
--Creating table for Mentor Ideation Map
create table Mentor_Ideation_Type(
	Id int identity(1,1) primary key,
	mentor_id int foreign key references Mentor(Id),
	mentor_status varchar(100) not null,
	creator_stamp varchar(100) not null,
	creator_user varchar(100) not null
	);
--Creating table for Mentor Tech Stack
create table Mentor_Tech_Stack(
	Id int identity(1,1) primary key,
	mentor_id int foreign key references Mentor(Id),
	teck_stack_id int not null,
	Mentor_status varchar(100) not null,
	creator_stamp varchar(100),
	creator_user varchar(100),
	);
--Creating table for Tech Stack
create table Teck_Stack(
	Id int identity(1,1) primary key,
	tech_name varchar(100) not null,
	image_path varchar(100) not null,
	frameworkcur_status varchar(100) not null,
	creator_stamp varchar(100) not null,
	creator_user varchar(100) not null,
	);
--Creating table for Tech Type
create table Teck_Type(
	Id int identity(1,1) primary key,
	teck_type_name varchar(100) not null,
	cur_status varchar(100) not null,
	creator_stamp varchar(100),
	creator_user varchar(100),
	);
--Creating table for Lab
create table Lab(
	Id int identity(1,1) primary key,
	Lab_name varchar(100) not null,
	Lab_location varchar(100) not null,
	lab_address varchar(100) not null,
	lab_status varchar(100) not null,
	creator_stamp varchar(100),
	creator_user varchar(100) 
	);
--Creating table for Lab Threshold
create table Lab_Threshold(
	Id int identity(1,1) primary key,
	lab_id int foreign key references lab(Id),
	lab_capacity varchar(100) not null,
	lead_threshold varchar(100) not null,
	ideation_engg_threshold varchar(100) not null,
	buddy_engg_threshold varchar(100) not null,
	lab_status varchar(100) not null,
	creator_stamp varchar(100),
	creator_user varchar(100)
	);
--Creating table for Company Requirement
create table Company_requirement(
	Id int identity(1,1) primary key,
	company_id int foreign key references Company(Id),
	requested_month varchar(100) not null,
	city varchar(100) not null,
	is_doc_verification varchar(4) not null,
	requirment_doc_path varchar(100) not null,
	no_of_engg int not null,
	tech_stack_id int foreign key references Teck_Stack(Id),
	teck_type_id int foreign key references Teck_Type(Id),
	maker_program_id int foreign key references Maker_Program(Id),
	lead_id int foreign key references Lab(Id),
	ideation_engg_id int foreign key references Lab_Threshold(Id),
	buddy_engg_id int foreign key references Lab_Threshold(Id),
	special_remark varchar(100) not null,
	company_status varchar(100) not null,
	creator_stamp varchar(100),
	creator_user varchar(100),
	);


--Displaying all the tables present in the database
select * from INFORMATION_SCHEMA.TABLES;


--counting the number of tables in the databse
select count(*) from INFORMATION_SCHEMA.TABLES;

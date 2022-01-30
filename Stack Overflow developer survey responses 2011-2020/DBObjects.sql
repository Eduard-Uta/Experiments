create table dbo.Surveys
(
	Id int identity(1,1) primary key,
	Response nvarchar(4000) not null,
	ResponseYear int not null
);
	

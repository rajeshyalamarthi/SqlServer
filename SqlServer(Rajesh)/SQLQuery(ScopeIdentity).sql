Create table ScopeTable(uniqid int identity(1,1),Name Varchar(50),Time varchar(50))
drop table ScopeTable;
delete  from ScopeTable
select * from ScopeTable;

ALTER procedure Scope(
    @userName      VARCHAR(50),
    @dateTimeStart varchar(50),
    @searchID INT=0 OUTPUT)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO ScopeTable
                (
                Name,
                Time
                )
    VALUES  
                (
                @userName, 
                @dateTimeStart
                );

    select @searchID = SCOPE_IDENTITY();
	--select @searchID;
	print @searchID;

END

declare @id int;
exec Scope 'rajesh' ,'23-12-2018',@id;
select @id

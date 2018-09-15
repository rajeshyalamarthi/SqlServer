
--Using DataBase Rajesh2018
 use Rajesh2018
--Creating Table 
 Create table employees(EmployeeId int not null, EmployeeName nvarchar(50),Age nvarchar(50) primary key(EmployeeId))
 --To Retreive Data From employees Table
  select * from employees
 --Inserting data into Table
insert into employees(EmployeeId,EmployeeName,Age) values(1,'Rajesh',21);
insert into employees(EmployeeId,EmployeeName,Age) values(2,'Anuth',21);
insert into employees(EmployeeId,EmployeeName,Age) values(3,'Balu',21);
insert into employees(EmployeeId,EmployeeName,Age) values(4,'Veeru',21);
insert into employees(EmployeeId,EmployeeName,Age) values(5,'Sai',21);
insert into employees(EmployeeId,EmployeeName,Age) values(6,'Dileep',21);
insert into employees(EmployeeId,EmployeeName,Age) values(7,'DK',21);
insert into employees(EmployeeId,EmployeeName,Age) values(8,'Gopi',21);
--Using Drop(Deleting table)
Drop table employees
Drop table Details

---To retreive selected Data from employees table
select * from employees where EmployeeName='rajesh';
select EmployeeName from employees where EmployeeId=1


----to Add another Coloumn in my table
alter table employees add City nvarchar(50);

----to Add Data in newly created column
update employees set City='Gunutr' where EmployeeId=14007777

----OrderBy inorder to get data in orderwise
select * from employees order by EmployeeName;  

---selecting top 10 from employees
select top 3 * from employees

------------------creating another table called details-------------
Create table Details(EmployeeId int not null,City nvarchar(50), Salary nvarchar(50),MobileNo nvarchar(50),Country nvarchar(50) primary key(EmployeeId))

select * from Details
insert into Details(EmployeeId,City,Salary,MobileNo,Country) values(1,'Eluru',21000,9940966976,'India');
insert into Details(EmployeeId,City,Salary,MobileNo,Country) values(2,'Vizag',20000,9848214587,'India');
insert into Details(EmployeeId,City,Salary,MobileNo,Country) values(3,'Vijayawda',19500,9490299439,'Pakistan');
insert into Details(EmployeeId,City,Salary,MobileNo,Country) values(4,'Guntur',19000,7799158503,'Pakistan');
insert into Details(EmployeeId,City,Salary,MobileNo,Country) values(5,'eluru',18500,9440352833,'India');
insert into Details(EmployeeId,City,Salary,MobileNo,Country) values(6,'vijayawada',18000,7093188569,'Pakistan');
insert into Details(EmployeeId,City,Salary,MobileNo,Country) values(7,'eluru',17500,8985986960,'Pakistan');
insert into Details(EmployeeId,City,Salary,MobileNo,Country) values(8,'Hyderabad',17000,9790656258,'Australia');

-----------Joining two tables using conditions
select EmployeeName , City  ,Salary  from employees e,Details d where(e.EmployeeId = d.EmployeeId)
 -- using in
select EmployeeName,Salary,city from employees e,details d where(e.EmployeeId=d.EmployeeId and city in('Vijayawda','eluru' ));

----using alter
alter table details
add country nvarchar(50);
select * from Details

----using and or not
select * from Details where Country ='india' and City='eluru';
select * from Details where city='vijayawada' or City='eluru';
select * from Details where not country='india'

----finding null values
select * from employees where age is null;
select  * from employees where age is not null;

---testing

select * from sys.objects where type in ('U')

-------ForeignKeyRelationShip-------------
use Rajesh2018
---creating table Countries-----------
 Create table Countries(Id int not null  identity, Name nvarchar(50), primary key(Id))
 select * from Countries
 ----creating table Politicians--------
 Create table Politicinas(Id int not null  identity, Name nvarchar(50),CountryId int foreign key references Countries(Id) 
  primary key(Id))
  select * from Politicinas
 
  --------inserting data into the tables-------
  insert into Countries(Name) values('India');
  insert into Countries(Name) values('USA');
  insert into Countries(Name) values('South Africa'); 
  insert into Countries(Name) values('Russia');
  ------------
  insert into Politicinas(Name,CountryId) values ('Abdul Kalam',1);
   insert into Politicinas(Name,CountryId) values ('Obama',2);
    insert into Politicinas(Name,CountryId) values ('Vladmir Putin',4);
	 insert into Politicinas(Name,CountryId) values ('Modi',1);
	  insert into Politicinas(Name,CountryId) values ('Nelson Mandela',3);
	   insert into Politicinas(Name) values ('Donald Trump');

------------------Retreiving Data using joins------------
select Politicinas.Id,Politicinas.Name, Countries.Name From Politicinas left join Countries on Countries.id=Politicinas.CountryId	  
select Politicinas.Id,Politicinas.Name, Countries.Name From Politicinas left outer join Countries on Countries.id=Politicinas.CountryId
select Politicinas.Id,Politicinas.Name, Countries.Name From Politicinas right join Countries on Countries.id=Politicinas.CountryId
select  Countries.Name From Politicinas full join Countries on Countries.id=Politicinas.CountryId group by Countries.Name
--select * from Politicinas left join Countries on Politicinas.CountryId=Countries.Id group by Countries.Name


-------many to many realtion ship ------
-----------creating portfolio table
    Create table Portfolio(Id int not null  identity, Name nvarchar(50),primary key(Id)); 
	select * from Portfolio
--------inserting data into Portfolio----

	 insert into Portfolio(Name) values('Defense Minister');
	  insert into Portfolio(Name) values('Finanace Minister');
	   insert into Portfolio(Name) values('Railway Minsiter');
	    insert into Portfolio(Name) values('Tourism & development Minister');
		 insert into Portfolio(Name) values('Irrigation Minister');

---------creating another FKey Relation Table--
Create table relations(PoliticianId int foreign key references Politicinas(Id),PortfolioId int foreign key references Portfolio(Id)); 
select * from relations
insert into relations(PoliticianId,PortfolioId) values(1,1);
insert into relations(PoliticianId,PortfolioId) values(2,5);
insert into relations(PoliticianId,PortfolioId) values(3,2);
insert into relations(PoliticianId,PortfolioId) values(4,1);
insert into relations(PoliticianId,PortfolioId) values(5,3);
insert into relations(PoliticianId,PortfolioId) values(3,1);
insert into relations(PoliticianId,PortfolioId) values(1,5);

------writing a query using joins inorder to connect all the four tables and to fetch the data
select Politicinas.Id,Politicinas.Name,Countries.Name,Portfolio.Name from Politicinas full outer join Countries on Politicinas.CountryId=Countries.Id
  join relations on relations.PoliticianId=Politicinas.Id
   join Portfolio on relations.PortfolioId=Portfolio.Id order by Politicinas.Id 
----------------
select Politicinas.Id as PoliticianId,Politicinas.Name as PoliticianName,Countries.Name as CountyName,Portfolio.Name as PotrfolioName from Politicinas full outer join Countries on Politicinas.CountryId=Countries.Id
  join relations on relations.PoliticianId=Politicinas.Id
   join Portfolio on relations.PortfolioId=Portfolio.Id order by Politicinas.Id 
   select * from Portfolio
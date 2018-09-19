use SpAssignment
create table AccAudit (AccountId int identity(1,1) , AccountName varchar(20),LastTransactionDate datetime);
create table AccBalance(AccountId int  , CurrentBalance float, AsOn datetime);
create table BalSummary (AccountId int , TransactionType varchar(10),TransactionAmount float,OpenBalance float default 5000, CloseBalance float) ;

--drop table AccAudit
--drop table AccBalance
--drop table BalSummary

select * from AccAudit

select * from AccBalance

select * from BalSummary


insert into AccAudit values('Rajesh',CURRENT_TIMESTAMP);
insert into AccAudit values('Chowdary',CURRENT_TIMESTAMP  );

alter procedure BankAccount 
(@pAccountID int,@pTransactionType varchar(10),@pTransactionAmount float)
                                                                    
as
declare @ClosingBalance int =0;
declare @OpeningBalance int =0;
declare @LastTransactionDate datetime;
begin
begin transaction;
select @LastTransactionDate=max( LastTransactionDate) from AccAudit where AccountId=@pAccountID;
select @OpeningBalance=CurrentBalance from AccBalance where AccountId=@pAccountID and Ason=@LastTransactionDate;
if (upper(@pTransactionType)='DEBIT')
set @ClosingBalance = @OpeningBalance-@pTransactionAmount
else 
set @ClosingBalance = @OpeningBalance+@pTransactionAmount

  insert into BalSummary values (@pAccountID,@pTransactionType,@pTransactionAmount,@OpeningBalance,@ClosingBalance)
  insert into AccBalance values (@pAccountID,@ClosingBalance,CURRENT_TIMESTAMP)
  update AccAudit set LastTransactionDate=CURRENT_TIMESTAMP where AccountId=@pAccountID;

  commit transaction;
  end;

 exec BankAccount 2,'credit',4000
 
select * from AccAudit

select * from AccBalance

select * from BalSummary
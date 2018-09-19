use SpAssignment


INSERT INTO Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) VALUES ('GOOG', 'Alphabet Inc', 'NASDAQ', 30)
INSERT INTO Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) VALUES ('KRFT', 'Kraft Foods Inc', 'NYSE', 12)

INSERT INTO Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) VALUES ('KO', 'The Coca-Cola Company', 'NYSE', 21)

INSERT INTO Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) VALUES ('MCD', 'McDonalds Corporation', 'NYSE', 18)



CREATE TABLE Stocks (StockSymbol VARCHAR(10) NOT NULL, StockName VARCHAR(30) NULL,Exchange VARCHAR(10) NULL,PriceEarningsRatio INT NULL)
select * from Stocks
------------------------------Insert----------------
alter procedure IUD
(@StockSymbol VARCHAR(10) ,@StockName VARCHAR(30),@Exchange VARCHAR(10),@PriceEarningsRatio INT)
as
begin
if not exists(select * from Stocks where Stocks.StockName = @StockName or Stocks.PriceEarningsRatio>500)
begin
INSERT INTO Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) VALUES (@StockSymbol,@StockName,@Exchange,@PriceEarningsRatio)
end
else
print N'Duplicate Data Cannot be Allowed and Price earning ratio cannot be greater than 500';
end
exec IUD 'GOOG','Alphabet Inc','NASDAQ',30
select * from Stocks


-------------------------Update-----------------------
alter procedure IUDUpdate
(@StockSymbol VARCHAR(10) ,@StockName VARCHAR(30),@Exchange VARCHAR(10),@PriceEarningsRatio INT)
as
begin
if  exists(select * from Stocks where Stocks.StockName = @StockName or Stocks.PriceEarningsRatio>500)
begin
update Stocks set StockSymbol=@StockSymbol, StockName=@StockName, Exchange=@Exchange, PriceEarningsRatio=@PriceEarningsRatio where StockName=@StockName

end
else
print N'Duplicate Data Cannot be updated and Price earning ratio cannot be greater than 500';
end

exec IUDUpdate 'KRFT','Alphabet Inc','NASDAQ',40




--------------------------Delete proc -----------
alter procedure IUDSDelete
(@StockName VARCHAR(30))
as 
begin
declare @check as int
--select @check = COUNT(1) from Stocks where StockName=@StockName group by Exchange
select @check = count(*) from stocks where exchange in (select exchange from Stocks where StockName=@StockName)
if(@check<> 1)
begin
delete from Stocks where StockName=@StockName
end
else
print N'Can not deleted because alteast one data should be required';
end

select * from Stocks

exec IUDSDelete 'Alphabet Inc'


select count(*) from stocks where exchange in (select exchange from Stocks where StockName='McDonalds Corporation') --group by Exchange

select * from Stocks
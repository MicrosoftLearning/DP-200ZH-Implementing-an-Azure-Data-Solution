-- Exercise 3 Task 3 Step 2 script
-- Replace the underline with the distribution type
CREATE TABLE dbo.Users(
userId int null,
City nvarchar(100) null,
Region nvarchar(100) null,
Country nvarchar(100) null
) WITH (
CLUSTERED COLUMNSTORE INDEX,
DISTRIBUTION = _____________
);
GO
--Exercise 3 Task 3 Step 5
CREATE TABLE dbo.Products(
ProductId int null,
EnglishProductName nvarchar(100) null,
Color nvarchar(100) null,
StandardCost int null,
ListPrice int null,
Size nvarchar(100) null,
Weight int null,
DaysTomanufacture int null,
Class nvarchar(100) null,
Style nvarchar(100) null
) WITH (
CLUSTERED COLUMNSTORE INDEX,
DISTRIBUTION = _____________
);
GO
--Exercise 3 Task 3 Step 8
CREATE TABLE dbo.FactSales(
DateId int null,
ProductId int null,
UserId int null,
UserPreferenceId int null,
SalesUnit int null
) WITH (
CLUSTERED COLUMNSTORE INDEX,
DISTRIBUTION = _______________
);
GO

CREATE TABLE [dbo].[Users](
	[UserId] [int]  NULL,
	[City] [nvarchar](100) NULL,
	[Region] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL
) 
WITH
(
	CLUSTERED COLUMNSTORE INDEX
,	DISTRIBUTION = REPLICATE
)
;

CREATE TABLE [dbo].[Product](
	[ProductId] [int] NULL,
	[EnglishProductName] [nvarchar](100) NULL,
	[Color] [nvarchar](100) NULL,
	[StandardCost] [int]  NULL,
	[ListPrice] [int]  NULL,
	[Size] [nvarchar](100) NULL,
	[Weight] [int]  NULL,
	[DaysToManufacture] [int]  NULL,
	[Class] [nvarchar](100) NULL,
	[Style] [nvarchar](100) NULL
) 

WITH
(
	CLUSTERED COLUMNSTORE INDEX
,	DISTRIBUTION = ROUND_ROBIN
)
;

CREATE TABLE [dbo].[FactSales](
	[DateId] [int] NULL,
	[ProductId] [int] NULL,
	[UserId] [int] NULL,
	[UserPreferenceId] [int] NULL,
	[SalesUnit] [int] NULL
) 
WITH
(
	CLUSTERED COLUMNSTORE INDEX
,	DISTRIBUTION = HASH([SalesUnit])
)
;


/*CLeanup
DROP TABLE [dbo].[User];
DROP TABLE [dbo].[Product];
DROP TABLE [dbo].[FactSales];
*/






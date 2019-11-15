-- A: Create a master key.
-- Only necessary if one does not already exist.
-- Required to encrypt the credential secret in the next step.

CREATE MASTER KEY;


-- B: Create a database scoped credential
-- IDENTITY: Provide any string, it is not used for authentication to Azure storage.
-- SECRET: Provide your Azure storage account key.


CREATE DATABASE SCOPED CREDENTIAL AzureStorageCredential
WITH
    IDENTITY = 'MOCID',
    SECRET = 'uKqRan5htV8q4oD/O+SAxQboL5MN8LhmjEZQ2ivjKOrOorQzLi33gH+C1m4ffqTcGNQN9PMluWmSYeXD/wBQhQ=='
;


-- C: Create an external data source
-- TYPE: HADOOP - PolyBase uses Hadoop APIs to access data in Azure blob storage.
-- LOCATION: Provide Azure storage account name and blob container name.
-- CREDENTIAL: Provide the credential created in the previous step.

CREATE EXTERNAL DATA SOURCE AzureStorage
WITH (
    TYPE = HADOOP,
    LOCATION = 'wasbs://data@awsastudcto.blob.core.windows.net',
    CREDENTIAL = AzureStorageCredential
);


-- D: Create an external file format
-- FORMAT_TYPE: Type of file format in Azure storage (supported: DELIMITEDTEXT, RCFILE, ORC, PARQUET).
-- FORMAT_OPTIONS: Specify field terminator, string delimiter, date format etc. for delimited text files.
-- Specify DATA_COMPRESSION method if data is compressed.

CREATE EXTERNAL FILE FORMAT TextFile
WITH (
    FORMAT_TYPE = DelimitedText,
    FORMAT_OPTIONS (FIELD_TERMINATOR = ',')
);


-- E: Create the external table
-- Specify column names and data types. This needs to match the data in the sample file.
-- LOCATION: Specify path to file or directory that contains the data (relative to the blob container).
-- To point to all files under the blob container, use LOCATION='.'

CREATE EXTERNAL TABLE dbo.DimDate2External (
	[Date] datetime2(3) NULL,
	[DateKey] decimal(38, 0) NULL,
	[MonthKey] decimal(38, 0) NULL,
	[Month] nvarchar(100) NULL,
	[Quarter] nvarchar(100) NULL,
	[Year] decimal(38, 0) NULL,
	[Year-Quarter] nvarchar(100) NULL,
	[Year-Month] nvarchar(100) NULL,
	[Year-MonthKey] nvarchar(100) NULL,
	[WeekDayKey] decimal(38, 0) NULL,
	[WeekDay] nvarchar(100) NULL,
	[Day Of Month] decimal(38, 0) NULL
)
WITH (
    LOCATION='/',
    DATA_SOURCE=AzureStorage,
    FILE_FORMAT=TextFile
);


-- Run a query on the external table

SELECT count(*) FROM dbo.DimDate2External;

SELECT * FROM dbo.DimDate2External;

-- Load the data from Azure blob storage to SQL Data Warehouse

CREATE TABLE dbo.Dates
WITH
(   
    CLUSTERED COLUMNSTORE INDEX,
    DISTRIBUTION = ROUND_ROBIN
)
AS
SELECT * FROM [dbo].[DimDate2External];


-- Create statistics on the new data

CREATE STATISTICS [DateKey] on [Dates] ([DateKey]);
CREATE STATISTICS [Quarter] on [Dates] ([Quarter]);
CREATE STATISTICS [Month] on [Dates] ([Month]);


-- Query the dbo.dates table

SELECT * FROM dbo.Dates;
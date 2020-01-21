---
lab:
    title: '在云中使用关系数据存储'
    module: '模块 5:使用云中的关系数据存储'
---

# DP 200 - 实施数据平台解决方案
# 实验 5 - 在云中使用关系数据存储

**预计用时**：75 分钟

**先决条件**：假设已阅读了本实验室的案例研究。假设模块 1 的内容和实验：数据工程师的 Azure 也已完成

**实验室文件**：本实验室文件位于 _Allfiles\Labfiles\Starter\DP-200.5_ 文件夹中。

## 实验室概述

学生将能够配置 Azure SQL 数据库和 Azure SQL 数据仓库，并能够针对其中一个创建的实例发起查询。还能够将SQL数据仓库与许多其他数据平台技术集成，并使用PolyBase将数据从一个数据源加载到Azure SQL数据仓库中。

## 实验室目标
  
完成本实验室课程后，你将能够：

1. 使用 Azure SQL 数据库
1. 描述 Azure 数据仓库
1. 创建并查询 Azure SQL 数据仓库
1. 使用 PolyBase 将数据加载到 Azure SQL 数据仓库

## 方案
  
你是AdventureWorks的高级数据工程师，并且你正在与你的团队合作，将关系数据库系统从本地SQL Server转换为位于Azure中的关系数据库。首先，你将使用公司的示例数据库创建SQL Server实例，该数据库将由初级数据工程师交付，以执行部门数据库的一些测试。

然后，你将配置SQL数据仓库，并通过使用一系列查询测试示例数据库来测试服务器的配置是否成功。然后，你将使用PolyBase从Azure Blob和Azure Databricks加载维度表，以测试这些数据平台技术与Azure SQL数据仓库的集成情况。

在本实验结束时，你将能够：

1. 使用 Azure SQL 数据库
1. 描述 Azure 数据仓库
1. 创建并查询 Azure SQL 数据仓库
1. 使用 PolyBase 将数据加载到 Azure SQL 数据仓库

> **重要事项**：在完成本实验室时，请记下你在任何设置或配置任务中遇到的任何问题，并将其记录在位于_\Labfiles\DP-200-Issues-Doc.docx_的文档的表格中。记录实验室编号，记录技术，说明问题以及解决方案的内容。保存该文档，以便在稍后的模块中参考它。

## 练习 1：使用 Azure SQL 数据库

预计用时：15 分钟

个人练习
  
本练习的主要任务如下：

1. 创建和配置SQL数据库实例。

### 任务 1：创建和配置SQL数据库实例。

1. 在Azure门户中，导航到 **创建资源** 边栏选项卡。

1. 在新的边栏选项卡中，导航到 **搜索市场** 文本框，然后输入单词 **SQL数据库**。在显示的列表中单击 **SQL数据库**。

1. 在 **SQL数据库** 边栏选项卡中，单击 **创建**。

1. 从 **创建SQL数据库** 边栏选项卡中，使用以下设置创建Azure SQL数据库：

    - 订阅：你用于本实验室的订阅名称

    - 资源组名称：**awrgstudxx**，其中 **XX** 是你的姓名缩写。

    - 数据库名称：在数据源下的 **“附加设置”** 选项卡，单击 **“示例”**。自动选择 AdventureworksLT 示例数据库。

    - 服务器：通过单击 **“新建”**，以及进行以下设置，来创建新的服务器，然后单击 **“确定”**：
        - 服务器名称：**SQLServicexx**，其中 **XX** 是你的姓名缩写
        - 服务器管理员登录 **xxsqladmin**，其中 **XX** 是你的姓名缩写
        - 密码：**Pa55w.rd**
        - 确认密码：**Pa55w.rd**
        - 位置：选择一个离你很近的 **位置**。
        - 允许Azure服务访问服务器：**已检查**

    - 单击 **其他设置** 选项卡，在 **数据源** 下，单击 **示例**。

    - 将其余设置保留为默认值

1. 在 **创建SQL数据库*** 边栏选项卡中，单击 **查看+创建**。

1. 确认 **创建SQL数据库*** 边栏选项卡后，单击 **创建**。

   > **注**：这大约需要4分钟。

> **结果**：完成本练习后，你将拥有Azure SQL数据库实例

## 练习 2：描述 Azure 数据仓库
  
预计用时：15 分钟

个人练习
  
本练习的主要任务如下：

1. 创建和配置SQL数据仓库实例。

1. 配置服务器防火墙

### 任务 1：创建和配置SQL数据仓库实例。

1. 在Azure门户中，导航到 **创建资源** 边栏选项卡。

1. 在新的边栏选项卡中，导航到 **搜索市场** 文本框，然后输入单词 **SQL数据**。在显示的列表中单击 **SQL数据仓库**。

1. 在 **SQL数据仓库** 边栏选项卡中，单击 **创建**。

1. 从 **“SQL 数据仓库”** 边栏选项卡中，通过以下设置，创建 Azure SQL 数据仓库：

    - 数据库名称：**Warehousexx**，其中 **XX** 是你的姓名缩写。

    - 订阅：你用于本实验室的订阅名称

    - 资源组名称：**awrgstudxx**，其中 **XX** 是你的姓名缩写。

    - 服务器：**SQLServicexx**

    - 性能水平：**Gen2 DW100C：**

    - 选择源：在数据源下的 **“附加设置”** 选项卡，单击 **“示例”**


1. 在**SQL数据仓库边栏选项卡中，单击**创建**。

   > **注**：这大约需要7分钟。

### 任务 2：配置服务器防火墙

1. 在Azure门户的边栏选项卡中，单击 **资源组**，然后单击 **awrgstudxx**，再单击 **awdlsstudxx**，其中 **xx** 是你的姓名缩写

1. 单击 **sqlservicexx**，其中 **XX** 是你的姓名缩写。

1. 在 **sqlservicexx** 屏幕中，单击 **防火墙和虚拟网络**。

1. 在sqlservicexx - 防火墙和虚拟网络屏幕中，单击 **+添加客户端IP** 选项，然后单击 **保存**。

    > **注**：你将收到一条消息，指出服务器防火墙规则已成功更新

> **结果**：完成此练习后，你已创建Azure SQL数据仓库实例并配置服务器防火墙，以防止对其进行连接。

## 练习 3：创建Azure SQL数据仓库

预计用时：25 分钟

个人练习

本练习的主要任务如下：

1. 安装SQL Server Management Studio并连接到SQL数据仓库实例。

1. 创建SQL数据仓库数据库

1. 创建SQL数据仓库表

    > **注**：如果你不熟悉Transact-SQL，则以下位置的说明可用于以下实验 **Allfiles\Labfiles\Starter\DP-200.5\SQL DW Files**

### 任务 1：安装SQL Server Management Studio并连接到SQL数据仓库实例。

1. 在Azure门户中，在 **sqlservicexx - 防火墙和虚拟网络**，在边栏选项卡中，单击 **属性**

1. 复制 **服务器名称** 并将其粘贴到记事本中。

1. 下载[SQL Server Management Studio](https://docs.microsoft.com/zh-cn/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-2017)并安装到你的机器上

1. 在Windows桌面上，单击 **开始**，并输入 **“SQL服务器”**，然后单击 **MIcrosoft SQL Server Management Studio 17**

1. 在 **连接到服务器** 对话框中，填写以下详细信息
    - 服务器名：**sqlservicexx.database.windows.net**
    - 身份验证：**SQL Server 身份验证**
    - 用户名：**xxsqladmin**
    - 密码：**P@ssw0rd**

1. 在 **连接到服务器** 对话框中，单击 **连接**。 

### 任务 2：创建SQL数据仓库数据库。

1. 在 **SQL Server Management Studio** 中，在对象资源管理器中，右键单击 **sqlservicexx.database.windows.net** 并单击 **新查询**。 

1. 在查询窗口中，创建一个名为 **DWDB** 的数据仓库数据库，服务目标为DW100，最大容量为1024GB。

    ```SQL
    CREATE DATABASE DWDB COLLATE SQL_Latin1_General_CP1_CI_AS
    (
        EDITION 			= 'DataWarehouse'
    ,	SERVICE_OBJECTIVE 	= 'DW100C'
    ,	MAXSIZE 			= 1024 GB
    );
    ```

    > **注**：创建数据库大约需要2分钟。

1. 在 **awdlsstudxx** 边栏选项卡中，单击 **访问键**，然后单击 **存储帐户名称** 旁边的复制图标并将其粘贴到记事本中。

### 任务 3：创建SQL数据仓库表。

1. 在 **SQL Server Management Studio** 中，在对象资源管理器中，右键单击 **sqlservicexx.database.windows.net** 并单击 **新查询**。

    >**注**： 如果你不熟悉 Transact-SQL，则在 Allfiles\Solution\DP-200.5\folder 下有一个脚本名为 **Exercise3 Task3Step2 script.sql** 的脚本。它包含创建表所需的大部分代码，但是你必须通过选择要用于每个表的分配类型来完成代码 

1. 创建一个名为 **dbo.Users** 的表，其具有 **聚集列存储** 索引，此索引为 **复制** 分布，具有以下列：

    | 列名 | 数据类型 | 可为空性|
    |-------------|-----------|------------|
    | 用户Id | int | 空|
    | 市 | nvarchar(100) | 空|
    | 区域 | nvarchar(100) | 空|
    | 国家 | nvarchar(100) | 空|

1. 在 **SQL Server Management Studio** 中，单击 **执行**。

1. 在 **SQL Server Management Studio** 中，在对象资源管理器中，右键单击 **sqlservicexx.database.windows.net** 并单击 **新查询**。

1. 创建一个名为 **dbo.Products** 的表，其具有 **聚集列存储索引**，此索引为 **循环** 分布，具有以下列：

    | 列名 | 数据类型 | 可为空性|
    |-------------|-----------|------------|
    | 产品Id | int | 空|
    | 英文产品名称 | nvarchar(100) | 空|
    | 颜色 | nvarchar(100) | 空|
    | 标准费用 | int | 空|
    | ListPrice | int | 空|
    | 大小 | nvarchar(100) | 空|
    | 重量 | int | 空|
    | 制造日 | int | 空|
    | 类 | nvarchar(100) | 空|
    | 类型 | nvarchar(100) | 空|

1. 在 **SQL Server Management Studio** 中，单击 **执行**。

1. 在 **SQL Server Management Studio** 中，在对象资源管理器中，右键单击 **sqlservicexx.database.windows.net** 并单击 **新查询**。

1. 创建一个名为 **dbo.FactSales** 的表，其具有 **聚集列存储** 索引，此索引在 **销量单位** 上为 **哈希** 分布，具有以下列：

    | 列名 | 数据类型 | 可为空性|
    |-------------|-----------|------------|
    | 日期Id | int | 空|
    | 产品Id | int | 空|
    | 用户Id | int | 空|
    | 用户参考Id | int | 空|
    | 销售单位 | int | 空|

1. 在 **SQL Server Management Studio** 中，单击 **执行**。

> **结果**：完成本练习后，你已安装SQL Server Management Studio，来创建名为DWDB的数据仓库以及名为“用户”、“产品”和“事实销量”的三个表。

## 练习 4：使用 PolyBase 将数据加载到 Azure SQL 数据仓库中

预计用时：10 分钟

个人练习

本练习的主要任务如下：

1. 收集Azure Blob容器和关键详情

1. 使用Azure Blob中的PolyBase创建dbo.Dates表


### 任务 1：收集Azure Blob帐户名称和密钥详情

1. 在Azure门户，单击 **资源组**，然后单击 **awrgstudxx**，再单击 **awsastudxx**，其中xx是你的姓名缩写

1. 在 **awsastudxx** 屏幕中，单击 **访问密钥**。单击 **存储帐户名称** 旁边的图标并将其粘贴到记事本中。

1. 在 **awsastudxx - 访问密钥** 屏幕中的 **密钥1** 下，单击 **密钥** 旁边的图标并将其粘贴到记事本中。

### 任务 2：使用Azure Blob中的PolyBase创建dbo.Dates表

1. 在 **SQL Server Management Studio** 中，在对象资源管理器中，右键单击 **sqlservicexx.database.windows.net** 并单击 **新查询**。

1. 创建一个 **主密钥**，保护 **DWDB** 数据库。

    ```SQL
    CREATE MASTER KEY;
    ```

1. 创建名为 **AzureStorageCredential** 的数据库范围的凭据，其具有以下细节：
    - 识别：**MOCID**
    - 机密：**存储帐户的访问密钥**

    ```SQL
    CREATE DATABASE SCOPED CREDENTIAL AzureStorageCredential
    WITH
    IDENTITY = 'MOCID',
    SECRET = 'Your storage account key'
;
    ```

1. 在 **SQL Server Management Studio** 中，突出显示两个语句，然后单击 **执行**。

1. 在 **SQL Server Management Studio** 中，在“查询”窗口中，输入将创建的名为 **AzureStorage** 的外部数据源的代码，此代码以使用 ****AzureStorageCredential** 的 **HADOOP** 形式用于创建Blob存储帐户和数据容器

    ```SQL
    CREATE EXTERNAL DATA SOURCE AzureStorage
    WITH (
        TYPE = HADOOP,
        LOCATION = 'wasbs://data@awsastudxx.blob.core.windows.net',
        CREDENTIAL = AzureStorageCredential
    );
    ```

1. 在 **SQL Server Management Studio** 中，在“查询”窗口中，输入将创建的名为 **TextFile** 的外部文件格式的代码，格式为 **DelimitedText**，字段终止符为 **逗号**。

    ```SQL
    CREATE EXTERNAL FILE FORMAT TextFile
    WITH (
        FORMAT_TYPE = DelimitedText,
        FORMAT_OPTIONS (FIELD_TERMINATOR = ',')
    );
    ```

1. 在 **SQL Server Management Studio** 中，突出显示该语句，然后单击 **执行**。

1. 在 **SQL Server Management Studio** 中，在“查询”窗口中，输入将创建的名为 **dbo.DimDate2External** 的外部表的代码，此代码以 **位置** 作为根文件，数据源为 **AzureStorage**，**TextFile** 的File_format具有以下列：

    | 列名 | 数据类型 | 可为空性|
    |-------------|-----------|------------|
    | 日期 | datetime2(3) | 空|
    | 日期键 | 小数(38, 0) | 空|
    | 月份键 | 小数(38, 0) | 空|
    | 月 | nvarchar(100) | 空|
    | 季度 | nvarchar(100) | 空|
    | 年 | 小数(38, 0) | 空|
    | 年-季度 | nvarchar(100) | 空|
    | 年-月 | nvarchar(100) | 空|
    | 年-月键 | nvarchar(100) | 空|
    | 周-日键| 小数(38, 0) | 空|
    | 平日| nvarchar(100) | 空|
    | 日期| 小数(38, 0) | 空|

    ```SQL
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
    ```

1. 在 **SQL Server Management Studio** 中，突出显示该语句，然后单击 **执行**。

1. 测试：是否通过运行选择语句已创建表格

    ```SQL
    SELECT * FROM dbo.DimDate2External;
    ```

1. 在 **SQL Server Management Studio** 中，在“查询”窗口中，输入 **CTAS** 语句，其创建一个名为 **dbo.Dates** 的表，此表具有 **聚集列存储** 索引和 **循环** **分布**，从 **dbo.DimDate2External** 表加载数据。

    ```SQL
    CREATE TABLE dbo.Dates
    WITH
    (   
        CLUSTERED COLUMNSTORE INDEX,
        DISTRIBUTION = ROUND_ROBIN
    )
    AS
    SELECT * FROM [dbo].[DimDate2External];
    ```

1. 在 **SQL Server Management Studio** 中，突出显示该语句，然后单击 **执行**。
 
1. 在 **SQL Server Management Studio** 中，在“查询”窗口中，输入一项查询，此查询对 **日期键**、**季度** 和 **月** 的列进行统计。

    ```SQL
    CREATE STATISTICS [DateKey] on [Dates] ([DateKey]);
    CREATE STATISTICS [Quarter] on [Dates] ([Quarter]);
    CREATE STATISTICS [Month] on [Dates] ([Month]);
    ```

1. 测试：是否通过运行选择语句已创建表格

    ```SQL
    SELECT * FROM dbo.Dates;
    ```

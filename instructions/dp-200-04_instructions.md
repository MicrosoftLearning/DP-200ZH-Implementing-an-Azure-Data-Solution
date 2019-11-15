---
lab:
    title: '使用 Cosmos DB 构建全局分布式数据库'
    module: '模块 4:使用 Cosmos DB 建立全局分布式数据库'
---

# DP 200 - 实施数据平台解决方案
# 实验室 4 - 使用 Cosmos DB 构建全局分布式数据库

**预计用时**：90 分钟

**先决条件**：假设已阅读了本实验室的案例研究。假设模块 1：数据工程师 Azure 的内容和实验室适用于数据工程师的 Azure 也已完成

**实验室文件**：本实验的文件位于 _Allfiles\Labfiles\Starter\DP-200.4_ 文件夹中。

## 实验室概述

学生将能够说明和演示 Azure Cosmos DB 可为组织带来的功能。他们将能够创建 Cosmos 数据库实例，并展示如何通过门户网站和 .Net 应用程序上传和查询数据。然后，他们将能够演示如何启用 Cosmos DB 数据库的全球扩展。

## 实验室目标
  
完成本实验后，你将能够：

1. 创建按比例构建的 Azure Cosmos DB 数据库
1. 在 Azure Cosmos DB 数据库中插入和查询数据
1. 在 Visual Studio Code 中为 Azure Cosmos DB 构建 .NET Core 应用
1. 使用 Azure Cosmos DB 全局分布数据

## 方案
  
AdventureWorks 的开发人员和信息服务部门意识到最近在 Azure 上发布的一项名为 Cosmos DB 的新服务可以近乎实时地提供对数据的全球规模访问。他们希望了解此服务可以提供的功能以及它如何为 AdventureWorks 带来价值，以及在什么情况下使用。

信息服务部门希望了解如何设置服务以及如何上传数据。开发人员希望看到可用于将数据上传到 Cosmos 的应用程序的示例。两者都想了解如何满足全球规模的要求。

在本实验结束时，你将能够：

1. 创建按比例构建的 Azure Cosmos DB 数据库
1. 在 Azure Cosmos DB 数据库中插入和查询数据
1. 在 Visual Studio Code 中为 Azure Cosmos DB 构建 .NET Core 应用
1. 使用 Azure Cosmos DB 全局分布数据

> **重要事项**：在完成本实验时，请记下你在任何设置或配置任务中遇到的任何问题，并将其记录在位于_\Labfiles\DP-200-Issues-Doc.docx_的文档的表格中。记录实验室编号，记录技术，说明问题以及解决方案的内容。保存该文档，以便在稍后的模块中参考它。

## 练习 1：创建按比例构建的 Azure Cosmos DB 数据库

预计用时：10 分钟

个人练习
  
本练习的主要任务如下：

1. 创建 Azure Cosmos DB 实例

### 任务 1：创建 Azure Cosmos DB 实例

1. 在Azure门户中，导航到 **创建资源** 边栏选项卡。

1. 在新的边栏选项卡中，导航到 **搜索市场文本框**，然后输入单词 **Cosmos**。在显示的列表中点击 **Azure Cosmos DB**。

1. 在 **Azure Cosmos DB** 边栏选项卡中，点击 **创建**。

1. 从 **创建 Azure Cosmos 数据库帐户** 屏幕中，使用以下设置创建 Azure Cosmos DB 帐户：

    - 订阅：你用于本实验室的订阅名称

    - 资源组名称：**awrgstudxx**，其中 **XX** 是你的姓名缩写。

    - 用户名：**awcdbstudxx**，其中 **XX** 是你的姓名缩写。

    - API：**核心（SQL）**

    - 位置：最靠近实验室位置的Azure区域的名称，在其中你能设置Azure VM的位置。

1. 在 **创建 Azure Cosmos 数据库帐户** 边栏选项卡中，点击 **查看+创建**。

1. 确认 **创建Azure Cosmos DB帐户** 边栏选项卡后，单击 **创建**。

   > **注**：这大约需要5分钟。在这些实验中经常避免在 Azure 中配置服务时对其他选项卡的说明。你可能会注意到，在配置屏幕中存在其他选项卡，例如：“网络”、“标签”或“高级”。这使你可以定义服务的任何自定义设置。例如，许多服务的网络选项卡使你可以定义虚拟网络的配置，以便你能够针对给定的数据服务控制和保护网络流量。“标记”选项是名称/值对，使你可以通过将相同标记应用于多个资源和资源组来对资源进行分类并查看合并计费。高级选项卡将根据拥有高级选项卡的服务而有所不同。但重要的是注意：你可以控制这些区域，并且你希望与网络管理员或财务部门协作，以了解应如何配置这些选项。

1. 配置完成后，将显示“你的部署已完成”的屏幕，单击 **转到资源** 并进入下一个练习。 

> **结果** 在本练习中，你已配置 Azure Cosmos DB 帐户

## 练习 2：在 Azure Cosmos DB 数据库中插入和查询数据
  
预计用时：20 分钟

个人练习
  
本练习的主要任务如下：

1. 设置 Azure Cosmos DB 数据库和集合

1. 使用门户添加数据

1. 在 Azure 门户中运行查询

1. 对数据运行复杂的操作

### 任务 1：设置 Azure Cosmos DB 数据库和集合

1. 在 Azure门户 中，在 **awcdbstudxx - 快速启动** 屏幕中，单击边栏选项卡中的 **概览** 选项

1. 在 **awcdbstudxx** 屏幕中，单击 **+添加集合**。这样使用 **添加集合** 打开了 **数据资源管理器**。

1. 在 **添加集合** 屏幕中，使用名为 Clothing（服装）的集合创建 Products（产品）数据库，其中包含以下设置：

    - 数据库 id：**产品**

    - 订阅：  **服装**

    - 分区键：**/产品Id**

    - 将其余选项保留为默认值

1.在 **添加集合** 屏幕中，单击 **OK**

### 任务 2：使用门户添加数据

1. 在 **awcdbstudcto - 数据资源管理器** 屏幕中，在数据资源管理器工具栏上“新集合”按钮对面，单击 **打开全屏** 按钮。在“打开全屏”对话框中，单击 **打开**。Microsoft Edge 中将打开一个新选项卡。

1. 在 **SQL API** 窗格中，扩展 **服装** 并点击 **文档**。将出现包含你现在将替换的示例 JSON 的新文档。

1. 在“文档”窗格中，单击 **新文档** 图标。

1. 复制以下代码并将其粘贴到 **文档** 标签：

    ```JSON
    {
       "id": "1",
       "productId": "33218896",
       "category": "Women's Clothing",
       "manufacturer": "Contoso Sport",
       "description": "Quick dry crew neck t-shirt",
       "price": "14.99",
       "shipping": {
           "weight": 1,
           "dimensions": {
           "width": 6,
           "height": 8,
           "depth": 1
          }
       }
    }
    ```

1. 将 JSON 添加到“文档”选项卡后，单击 **保存**。

1. 在“文档”窗格中，单击 **新文档** 图标。

1. 复制以下代码并将其粘贴到 **文档** 标签：

    ```JSON
    {
        "id": "2",
        "productId": "33218897",
        "category": "Women's Outerwear",
        "manufacturer": "Contoso",
        "description": "Black wool pea-coat",
        "price": "49.99",
        "shipping": {
            "weight": 2,
            "dimensions": {
            "width": 8,
            "height": 11,
            "depth": 3
            }
        }
    }
    ```

1. 将 JSON 添加到“文档”选项卡后，单击 **保存**。

1. 你可以通过单击左侧菜单上的每个文档来查看已保存的每个文档。

### 任务 3：在 Azure 门户中运行查询。

1. 在 Azure 门户中，在 **文件** 屏幕中，单击 **新的 SQL 查询** 按钮。

    > **注**：出现查询 1 屏幕，显示查询 **SELECT * FROM c** 进行选择。

1. 编写返回 JSON 文件的查询，该文件显示 productId 1 的详细信息。

    ```SQL
    SELECT *
    FROM Products p
    WHERE p.id ="1"
    ```

1. 点击 **执行查询** 图标。返回以下结果

    ```JSON
    [
        {
            "id": "1",
            "productId": "33218896",
            "category": "Women's Clothing",
            "manufacturer": "Contoso Sport",
            "description": "Quick dry crew neck t-shirt",
            "price": "14.99",
            "shipping": {
                "weight": 1,
                "dimensions": {
                    "width": 6,
                    "height": 8,
                    "depth": 1
                }
            },
            "_rid": "I2YsALxG+-EBAAAAAAAAAA==",
            "_self": "dbs/I2YsAA==/colls/I2YsALxG+-E=/docs/I2YsALxG+-EBAAAAAAAAAA==/",
            "_etag": "\"0000844e-0000-1a00-0000-5ca79f840000\"",
            "_attachments": "attachments/",
            "_ts": 1554489220
        }
    ]
    ```

1. 在现有的查询窗口中。编写在 productId 的 JSON文件 中返回 id、manufacturer（制造商）和description（说明）的查询 

    ```SQL
    SELECT
        p.id,
        p.manufacturer,
        p.description
    FROM Products p
    WHERE p.id ="1"
    ```

1. 点击 **执行查询** 图标。返回以下结果

    ```JSON
    [
    {
        "id": "1",
        "manufacturer": "Contoso Sport",
        "description": "Quick dry crew neck t-shirt"
    }
    ]
    ```

1. 在现有查询窗口中，编写按价格升序返回所有产品的价格、说明和产品 ID 的查询。

    ```SQL
    SELECT p.price, p.description, p.productId
    FROM Products p
    ORDER BY p.price ASC
    ```

1. 点击 **执行查询** 图标。返回以下结果

    ```JSON
    [
        {
            "price": "14.99",
            "description": "Quick dry crew neck t-shirt",
            "productId": "33218896"
        },
        {
            "price": "49.99",
            "description": "Black wool pea-coat",
            "productId": "33218897"
        }
    ]
    ```

### 任务 4：对数据运行复杂的操作

1. 在 Azure 门户中，在 **文件** 屏幕中，单击 **新的存储流程** 按钮。

    > **注**：将出现显示示例存储过程的新存储流程屏幕。

1. 在“新存储流程”屏幕中，在 **存储流程 ID** 文本框中输入 **createMyDocument**。

1. 使用以下代码在存储流程体中创建存储流程。

    ```Javascript
    function createMyDocument() {
        var context = getContext();
        var collection = context.getCollection();

        var doc = {
            "id": "3",
            "productId": "33218898",
            "description": "Contoso microfleece zip-up jacket",
            "price": "44.99"
        };

        var accepted = collection.createDocument(collection.getSelfLink(),
            doc,
            function (err, documentCreated) {
                if (err) throw new Error('Error' + err.message);
                context.getResponse().setBody(documentCreated)
            });
        if (!accepted) return;
}
    ```

1. 在“新存储流程”屏幕中，单击 **保存**。

1. 在“新存储流程”屏幕中，单击 **执行**。

1. 在“输入参数”屏幕中，在 **分区键值** 文本框中输入 **33218898**，然后单击 **执行**。

返回以下结果

    ```JSON
    {
        "id": "3",
        "productId": "33218898",
        "description": "Contoso microfleece zip-up jacket",
        "price": "44.99",
        "_rid": "I2YsALxG+-EDAAAAAAAAAA==",
        "_self": "dbs/I2YsAA==/colls/I2YsALxG+-E=/docs/I2YsALxG+-EDAAAAAAAAAA==/",
        "_etag": "\"0000874e-0000-1a00-0000-5ca7a7050000\"",
        "_attachments": "attachments/"
    }
    ```

1. 在 Azure 门户中，在 **文档** 屏幕中，单击下拉按钮 **新存储流程** 并单击 **新 UDF**。

    > **注**：将出现显示 **function userDefinedFunction(){}** 的新 UDF 1 屏幕

1. 在“新存储流程”屏幕中，在 **用户定义的功能 ID** 文本框中输入 **producttax**。

1. 使用以下代码在存储流程体中创建存储流程。

    ```Javascript
    function producttax(price) {
        if (price == undefined) 
            throw 'no input';

        var amount = parseFloat(price);

        if (amount < 1000) 
            return amount * 0.1;
        else if (amount < 10000) 
            return amount * 0.2;
        else
            return amount * 0.4;
    }
    ```

1. 在 New UDF 1 屏幕中，单击 **保存**。

1. 单击“查询 1”选项卡，然后使用以下查询替换现有查询：

    ```SQL
    SELECT c.id, c.productId, c.price, udf.producttax(c.price) AS producttax FROM c
    ```

1. 在“查询 1”屏幕中，单击 **执行查询**。

返回以下结果

    ```JSON
    [
        {
            "id": "1",
            "productId": "33218896",
            "price": "14.99",
            "producttax": 1.499
        },
        {
            "id": "2",
            "productId": "33218897",
            "price": "49.99",
            "producttax": 4.9990000000000005
        },
        {
            "id": "3",
            "productId": "33218898",
            "price": "44.99",
            "producttax": 4.4990000000000005
        }
    ]
    ```

## 练习 3：在 Visual Studio Code 中为 Azure Cosmos DB 构建 .NET Core 应用

预计用时：45 分钟

个人练习

本练习的主要任务如下：

1. 在 Visual Studio Code 中启用 Azure Cosmos DB 资源

1. 在 Visual Studio 代码中设置应用程序

1. 以编程方式创建、读取、更新和删除 NoSQL 数据

1. 使用 Azure Cosmos DB .NET Core SDK 进行查询

1. 从你的应用程序创建和运行存储的流程

### 任务 1：在 Visual Studio Code 中启用 Azure Cosmos DB 资源

1. 打开 Visual Studio 代码。

1. 在左侧菜单中，单击扩展按钮。

1. 在“市场中的搜索扩展”文本框中，输入 **Cosmos DB** 并点击 **Azure Cosmos DB**。Visual Studio 代码中出现一个文档，然后单击 **安装**

    > **注**：安装扩展时会出现移动条。然后，一旦完成安装，则出现勾号。

1. 安装完成后，单击 **刷新**。

1. 在“市场中的搜索扩展”文本框中，输入 **Azure 帐户** 并单击 **Azure 帐户扩展**。Visual Studio 代码中出现一个文档，然后单击 **安装**

    > **注**：安装扩展时会出现移动条。然后，一旦完成安装，则出现勾号。

1. 安装完成后，单击 **刷新**。

1. 在 Visual Studio Code 中，通过单击 **视图**、**命令板** 并输入 **Azure：登录** 来登录 Azure。

    > **注**：按照 web 浏览器中的提示选择对 Visual Studio 代码会话进行身份验证的帐户。浏览器中的消息将确认你已登录。你可以关闭此选项卡。

1. 在 Visual Studio Code 中，单击 Cosmos DB 下左侧菜单中的 **Azure 图标**，右键单击你的订阅，然后单击 **创建帐号**。

1. 在 Visual Studio Code 中，出现 **打开文件夹** 对话框。

1. 在你选择的位置创建名为 **学习模块** 的新文件夹，然后单击 **选择文件夹**。

    > **注**：此时，Visual Studio Code 可能会在你设置工作文件夹时重新启动。因此，你必须重新打开实验室文档。

1. 在 Visual Studio Code 中，单击 **Cosmos DB** 下左侧菜单中的 **Azure 图标**，右键单击你的 **订阅**，然后单击 **创建帐号**。

1. 在屏幕顶部名为 **创建新的 Cosmos DB 帐户** 的文本框中输入你的 Azure Cosmos DB 帐户的唯一名称 **xxcosmos**，其中 xx 是你的姓名缩写，然后按下键盘上的 **Enter**。

1. 接下来，选择 **SQL（DocumentDB）**，然后选择 **awrgstudxx** 资源组，然后选择离你最近的 **位置**。

    > **注**：Visual Studio Code 底部将显示一栏，说明“创建 Cosmos DB 帐户...”，大约需要 5 分钟。该栏将更改为说明创建已成功。

1. 创建帐户后，在 Azure 中展开 Azure 订阅：Cosmos DB 窗格和扩展显示新的 Azure Cosmos DB 帐户。

1. 右键单击新帐户，然后单击 **创建数据库**。

1. 在屏幕顶部的输入调色板中，针对数据库名称输入 **用户** 并按下 **Enter**。

1. 针对集合名称输入 **WebCustomers** 并按下 **Enter**。

1. 对于分区键输入 **用户 Id** 并按下 **Enter**。

1. 最后，确认初始吞吐量是否为 **1000** 并按下 **Enter**。

1. 在 Azure 中展开帐户：将显示 Cosmos DB 窗格、新的用户数据库和 WebCustomers 集合。

### 任务 2：在 Visual Studio 代码中设置应用程序

1. 单击 **文件** 菜单并检查 **自动保存**（如果其为空白），从而确保启用了文件自动保存。你将复制几个代码块，这将确保你始终对文件进行最新编辑的操作。

1. 通过从主菜单选择 **视图**、**终端** 来从 Visual Studio Code 打开集成终端。

1. 单击终端窗口，按下键盘上的 **Enter**，然后复制并粘贴以下命令。

    ```bash
    dotnet new console
    ```

    > **注**：此命令在你的 **学习模块** 文件夹中创建了 Program.cs 文件，其中已写入基本的“Hello World”程序以及名为 learning-module.csproj 的 C# 项目文件。

1. 在终端窗口中，复制并粘贴以下命令以运行 **“Hello World!”** 程序。

    ```bash
    dotnet run
    ```

1. 在终端提示符下，复制并粘贴以下命令块以安装所需的 NuGet 包。

    ```bash
    dotnet add package System.Net.Http
    dotnet add package System.Configuration
    dotnet add package System.Configuration.ConfigurationManager
    dotnet add package Microsoft.Azure.DocumentDB.Core
    dotnet add package Newtonsoft.Json
    dotnet add package System.Threading.Tasks
    dotnet add package System.Linq
    dotnet restore
    ```

1. 终端屏幕将加载包并在 **dotnet 还原** 结束时显示命令，在终端窗口按下 **Enter**。

1. 在资源管理器窗格的顶部，单击 **Program.cs** 打开文件。在 **使用系统** 手添加以下使用语句。

    ```C#
    using System.Configuration;
    using System.Linq;
    using System.Threading.Tasks;
    using System.Net;
    using Microsoft.Azure.Documents;
    using Microsoft.Azure.Documents.Client;
    using Newtonsoft.Json;
    ```

> **重要事项**：等待大约 15 秒，直到你接收有关添加所需缺失资产的消息为止，单击 **是**。

1. 在 learning-module 文件夹中，创建名为 **App.config** 的新文件，并添加以下代码：

    ```XML
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
          <appSettings>
            <add key="accountEndpoint" value="<replace with your Endpoint URL>" />
            <add key="accountKey" value="<replace with your Primary Key>" />
          </appSettings>
    </configuration>
    ```

1. 通过单击左侧的 **Azure 图标** 复制连接字符串，扩展你的订阅，**右键单击新的 Azure Cosmos DB 帐户**，然后单击 **复制连接字符串**。

1. 将连接字符串粘贴到 App.config 文件的末尾，然后从连接字符串将 **AccountEndpoint** 部分复制到 App.config 中的 **accountEndpoint** 值。

1. 现在从连接字符串将 **AccountKey** 值复制到 **accountKey** 值，然后 **删除你复制的原始连接字符串**。

1. 你的最终 App.config 文件显示为这样。

    ```XML
    <?xml version="1.0" encoding="utf-8"?>
        <configuration>
          <appSettings>
            <add key="accountEndpoint" value="https://my-account.documents.azure.com:443/" />
            <add key="accountKey" value="6e7sRxunccGEeO7IVlMdeFt5BdsllfSGLYc28KyjzkESiCu7tfWbTaZXAErt2v88gOcMbOYgwp1q4NYDifD7ew==" />
          </appSettings>
    </configuration>
    ```

1. 在终端提示符下，复制并粘贴以下命令以运行该程序。

    ```bash
    dotnet run
    ```

    > **注**：该程序在终端显示 Hello World！。

1. 在“资源管理器”窗格中，单击 Program.cs 以打开该文件。将以下内容添加到程序类的开始。

    ```C#
    private DocumentClient client;
    ```

1. 添加新的异步任务以创建新客户端，并通过在主要方法后添加以下方法来检查用户数据库是否存在。

    ```C#
    private async Task BasicOperations（）
    {
        this.client = new DocumentClient(new Uri(ConfigurationManager.AppSettings["accountEndpoint"]), ConfigurationManager.AppSettings["accountKey"]);

        await this.client.CreateDatabaseIfNotExistsAsync(new Database { Id = "Users" });

        await this.client.CreateDocumentCollectionIfNotExistsAsync(UriFactory.CreateDatabaseUri("Users"), new DocumentCollection { Id = "WebCustomers" });

        Console.WriteLine("Database and collection validation complete");
    }
    ```

1. 在集成终端中，再次复制并粘贴以下命令以运行程序，从而确保代码运行。“Hello World!”返回至控制台。

    ```bash
    dotnet run
    ```

1. 将以下代码复制并粘贴到主要方法中，覆盖当前 **Console.WriteLine(”Hello World!”);** 代码：

    ```C#
    try
    {
        Program p = new Program();
        p.BasicOperations().Wait();
    }
    catch (DocumentClientException de)
    {
        Exception baseException = de.GetBaseException();
        Console.WriteLine("{0} error occurred: {1}, Message: {2}", de.StatusCode, de.Message, baseException.Message);
    }
    catch (Exception e)
    {
        Exception baseException = e.GetBaseException();
        Console.WriteLine("Error: {0}, Message: {1}", e.Message, baseException.Message);
    }
    finally
    {
        Console.WriteLine("End of demo, press any key to exit.");
        Console.ReadKey();
    }
    ```

1. 在集成终端中，再次复制并粘贴以下命令以运行程序，从而确保代码运行。

    ```bash
    dotnet run
    ```

1. 应显示以下结果

    ```bash
    Database and collection validation complete
    End of demo, press any key to exit.
    ```

> **结果** 在本练习中，你已创建可连接到 Azure Cosmos DB 的客户端应用程序

### 任务 3：以编程方式创建、读取、更新和删除 NoSQL 数据

#### 创建文档

1. 创建一个 **用户** 类，其表示待存储在 Azure Cosmos DB 中的对象。我们也将创建在 **用户** 中使用的 **OrderHistory** 和 **ShippingPreference** 类 。注：文档必须具有在 JSON 中被序列化为 id 的 Id 属性。

1. 为了创建这些类，请将以下 **用户**、**OrderHistory**、**ShippingPreference** 和 **CouponsUsed** 类复制并粘贴到 **BasicOperations** 方法下。

    ```C#
    公共类用户
    {
        [JsonProperty("id")]
        public string Id { get; set; }
        [JsonProperty("userId")]
        public string UserId { get; set; }
        [JsonProperty("lastName")]
        public string LastName { get; set; }
        [JsonProperty("firstName")]
        public string FirstName { get; set; }
        [JsonProperty("email")]
        public string Email { get; set; }
        [JsonProperty("dividend")]
        public string Dividend { get; set; }
        [JsonProperty("OrderHistory")]
        public OrderHistory[] OrderHistory { get; set; }
        [JsonProperty("ShippingPreference")]
        public ShippingPreference[] ShippingPreference { get; set; }
        [JsonProperty("CouponsUsed")]
        public CouponsUsed[] Coupons { get; set; }
        public override string ToString()
        {
            return JsonConvert.SerializeObject(this);
        }
    }

    public class OrderHistory
    {
        public string OrderId { get; set; }
        public string DateShipped { get; set; }
        public string Total { get; set; }
    }

    public class ShippingPreference
    {
        public int Priority { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string Country { get; set; }
    }

    public class CouponsUsed
    {
        public string CouponCode { get; set; }

    }

    private void WriteToConsoleAndPromptToContinue(string format, params object[] args)
    {
        Console.WriteLine(format, args);
        Console.WriteLine("Press any key to continue ...");
        Console.ReadKey();
    }
    ```

1. 在集成终端中，再次复制并粘贴以下命令以运行程序，从而确保代码运行。

    ```bash
    dotnet run
    ```

1. 应显示以下结果

    ```text
    Database and collection validation complete
    End of demo, press any key to exit.
    ```

1. 现在将 **CreateUserDocumentIfNotExists** 任务复制并粘贴到 Program.cs 文件末尾的 **WriteToConsoleAndPromptToContinue** 下。

    ```C#
    private async Task CreateUserDocumentIfNotExists(string databaseName, string collectionName, User user)
    {
        try
        {
            await this.client.ReadDocumentAsync(UriFactory.CreateDocumentUri(databaseName, collectionName, user.Id), new RequestOptions { PartitionKey = new PartitionKey(user.UserId) });
            this.WriteToConsoleAndPromptToContinue("User {0} already exists in the database", user.Id);
        }
        catch (DocumentClientException de)
        {
            if (de.StatusCode == HttpStatusCode.NotFound)
            {
                await this.client.CreateDocumentAsync(UriFactory.CreateDocumentCollectionUri(databaseName, collectionName), user);
                this.WriteToConsoleAndPromptToContinue("Created User {0}", user.Id);
            }
            else
            {
                throw;
            }
        }
    }
    ```

1. 然后，返回 **BasicOperations** 方法并将以下内容添加到该方法的末尾。

    ```C#
    User yanhe = new User
    {
        Id = "1",
        UserId = "yanhe",
        LastName = "He",
        FirstName = "Yan",
        Email = "yanhe@contoso.com",
        OrderHistory = new OrderHistory[]
            {
                new OrderHistory {
                    OrderId = "1000",
                    DateShipped = "08/17/2018",
                    Total = "52.49"
                }
            },
            ShippingPreference = new ShippingPreference[]
            {
                    new ShippingPreference {
                            Priority = 1,
                            AddressLine1 = "90 W 8th St",
                            City = "New York",
                            State = "NY",
                            ZipCode = "10001",
                            Country = "USA"
                    }
            },
    };

    await this.CreateUserDocumentIfNotExists("Users", "WebCustomers", yanhe);

    User nelapin = new User
    {
        Id = "2",
        UserId = "nelapin",
        LastName = "Pindakova",
        FirstName = "Nela",
        Email = "nelapin@contoso.com",
        Dividend = "8.50",
        OrderHistory = new OrderHistory[]
        {
            new OrderHistory {
                OrderId = "1001",
                DateShipped = "08/17/2018",
                Total = "105.89"
            }
        },
            ShippingPreference = new ShippingPreference[]
        {
            new ShippingPreference {
                    Priority = 1,
                    AddressLine1 = "505 NW 5th St",
                    City = "New York",
                    State = "NY",
                    ZipCode = "10001",
                    Country = "USA"
            },
            new ShippingPreference {
                    Priority = 2,
                    AddressLine1 = "505 NW 5th St",
                    City = "New York",
                    State = "NY",
                    ZipCode = "10001",
                    Country = "USA"
            }
        },
        Coupons = new CouponsUsed[]
        {
            new CouponsUsed{
                CouponCode = "Fall2018"
            }
        }
    };

    await this.CreateUserDocumentIfNotExists("Users", "WebCustomers", nelapin);
    ```

1. 在集成终端中，再次复制并粘贴以下命令以运行程序，从而确保代码运行。

    ```bash
    dotnet run
    ```

1. 应显示以下结果

    ```text
    Database and collection validation complete
    Created User 1
    Press any key to continue ...
    Created User 2
    Press any key to continue ...
    End of demo, press any key to exit.
    ```

#### 读取文档

1. 为了从数据库中读取文档，请将以下代码复制并置于 Program.cs 文件中的 **WriteToConsoleAndPromptToContinue** 方法后。

    ```C#
    private async Task ReadUserDocument(string databaseName, string collectionName, User user)
    {
        try
        {
            await this.client.ReadDocumentAsync(UriFactory.CreateDocumentUri(databaseName, collectionName, user.Id), new RequestOptions { PartitionKey = new PartitionKey(user.UserId) });
            this.WriteToConsoleAndPromptToContinue("Read user {0}", user.Id);
        }
        catch (DocumentClientException de)
        {
            if (de.StatusCode == HttpStatusCode.NotFound)
            {
                this.WriteToConsoleAndPromptToContinue("User {0} not read", user.Id);
            }
            else
            {
                throw;
            }
        }
    }
    ```

1. 将以下代码复制并粘贴到 BasicOperations 方法末尾的 **await this.CreateUserDocumentIfNotExists(”Users”, “WebCustomers”, nelapin);** 行后面：

    ```C#
    await this.ReadUserDocument("Users", "WebCustomers", yanhe);
    ```

1. 在集成终端中，再次复制并粘贴以下命令以运行程序，从而确保代码运行。

    ```bash
    dotnet run
    ```

1. 应显示以下结果

    ```text
    Database and collection validation complete
    User 1 already exists in the database
    Press any key to continue ...
    User 2 already exists in the database
    Press any key to continue ...
    Read user 1
    Press any key to continue ...
    End of demo, press any key to exit.
    ```

#### 更换文档

1. 将 **ReplaceUserDocument** 方法复制并粘贴到 Program.cs 文件的 **ReadUserDocument** 方法后。

    ```C#
    private async Task ReplaceUserDocument(string databaseName, string collectionName, User updatedUser)
    {
        try
        {
            await this.client.ReplaceDocumentAsync(UriFactory.CreateDocumentUri(databaseName, collectionName, updatedUser.Id), updatedUser, new RequestOptions { PartitionKey = new PartitionKey(updatedUser.UserId) });
            this.WriteToConsoleAndPromptToContinue("Replaced last name for {0}", updatedUser.LastName);
        }
        catch (DocumentClientException de)
        {
            if (de.StatusCode == HttpStatusCode.NotFound)
            {
                this.WriteToConsoleAndPromptToContinue("User {0} not found for replacement", updatedUser.Id);
            }
            else
            {
                throw;
            }
        }
    }
    ```

1. 将以下代码复制并粘贴到 **BasicOperations** 方法末尾的 **await this.CreateUserDocumentIfNotExists(”Users”, “WebCustomers”, nelapin);** 行后面。

    ```C#
    yanhe.LastName = "Suh";
    await this.ReplaceUserDocument("Users", "WebCustomers", yanhe);
    ```

1. 在集成终端中，再次复制并粘贴以下命令以运行程序，从而确保代码运行。

    ```bash
    dotnet run
    ```

1. 应显示以下结果

    ```text
        Database and collection validation complete
        User 1 already exists in the database
        Press any key to continue ...
         User 2 already exists in the database
        Press any key to continue ...
         Replaced last name for Suh
        Press any key to continue ...
         Read user 1
        Press any key to continue ...
         End of demo, press any key to exit
    ```

#### 删除文档

1. 将 **DeleteUserDocument** 方法复制并粘贴到 **ReplaceUserDocument** 方法下。

    ```C#
    private async Task DeleteUserDocument(string databaseName, string collectionName, User deletedUser)
    {
        try
        {
            await this.client.DeleteDocumentAsync(UriFactory.CreateDocumentUri(databaseName, collectionName, deletedUser.Id), new RequestOptions { PartitionKey = new PartitionKey(deletedUser.UserId) });
            Console.WriteLine("Deleted user {0}", deletedUser.Id);
        }
        catch (DocumentClientException de)
        {
            if (de.StatusCode == HttpStatusCode.NotFound)
            {
                this.WriteToConsoleAndPromptToContinue("User {0} not found for deletion", deletedUser.Id);
            }
            else
            {
                throw;
            }
        }
    }
    ```

1. 将以下代码复制并粘贴到 **BasicOperations** 方法结尾。

    ```C#
    await this.DeleteUserDocument("Users", "WebCustomers", yanhe);
    ```

1. 在集成终端中，再次复制并粘贴以下命令以运行程序，从而确保代码运行。

    ```bash
    dotnet run
    ```

1. 应显示以下结果

    ```text
    Database and collection validation complete
    User 1 already exists in the database
    Press any key to continue ...
        User 2 already exists in the database
    Press any key to continue ...
        Replaced last name for Suh
    Press any key to continue ...
        Read user 1
    Press any key to continue ...
        Deleted user 1
    End of demo, press any key to exit.
    ```

### 任务 4：使用 Azure Cosmos DB .NET Core SDK 进行查询

1. 以下示例显示如何使用 .NET 代码在 SQL、LINQ 或 LINQ lambda 中执行查询。复制代码并将其添加到 Program.cs 文件末尾的 **private async Task CreateUserDocumentIfNotExists** 后。

    ```C#
    private void ExecuteSimpleQuery(string databaseName, string collectionName)
    {
        //设置一些常见的查询选项
        FeedOptions queryOptions = new FeedOptions { MaxItemCount = -1, EnableCrossPartitionQuery = true };

        //在此我们通过他们的 LastName 找到 nelapin
        IQueryable<User> userQuery = this.client.CreateDocumentQuery<User>(
                UriFactory.CreateDocumentCollectionUri(databaseName, collectionName), queryOptions)
                .Where(u => u.LastName == "Pindakova");

        //在此同步执行查询，但也可以通过 IDocumentQuery<T> 接口异步执行
        Console.WriteLine("Running LINQ query...");
        foreach (User user in userQuery)
        {
            Console.WriteLine("\tRead {0}", user);
        }

        //现在通过直接 SQL 执行相同的查询
        IQueryable<User> userQueryInSql = this.client.CreateDocumentQuery<User>(
                UriFactory.CreateDocumentCollectionUri(databaseName, collectionName),
                "SELECT * FROM User WHERE User.lastName = 'Pindakova'", queryOptions );

        Console.WriteLine("Running direct SQL query...");
        foreach (User user in userQueryInSql)
        {
                Console.WriteLine("\tRead {0}", user);
        }

        Console.WriteLine("Press any key to continue ...");
        Console.ReadKey();
    }
    ```

1. 将以下代码复制并粘贴到 BasicOperations 方法的 **await this.DeleteUserDocument(”Users”, “WebCustomers”, yanhe);** 行前面。

    ```C#
    this.ExecuteSimpleQuery("Users", "WebCustomers");
    ```

1. 在集成终端中，再次复制并粘贴以下命令以运行程序，从而确保代码运行。

    ```bash
    dotnet run
    ```

1. 应显示以下结果

    ```text
    Database and collection validation complete
    Created User 1
    Press any key to continue ...
     User 2 already exists in the database
    Press any key to continue ...
     Replaced last name for Suh
    Press any key to continue ...
     Read user 1
    Press any key to continue ...
     Running LINQ query...
            Read {"id":"2","userId":"nelapin","lastName":"Pindakova","firstName":"Nela","email":"nelapin@contoso.com","dividend":"8.50","OrderHistory":[{"OrderId":"1001","DateShipped":"08/17/2018","Total":"105.89"}],"ShippingPreference":[{"Priority":1,"AddressLine1":"505 NW 5th St","AddressLine2":null,"City":"New York","State":"NY","ZipCode":"10001","Country":"USA"},{"Priority":2,"AddressLine1":"505 NW 5th St","AddressLine2":null,"City":"New York","State":"NY","ZipCode":"10001","Country":"USA"}],"CouponsUsed":[{"CouponCode":"Fall2018"}]}
    Running direct SQL query...
            Read {"id":"2","userId":"nelapin","lastName":"Pindakova","firstName":"Nela","email":"nelapin@contoso.com","dividend":"8.50","OrderHistory":[{"OrderId":"1001","DateShipped":"08/17/2018","Total":"105.89"}],"ShippingPreference":[{"Priority":1,"AddressLine1":"505 NW 5th St","AddressLine2":null,"City":"New York","State":"NY","ZipCode":"10001","Country":"USA"},{"Priority":2,"AddressLine1":"505 NW 5th St","AddressLine2":null,"City":"New York","State":"NY","ZipCode":"10001","Country":"USA"}],"CouponsUsed":[{"CouponCode":"Fall2018"}]}
    Press any key to continue ...
     Deleted user 1
    End of demo, press any key to exit.
    ```

### 任务 5：从你的应用程序创建和运行存储的流程

1. 在 Visual Studio Code 中，在 **Azure：Cosmos DB 选项卡** 中，扩展你的 **Azure Cosmos 数据库帐户**、**用户**，然后扩展 **WebCustomers**，然后右键单击 **存储流程**，然后单击 **创建存储流程**。

1. 在屏幕顶部的文本框中，输入 **UpdateOrderTotal** 然后按下 Enter，为存储流程命名。

    > **注**：默认情况下，提供检索第一项的存储流程。如果未提供，则执行以下步骤：

1. 在 **Azure：Cosmos DB 选项卡** 中，扩展 **存储流程** 并单击 **UpdateOrderTotal**。

1. 为了从应用程序运行此默认存储流程，请将以下代码添加到 **Program.cs** 文件中，作为 **类程序** 后的第一个条目。

    ```C#
    public async Task RunStoredProcedure(string databaseName, string collectionName, User user)
    {
        await client.ExecuteStoredProcedureAsync<string>(UriFactory.CreateStoredProcedureUri(databaseName, collectionName, "UpdateOrderTotal"), new RequestOptions { PartitionKey = new PartitionKey(user.UserId) });
        Console.WriteLine("Stored procedure complete");
    }
    ```

1. 复制以下代码并将其粘贴到 BasicOperations 方法中的 await this.DeleteUserDocument(”Users”, “WebCustomers”, yanhe); 行前面。

    ```C#
    await this.RunStoredProcedure("Users", "WebCustomers", yanhe);
    ```

1. 在集成终端中，再次复制并粘贴以下命令以运行程序，从而确保代码运行。

    ```bash
    dotnet run
    ```

1. 应显示以下结果

    ```text
    Database and collection validation complete
    Created User 1
    Press any key to continue ...
     User 2 already exists in the database
    Press any key to continue ...
     Replaced last name for Suh
    Press any key to continue ...
     Read user 1
    Press any key to continue ...
     Running LINQ query...
            Read {"id":"2","userId":"nelapin","lastName":"Pindakova","firstName":"Nela","email":"nelapin@contoso.com","dividend":"8.50","OrderHistory":[{"OrderId":"1001","DateShipped":"08/17/2018","Total":"105.89"}],"ShippingPreference":[{"Priority":1,"AddressLine1":"505 NW 5th St","AddressLine2":null,"City":"New York","State":"NY","ZipCode":"10001","Country":"USA"},{"Priority":2,"AddressLine1":"505 NW 5th St","AddressLine2":null,"City":"New York","State":"NY","ZipCode":"10001","Country":"USA"}],"CouponsUsed":[{"CouponCode":"Fall2018"}]}
    Running direct SQL query...
            Read {"id":"2","userId":"nelapin","lastName":"Pindakova","firstName":"Nela","email":"nelapin@contoso.com","dividend":"8.50","OrderHistory":[{"OrderId":"1001","DateShipped":"08/17/2018","Total":"105.89"}],"ShippingPreference":[{"Priority":1,"AddressLine1":"505 NW 5th St","AddressLine2":null,"City":"New York","State":"NY","ZipCode":"10001","Country":"USA"},{"Priority":2,"AddressLine1":"505 NW 5th St","AddressLine2":null,"City":"New York","State":"NY","ZipCode":"10001","Country":"USA"}],"CouponsUsed":[{"CouponCode":"Fall2018"}]}
    Press any key to continue ...
     Stored procedure complete
    Deleted user 1
    End of demo, press any key to exit.
   ```

> **结果** 在本练习中，你通过设置 Visual Studio code 从头开始构建控制台应用程序，以连接 Azure Cosmos DB。然后，你创建了 .Net 代码，以编程方式创建、读取、更新和删除 NoSQL 数据。然后，你添加了用于查询 Cosmos DB 的代码，并学习了如何创建编程对象（如存储流程）以运行 Cosmos DB

## 练习 4：使用 Azure Cosmos DB 全局分布数据

预计用时：15 分钟

个人练习

本练习的主要任务如下：

1. 将数据复制到多个区域

1. 管理故障转移

### 任务 1：将数据复制到多个区域

1. 在 Microsoft Edge 中，单击说明 **数据资源管理器 - Microsoft** 的选项卡。

1. 如果出现指示“连接错误”的消息，请单击 **刷新** 按钮。

1. 在 **awcdbstudxx - 数据资源管理器** 窗口中，单击 **全球复制数据**

1. 在世界地图上，单击你所在大陆内的数据中心位置，然后单击 **保存**。

> **注**  配置额外的数据中心大约需要 7 分钟

### 任务 2：管理故障转移。

1. 在 **awcdbstudxx - 全球复制数据** 窗口中，单击 **手动故障转移**。

1. 单击 **读取区域** 数据中心位置并单击 **OK**。

> **注**  手动故障转移大约需要 3 分钟。

1. 在 **awcdbstudxx - 全球复制数据** 窗口中，单击 **自动故障转移**

1. 在“自动故障转移”屏幕中，单击 **打开** 按钮，然后单击 **OK**。

> **注**  自动故障转移的设置大约需要 3 分钟。
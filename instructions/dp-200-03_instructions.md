---
lab:
    title: '通过 Azure Databricks 启用基于团队的数据科学'
    module: '模块 3:利用 Azure Databricks 实现基于团队的数据科学'
---

# DP 200 - 实施数据平台解决方案
# 实验室 3 - 通过 Azure Databricks 启用基于团队的数据科学

**预计用时**：75 分钟

**先决条件**：假设已阅读了本实验室的案例研究。假设模块 1 的内容和实验室：数据工程师的 Azure 也已完成

**实验室文件**：本实验的文件位于 _Allfiles\Labfiles\Starter\DP-200.3_ 文件夹。

## 实验室概述

在本实验室课程结束时，学生将能够解释为什么 Azure Databricks 可用于帮助数据科学项目。学生将预配 Azure Databricks 实例，然后创建工作区，用于执行 Data Lake Store Gen2 存储中简单的数据准备任务。最后，学生将使用 Azure Databricks 按步骤实行转换。

## 实验室目标
  
完成本实验室课程后，你将能够：

1. 解释 Azure Databricks
1. 使用 Azure Databricks
1. 使用 Azure Databricks 读取数据
1. 使用 Azure Databricks 执行转换

## 方案
  
为了响应信息服务 (IS) 部门，你将通过列出使用该技术的益处开始构建预测分析平台的过程。数据科学家将加入该部门，他们希望确保新团队成员可以使用预测分析环境。

你将建立并预配 Azure Databricks 环境，然后通过从预先存在的 Data Lake Storage Gen2 帐户中引入数据，在服务上执行简单的数据准备例程来测试此环境是否正常工作。作为一名数据工程师，已经向你表明，你可能需要帮助数据科学家执行数据准备练习。为此，我们建议你浏览一下可以帮助你执行基本转换的笔记本。

在本实验室课程结束时，你将学习：

1. 解释 Azure Databricks
1. 使用 Azure Databricks
1. 使用 Azure Databricks 读取数据
1. 使用 Azure Databricks 执行转换

> **重要事项**：在完成本实验室课程时，请记下你在任何预配或配置任务中遇到的任何问题，并将其记录在位于 _\Labfiles\DP-200-Issues-Doc.docx_ 的文档的表格中。记录实验室编号和技术，说明问题以及解决方案的内容。请保存该文档，以便在后面的模块中参考。

## 练习 1：解释 Azure Databricks

>**重要事项**：首先执行 **练习 2**，并在练习 2 中开始创建 Databricks 群集后返回练习 1，预配需要 10 分钟。

预计用时：15 分钟

个人练习
  
本练习的主要任务如下：

1. 根据你在本课程中学到的内容，确定 Azure Databricks 需满足的数字转换要求以及 Azure Databricks 的候选数据源。

1. 讲师将与小组讨论结果。

### 任务 1：定义数字转换和候选数据源。

1. 从实验室虚拟机中，启动 **Microsoft Word**，然后从 **Allfiles\Labfiles\Starter\DP-200.3** 文件夹中打开文件 **DP-200-Lab03-Ex01.docx**。

1. 花 **10 分钟** 记录案例研究和本实验室场景中概述的数字转换要求和候选数据源。

### 任务 2：与讲师讨论结果

1. 讲师将让小组停下来讨论结果。

> **结果**：完成本练习后，你已创建一个 Microsoft Word 文档，该文档标识 Azure Databricks 须满足的数字转换要求和候选数据源。

## 练习 2：使用 Azure Databricks
  
预计用时：20 分钟

个人练习
  
本练习的主要任务如下：

1. 在资源组中创建 Azure Databricks 高级定价层实例。

1. 打开 Azure Databricks

1. 启动 Databricks 工作区并创建 Spark 群集

### 任务 1：创建并配置 Azure Databricks 实例。

1. 在 Azure 门户网站的屏幕左上方，单击 **主页** 超链接。

1. 在 Azure 门户中，单击 **“+ 创建资源”** 按钮。

1. 在“新”屏幕中，导航到 **“搜索市场”** 文本框，然后输入单词 **databricks**。在显示的列表中单击 **Azure Databricks**。

1. 在 **“Azure Databricks”** 边栏选项卡中，点击 **“创建”**。

1. 在 **“Azure Databricks 服务”** 边栏选项卡中，使用以下设置创建 Azure Databricks 工作区：

    - **工作区名称**： **awdbwsstudxx**，其中 **xx** 是你的姓名缩写。

    - **订阅**：你在本实验室使用的订阅名称

    - **资源组**： **awrgstudxx**，其中 **xx** 是你的首字母缩写。

    - **“位置”**：最靠近实验室位置的 Azure 区域名称，在其中你能预配 Azure VM。

    - **定价层**： **高级（+ 基于角色的访问控制）**。

    - **在虚拟网络中部署 Azure Databricks 工作区**： **否**。

        ![在 Azure 门户中创建 Azure Databricks](Linked_Image_Files/M03-E02-T01-img01.png)

1. 在 **“Azure Databricks Service”** 边栏选项卡中，点击 **“创建”**。

   > **注意**：预配大约需要 3 分钟。Databricks Runtime 构建于 Apache Spark 上层，本身为 Azure 云而构建。Azure Databricks 完全移除了基础架构的复杂性以及建立和配置数据基础架构所需的专业知识。对于注重生产作业性能的数据工程师，Azure Databricks 通过 I/O 层和处理层 (Databricks I/O) 的各种优化提供了更快、更高效的 Spark 引擎。
   
### 任务 2：打开 Azure Databricks。

1. 确认已创建 Azure Databricks 服务。

1. 在 Azure 门户中，导航到 **“资源组”** 屏幕。

1. 在“资源组”屏幕中，单击 **“awrgstudxx”** 资源组，其中 **“xx”** 是你的姓名首字母缩写。

1. 在 **“awrgstudxx”** 屏幕中，单击 **“awdbwsstudxx”**，其中 **“xx”** 是用于打开 Azure Databricks 的你的姓名首字母缩写。这将打开你的 Azure Databricks 服务。

    ![Azure 门户中的 Azure Databricks 服务](Linked_Image_Files/M03-E02-T02-img01.png)

### 任务 3：启动 Databricks 工作区并创建 Spark 群集。

1. 在 Azure 门户中，在 **awdbwsstudxx** 屏幕中，点击按钮 **启动工作区**。

    > **注意**：你将在 Microsoft Edge 的单独标签页中登录 Azure Databricks 工作区。

1. 在 **“常见任务”** 下，单击 **“新群集”**。

1. 在 **“创建群集”** 屏幕中，在“新建群集”下，使用以下设置创建 Databricks 群集，然后单击 **“创建群集”**：

    - **群集名称**： **awdbclstudxx**，其中 **xx** 是你的姓名缩写。

    - **群集模式**： **标准**

    - **池**： **无**

    - **Databricks Runtime 版本**： **运行时：6.3 (Scala 2.11, Spark 2.4.4)**

    - 确保选中 **“不活动 60 分钟后终止”** 复选框。如果未使用群集，请提供终止群集的持续时间（以分钟为单位）。

    - 将所有剩余选项保留为当前设置。

        ![在 Azure 门户中创建 Azure Databricks 群集](Linked_Image_Files/M03-E02-T03-img01.png)

1. 在 **“创建群集”** 屏幕中，单击 **“创建群集”** 并打开 Microsoft Edge 屏幕。

> **注意**：创建 Azure Databricks 实例大约需要 10 分钟，因为图形用户界面简化了 Spark 群集的创建。你将注意到在创建群集时的 **“待执行”** 的 **状态**。当创建群集后，它将更改为 **“正在运行”**。

> **注意**：在创建群集时， **返回并执行练习 1**。

## 练习 3：使用 Azure Databricks 读取数据

预计用时：30 分钟

个人练习

本练习的主要任务如下：

1. 确认 Databricks 群集已创建。

1. 收集 Azure Data Lake Store Gen2 帐户名称

1. 让你的 Databricks 实例能够访问 Data Lake Gen2 Store。

1. 创建 Databricks 笔记本并连接到 Data Lake Store。

1. 读取 Azure Databricks 中的数据。

### 任务 1：确认 Databricks 群集的创建

1. 返回 Microsoft Edge，在 **“交互群集”** 下确认命名为 **“awdbclstudxx”** 的群集的状态列被设置为 **“运行”**，其中 **“xx”** 是你的姓名首字母缩写。

### 任务 2：收集 Azure Data Lake Store Gen2 帐户名称

1. 在 Microsoft Edge 中，单击 Azure 门户标签页，单击 **“资源组”**，然后单击 **“awrgstudxx”**，再单击 **“awdlsstudxx”**，其中 **“xx”** 是你的姓名缩写。

1. 在 **awdlsstudxx** 屏幕中的“设置”下，单击 **“访问键”**，然后单击 **“存储帐户名称”** 旁边的复制图标并将其粘贴到记事本中。

    ![前往 Azure 门户中 Data Lake Storage 帐户名](Linked_Image_Files/M03-E03-T02-img01.png)

### 任务 3：让你的 Databricks 实例能够访问 Data Lake Gen2 Store。

1. 在 Azure 门户中，单击 **“主页”** 超链接，然后单击 **“Azure 活动目录”** 图标。

1. 在 **“Microsoft - 概述”** 屏幕中，单击 **“应用注册”**。

1. 在 **Microsoft - 应用注册** 屏幕中，单击 **“+ 新注册”** 按钮。

1. 在“注册应用程序”屏幕中，提供 **DLAccess** 的 **名称**，并在 **重定向 URI（可选）** 部分下，确保选中 **Web**，然后键入 **https://adventure works.com/exampleapp** 作为应用程序值。设置值之后。

    ![在 Azure 门户中注册应用程序](Linked_Image_Files/M03-E03-T03-img01.png)

1. 单击 **“注册”**。将出现 DLAccess 屏幕。

1. 在 **DLAccess** 注册应用程序屏幕中，复制 **应用程序（客户端）ID** 和 **目录（租户）ID**，并将两者粘贴到记事本中。

1. 在 **“已注册 DLAccess 的应用”** 屏幕，单击 **“证书和密钥”**，然后单击 **“+ 新建客户端密钥”**

1. 在“添加客户端密钥”屏幕，输入 **“DL Access密钥”** 的 **“说明”**，以及密钥的 **“持续时间”** 为 **“1 年内”**。完成后，单击 **“添加”**。

    ![在 Azure 门户中添加客户端密码](Linked_Image_Files/M03-E03-T03-img02.png)

    >**重要提示**：当你单击 **“添加”** 时，密钥将如下图所示。你只有一次将此密钥值复制到记事本的机会

    ![DLAccess 密钥的位置](Linked_Image_Files/M03-E03-T03-img03.png)

1. 复制 **应用程序密钥值** 并将其粘贴到记事本中

1. 将存储 Blob 数据参与者权限分配给资源组。在 Azure 门户中，单击 **“主页”** 超链接，然后单击 **“资源组”** 图标，单击资源组 **“awrgstudxx”**，其中 **“xx”** 是你的姓名首字母缩写。

1. 在 **awrgstudxx** 屏幕中，单击 **“访问控制 (IAM)”** 

1. 单击 **“角色分配”** 标签页。 

1. 单击 **“+ 添加”**，然后单击 **“添加角色分配”**

1. 在 **“添加角色分配”** 边栏选项卡中，在“角色”下，选择 **“存储 Blob 数据参与者”**。

1. 在 **“添加角色分配”** 边栏选项卡中，在“选择”下，选择 **“DLAccess”**，然后单击 **“保存”**。

1. 在 Azure 门户中，单击 **“主页”** 超链接，然后单击 **Azure Active Directory** 图标，注意 **你的角色**。如果你具有“用户”角色，则必须确保非管理员可以注册应用程序。

1. 单击 **“用户”**，然后单击 **“用户 - 所有用户”** 边栏选项卡中的 **“用户设置”**，检查 **“应用注册”** 设置。该值只能由管理员设置。如果设置为“是”，则 Azure AD 租户中的任何用户都可以注册应用。 

1. 关闭 **用户 - 所有用户** 屏幕。

1. 在“Azure Active Directory”边栏选项卡中，单击 **“属性”**。

1. 单击 **“目录 ID”** 旁边的“复制”图标，获取你的租户 ID 并将其粘贴到记事本中。

1. 将记事本文档保存在 **Allfiles\Labfiles\Starter\DP-200.3** 文件夹中，名为 **DatabricksDetails.txt**

### 任务 4：创建 Databricks 笔记本并连接到 Data Lake Store。

1. 在 Microsoft Edge 中，单击标签页 **“群集 - Databricks”**

    > **注**：你将看到“群集”页面。

1. 在 Microsoft Edge 左侧的 Azure Databricks 边栏选项卡中，单机 **“工作区”** 下方，再单击 **“工作区”** 旁边的下拉菜单，然后转到 **“创建”**，再单击 **“笔记本”**。

1. 在 **“创建笔记本”** 屏幕中，旁边是名称类型 **“我的笔记本”**。

1. 在 **“语言”** 下拉列表旁边，选择 **“Scala”**。

1. 确保群集的名称是你之前创建的群集的名称，单击 **“创建”**

    ![在 Azure Databricks 中创建笔记本](Linked_Image_Files/M03-E03-T04-img01.png)

     > **注意**：这样将打开标题为“我的笔记本”(Scala) 的笔记本。

1. 在笔记本中，在单元格 **“Cmd 1”** 中，复制以下代码并将其粘贴到单元格中：

    ```scala
    //连接到 Azure Data Lake Storage Gen2 帐户

    spark.conf.set("fs.azure.account.auth.type", "OAuth")
    spark.conf.set("fs.azure.account.oauth.provider.type", "org.apache.hadoop.fs.azurebfs.oauth2.ClientCredsTokenProvider")
    spark.conf.set("fs.azure.account.oauth2.client.id.<storage-account-name>.dfs.core.windows.net", "<application-id>")
    spark.conf.set("fs.azure.account.oauth2.client.secret.<storage-account-name>.dfs.core.windows.net", "<authentication-key>")
    spark.conf.set("fs.azure.account.oauth2.client.endpoint.<storage-account-name>.dfs.core.windows.net", "https://login.microsoftonline.com/<tenant-id>/oauth2/token")
    ```

1. 在此代码块中，使用你之前采集并保存在记事本中的值替换此代码块中的 **application-id**、 **authentication-id**、 **tenant-id**、 **file-system-name** 和 **storage-account-name** 占位符值。

1. 在笔记本中，在 **“Cmd 1”** 下的单元格中，单击 **“运行”** 图标，然后单击 **“运行单元格”**，如下图所示。 

    ![在 Azure Databricks 中的笔记本中运行 cvode](Linked_Image_Files/M03-E03-T04-img02.png)

    >**注** 将在单元格底部返回消息，说明“命令花了 0.0X 秒 - 2019 年 4 月 4 日，下午 2:46:48 由人员在 awdbclstudxx 上执行”

### 任务 5：读取 Azure Databricks 中的数据。

1. 在笔记本中，将鼠标悬停在单元格 **Cmd 1** 右上角，然后点击 **“在下方添加单元格”** 图标。将出现一个名为 **Cmd2** 的新单元格。

    ![在 Azure Databricks 中的笔记本中添加单元格](Linked_Image_Files/M03-E03-T04-img03.png)

1. 在笔记本中，在单元格 **Cmd 2** 中，复制以下代码并将其粘贴到单元格中：

    ```scala
    //读取 Azure Data Lake Storage Gen2 文件系统中的 JSON 数据

    val df = spark.read.json("abfss://<file-system-name>@<storage-account-name>.dfs.core.windows.net/preferences.json")
    ```

1. 在此代码块中，使用 **logs** 一词替换 **file-system-name**，使用你之前采集并保存在记事本中的值替换此代码块中的 **storage-account-name** 占位符值。

1. 在笔记本中，在 **“Cmd 2”** 单元格中，点击 **“运行”** 图标，然后点击 **“运行单元格”**。 

    >**注** 将在单元格底部返回一条消息，说明 Spark 作业已执行，并且“命令花了 0.0X 秒 - 2019 年 4 月 4 日下午 2:46:48 由人员在 awdbclstudxx 上执行”

1. 在笔记本中，将鼠标悬停在单元格 **“Cmd 2”** 右上角，然后单击 **“在下方添加单元格”** 图标。将出现一个名为 **“Cmd3”** 的新单元格。

1. 在笔记本中，在单元格 **“Cmd 3”** 中，复制以下代码并将其粘贴到单元格中：

    ```scala
    //显示读取 JSON 文件的结果
  
    df.show()
    ```

    ![Azure Databricks 笔记本中的运行结果](Linked_Image_Files/M03-E03-T04-img04.png)

1. 在笔记本中，在 **Cmd 3** 单元格下，单击 **“运行”** 图标，然后单击 **“运行单元格”**。

    >**注意**  将在单元格底部返回消息，说明 Spark 工作已执行，返回了结果表，“命令花了 0.0X 秒 - 2019 年 4 月 4 日，下午 2:46:48 由人员在 awdbclstudxx 上执行”

1. 将 Azure Databricks 笔记本保持打开状态

>**结果** 在本练习中，你已执行必要的步骤，以设置 Azure Databricks 访问 Azure Data Lake Store Gen2 中的数据的权限。然后，你使用 scala 连接到 Data Lake Store，然后读取数据并创建显示人员偏好的输出表。

## 练习 4：使用 Azure Databricks 执行基本转换

预计用时：10 分钟

个人练习

本练习的主要任务如下：

1. 检索数据集上的特定列

1. 在数据集上执行列的重命名

1. 添加注释

1. 如果时间允许：其他转换

### 任务 1：检索数据集上的特定列

1. 在笔记本中，将鼠标悬停在单元格 **“Cmd 3”** 右上角，然后单击 **“在下方添加单元格”** 图标。将出现一个名为 **Cmd4** 的新单元格。

1. 在笔记本中，在单元格 **Cmd 4** 中，将以下代码复制并粘贴到单元格中：

    ```scala
    //从 Azure Data Lake Storage Gen2 文件系统中的 JSON 数据集中检索特定列
    
    val specificColumnsDf = df.select("firstname", "lastname", "gender", "location", "page")
    specificColumnsDf.show()
    ```

1. 在笔记本中的 **Cmd 4** 单元格中，单击 **“运行”** 图标，然后单击 **“运行单元格”**。 

    >**注**  将在单元格底部返回消息，说明 Spark 作业已执行，返回了结果表，“命令花了 0.0X 秒 - 2019 年 4 月 4 日，下午 2:46:48 由人员在 awdbclstudxx 上执行”

    ![在 Azure Databricks 中的笔记本中运行 scala 查询](Linked_Image_Files/M03-E04-T01-img01.png)

### 任务 2：在数据集上执行列的重命名

1. 在笔记本中，将鼠标悬停在单元格 **Cmd 4** 右上角，然后单击 **在下方添加单元格** 图标。将出现一个名为 **Cmd5** 的新单元格。

1. 在笔记本中，在单元格 **Cmd 5** 中，复制以下代码并将其粘贴到单元格中：

    ```scala
    //将页面列重命名为 bike_preference

    val renamedColumnsDF = specificColumnsDf.withColumnRenamed("page", "bike_preference")
    renamedColumnsDF.show()
    ```

1. 在笔记本中，在 **Cmd 5** 下的单元格中，单击 **“运行”** 图标，然后单击 **“运行单元格”**。 

    >**注**  将在单元格底部返回一条消息，说明 Spark 作业已执行，返回了结果表，并且“命令花了 0.0X 秒 - 2019 年 4 月 4 日下午 2:46:48 由人员在 awdbclstudxx 上执行”

    ![在 Azure Databricks 中重命名笔记本中查询的列](Linked_Image_Files/M03-E04-T02-img01.png)

### 任务 3：添加注释

1. 在笔记本中，将鼠标悬停在单元格 **Cmd 5** 右上角，然后点击 **“在下方添加单元格”** 图标。将出现一个名为 **Cmd6** 的新单元格。

1. 在笔记本中，在单元格 **“Cmd 6”** 中，复制以下代码并将其粘贴到单元格中：

    ```text
    此代码连接到名为“数据”的 Data Lake Storage 文件系统，并读取存储在该 Data Lake 中的 preferences.json 文件中的数据。然后创建了简单查询来检索数据，并且“页面”列已重命名为“bike_preference”。
    ```

1. 在笔记本中，在 **Cmd 6** 下方的单元格中，单击 **向下箭头** 图标，然后单击 **“上移”**。重复此动作，直到单元格出现在笔记本的顶部。

1. 保持 Azure Databricks 笔记本打开

    >**注意**  你将在接下来的实验室中探索如何将这些数据导出到其他数据平台技术

> **结果**：完成本练习后，你已经在笔记本中创建了注释。

### 任务 4：如果时间允许或课后复习

如果你提前完成了这个实验，以下部分提供了能帮助你详细了解 Azure 中基本和高级转换的内容的链接。

如果 url 不可访问，“Allfiles\Labfiles\Starter\DP-200.3\Post Course Review”__文件夹中还有笔记本的拷贝

**基本转换**

1. 在工作区中，使用左侧的命令栏，选择 **“工作区”**、 **“用户”**，然后选择 **“你的用户名”** （带房子图标的条目）。

1. 在出现的边栏选项卡中，选择 **“你的名字旁边指向下方的 V 形符号”**，然后选择 **“导入”**。

1. 在 “导入笔记本”对话框中，选择 **“以下 URL”**，然后粘贴以下 URL： 

```url
    https://github.com/MicrosoftDocs/mslearn-perform-basic-data-transformation-in-azure-databricks/blob/master/DBC/05.1-Basic-ETL.dbc?raw=true
```

1. 选择 **“导入”**。

1. 导入后，应出现名为 **05.1-Basic-ETL** 的文件夹。选择该文件夹。

1. 该文件夹将包含一个或多个笔记本，你可以使用这些笔记本来学习使用 **scala** 或 **python** 的基本转换。

按照笔记本中的说明操作，直到完成整个笔记本中的操作为止。然后继续按顺序完成笔记本中的剩余操作：

- **01-Course-Overview-and-Setup** - 本笔记本帮助你启用 Databricks 工作区。
- **02-ETL-Process-Overview** - 本笔记本包含帮助你查询大型数据文件并将结果可视化的练习。
- **03-Connecting-to-Azure-Blob-Storage** - 在此笔记本中执行基本聚合和联接。
- **04-Connecting-to-JDBC** - 本笔记本列出了使用 Databricks 从各种来源访问数据的步骤。
- **05-Applying-Schemas-to-JSON（05 将架构应用至 JSON）** - 在本笔记本中，你将学习如何使用 DataFrames 查询 JSON 和分层数据
- **06-Corrupt-Record-Handling** - 本笔记本列出了具有以下特性的练习：帮助你了解如何创建 ADLS 并使用 Databricks DataFrames 查询和分析此数据。
- **07-Loading-Data-and-Productionalizing** - 在此你可以使用 Databricks 在 Azure Data Lake Storage Gen2 中查询和分析数据存储。
- **Parsing-Nested-Data（解析嵌套数据）** - 本笔记本位于“可选”子文件夹中，其中包含一个示例项目，供你稍后自行浏览。

>[注] 你可以在“解决方案”子文件夹中找到相应的笔记本。这些包含完成的练习单元，要求你完成一个或多个挑战。如果你遇到困难或只是想查看解决方案，请参阅这些内容。

**高级转换**

1. 在工作区中，使用左侧的命令栏，依次选择 **“工作区”**、 **“用户”**，然后选择 **“你的用户名”** （带房子图标的条目）。

1. 在出现的边栏选项卡中，选择 **你的名字旁边指向下方的 V 形符号**，然后选择 **“导入”**。

1. 在“导入笔记本”对话框中，选择 **“以下 URL”**，然后粘贴以下 URL： 

```url
    https://github.com/MicrosoftDocs/mslearn-perform-advanced-data-transformation-in-azure-databricks/blob/master/DBC/05.2-Advanced-ETL.dbc?raw=true
```

1. 选择 **“导入”**。

1. 导入后，应出现名为 **“05.2-Advanced-ETL”** 的文件夹。选择该文件夹。

1. 该文件夹将包含一个或多个笔记本，你可以使用这些笔记本来学习使用 **scala** 或 **python** 的基本转换。

按照笔记本中的说明操作，直到完成整个笔记本中的操作为止。然后继续按顺序完成笔记本中的剩余操作：

- **01-Course-Overview-and-Setup** - 本笔记本帮助你启用 Databricks 工作区。
- **02-Common-Transformations（02 常见转换）** - 在本笔记本中，你可以使用 Spark 内置函数执行一些常见的数据转换。
- **03-User-Defined-Functions（03 用户定义函数）** - 在此笔记本中，你可以使用用户定义的函数执行自定义转换。
- **04 - 高级 UDF** - 在本笔记本中，你将使用高级用户定义函数来执行一些复杂的数据转换。
- **05-Joins-and-Lookup-Tables** - 在本笔记本中，你将学习如何使用表的标准和广播联接。
- **06-Database-Writes** - 本笔记本包含以下练习：将数据并行写入多个目标数据库，存储由 ETL 作业转换而来的数据。
- **07-Table-Management（07 表管理）** - 在这里，你可以处理托管和未托管表，以优化你的数据存储。
- **Custom-Transformations** - 本笔记本位于“可选”子文件夹中，其中包含一个示例项目，供你稍后自行浏览。

>[注]你可以在“解决方案”子文件夹中找到相应的笔记本。这些包含已完成的练习单元，要求你完成一个或多个挑战。如果你遇到困难或只是想查看解决方案，请参阅这些内容。

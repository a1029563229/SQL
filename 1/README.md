# 引言
数据库管理系统（Database-Management System, DBMS）由一个互相关联的数据的集合和一组用以访问这些数据的程序组成。

## 数据库系统的目标
- 在数据库系统（DBMS）出现之前，文件操作系统存在的问题：
  - 数据的冗余和不一致；
  - 数据访问困难；
  - 数据孤立；
  - 完整性问题；
  - 原子性问题；
  - 并发访问异常；
  - 安全性问题；
- 数据模型
  - 关系模型：关系模型用表的集合来表示数据和数据间的联系；
  - 实体-联系模型；
  - 基于对象的数据模型：对象-关系数据模型结合了面向对象的数据模型和关系数据模型的特征；
  - 半结构化数据模型；

## 数据库语言
- 数据库系统提供数据定义语言（data-definition language）来定义数据库模式，以及数据操作语言（data-manipulation language）来表达数据库的查询和更新。

### 数据操纵语言
- 数据操纵语言的访问类型：
  - 对存储在数据库中的信息进行检索；
  - 向数据库中插入新的信息；
  - 从数据库中删除信息；
  - 修改数据库中存储的信息；
- 通常由两类基本的数据操纵语言：
  - 过程化 DML（procedural DML）要求用户指定需要什么数据以及如何获得这些数据；
  - 声明式 DML（declarative DML）（也称非过程化 DML）只要求用户指定需要什么数据，而不指明如何获得这些数据；

### 数据定义语言
- 数据库系统所使用的存储结构和访问方式是通过一系列特殊的 DDL 语句来说明的，这种特殊的 DDL 成为数据存储和定义（data storage and definition）语言。
- 存储在数据库中的数据值必须满足某些一致性约束（consistency constraint）：
  - 域约束（domain constraint）：每个属性都必须对应一个所有可能的取值构成的域（例如，整数型、字符型、日期/时间型）。
  - 参照完整性（referential integrity）：我们常常希望，一个关系中给定属性集的取值也在另一关系的某一属性集的区之中出现。（参照完整性）
  - 断言（assertion）：一个断言就是数据库需要时刻满足的某一条件。域约束和参照完整性约束是断言的特殊形式。
  - 授权（authorization）：读权限（read authorization）、插入权限（insert authorization）、更新权限（update authorization）、删除权限（delete authorization）。

## 关系数据库
- 关系数据库基于关系模型，使用一系列表来表达数据以及这些数据之间的联系。关系数据库也包括 DDL 和 DML。
- 表
  - 关系模型是基于记录的模型的一个实例。基于记录的模型，之所以有此称谓，是因为数据库的结构是几种固定格式的记录。每种表包含一种特定类型的记录。每种记录类型定义固定数目的字段或属性。表的列对应记录类型的属性。
- 数据操纵语言
  - SQL 查询语言是非过程化的。它以几个表作为输入（也可能只有一个），总是仅返回一个表。
  ```SQL
  select instructor.name
  from instructor
  where instructor.dept_name = 'History'
  ```
  - 这个查询指定了从 instructor 表中要取回的是 dept_name 为 History 的那些行，并且这些行的 name 属性要显示出来。更具体点，执行本查询的结果是一个表，它有一列 name 和若干行，每一行都是 dept_name 为 History 的一个教员的名字。
  - 查询可以设计不来自不止一个表的信息。例如，下面的查询将找出与经费预算超过 95000 美元的系相关联的所有教员的 ID 和系名。
  ```SQL
  select instructor.ID, department.dept_name
  from instructor, department
  where instructor.dept_name = department.dept_name and department.budget > 95000;
  ```
- 数据定义语言
  - SQL 提供了一个丰富的 DDL 语言，通过它，我们可以定义表、完整性约束、断言，等等
  ```SQL
  create table department
  (
    dept_name char(20),
    building char(15),
    budget numeric(12, 2)
  );
  ```
  - 上面的 DDL 语句执行的结果就是创建了 department 表，该表有 3 个列：dept_name、building 和 budget，每个列有一个与之相关联的数据类型。
- 来自应用程序的数据库访问：为了访问数据库，DML 语句需要宿主语言来执行。有两种途径可以做到这一点：
  - 一种是通过提供应用程序接口（过程集），它可以用来将 DML 和 DDL 的语句发送给数据库，再取回结果。与 C 语言一起使用的开放数据库连接（ODBC）标准，是一种常用的应用程序接口标准。Java 数据库连接（JDBC）标准为 Java 语言提供了相应的特性。
  - 另一种是通过扩展宿主语言的语法，在宿主语言的程序中嵌入 DML 调用。通常用一个特殊字符作为 DML 调用的开始，并且通过预处理器，称为 DML 预编译器（DML pre compiler），来将 DML 语句转变为宿主语言中的过程调用。

## 数据库设计
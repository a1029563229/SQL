# SQL

## SQL 查询语言概览

SQL 语言包含的部分：
- 数据定义语言（DDL）：SQL DDL 提供定义关系模式、删除关系以及修改关系模式的命令；
- 数据操纵语言（DML）：SQL DML 提供从数据库中查询信息，以及在数据库中插入元组、删除元组、修改元组的能力；
- 完整性：SQL DDL 包括定义完整性约束的命令，保存在数据库中的数据必须满足所定义的完整性约束。破坏完整性约束的更新是不允许的。
- 视图定义：SQL DDL 包括定义视图的命令；
- 事务控制：SQL 包括定义事务的开始和结束的命令；
- 嵌入式 SQL 和动态 SQL：嵌入式和冬天 SQL 定义 SQL 语句如何嵌入到通用编程语言，如 C、C++ 和 Java 中；
- 授权：SQL DDL 包括定义对关系和视图的访问权限的命令；

## SQL 数据定义

- DDL 的职责：
  - 每个关系的模式；
  - 每个属性的取值类型；
  - 完整性约束；
  - 每个关系维护的索引集合；
  - 每个关系的安全性和权限信息；
  - 每个关系在磁盘是的物理存储结构；
- 基本类型
  - char(n)：固定长度的字符串，用户指定长度 n；
  - varchar(n)：可变长度的字符串，用户指定最大长度 n；
  - int：整数类型（和机器相关的整数的有限子集）；
  - smallint：小整数类型（和机器相关的整数类型的子集）；
  - numeric(p, d)：定点数，精度由用户指定。这个数有 p 位整数（加上一个符号位），其中 d 位数字在小数点右边；
  - real, double precision：浮点数与双精度浮点数，精度与机器有关；
  - float(n)：精度至少为 n 位的浮点数；
- create table 命令的通用形式是
  ```sql
    create table r（关系名）
      (
        A1（属性名） D1（域：属性 A1 的类型以及可选的约束）,
        A2（属性名） D2（域：属性 A2 的类型以及可选的约束）,
        A3（属性名） D3（域：属性 A3 的类型以及可选的约束）,
        < 完整性约束i >,
        < 完整性约束k >
      );
  ```
  - 一些示例 sql 语句
  ```sql
    create table department
      (
        dept_name varchar(20),
        building varchar(15),
        budget numeric(12, 2),
        primary key (dept_name);
      )
    create table course
      (
        course_id varchar(7),
        title varchar(20),
        dept_name varchar(20),
        credits: numeric(2, 0),
        primary key (course_id),
        foreign key (dept_name) references department
      )
    create table instructor
      (
        ID varchar(5),
        name varchar(20) not null,
        dept_name varchar(20),
        salary numeric(8, 2),
        primary key (ID),
        foreign key (dept_name) references department
      )
    create table section
      (
        course_id varchar(8),
        sec_id varchar(8),
        semester varchar(6),
        year numeric(4, 0),
        building varchar(15),
        room_number varchar(7),
        time_slot_id varchar(4),
        primary key (course_id, sec_id, semester, year),
        foreign key (course_id) references course
      )
    create table teaches
      (
        ID varchar(5),
        course_id varchar(8),
        sec_id varchar(8),
        semester varchar(6),
        year numeric(4, 0),
        primary key (ID, course_id, sec_id, semester, year),
        foreign key (course_id, sec_id, semester, year) references section,
        foreign key (ID) references instructor
      )
  ```
  - primary key (Ai ... Aj) 表明了属性 Ai - Aj 构成关系的主码；主码属性必须非空且唯一；
  - foreign key (Ai ... Aj) references [s]：表明关系中任意元组在属性 Ai - Aj 上的取值必须对应关系 s 中某元组在主码属性上的取值。
  - not null：一个属性上的 not null 约束表明在该属性上不允许空值。

## SQL 查询的基本结构

### 单关系查询
```sql
-- 找出所有教师的名字
select name
from instructor;

-- 找出所有教师所在的系名
select dept_name
from instructor;

-- 显式去除重复
select distinct dept_name
from instructor;

-- 显式不去除重复
select all dept_name
from instructor;

-- 带运算的查询（并不影响数据库内的实际数据）
select ID, name, dept_name, salary * 1.1
from instructor;

-- 找出所有在 Computer Science 系并且工资超过 70000 美元的教师的名字
select name
from instructor
where dept_name = 'Computer Science' and salary > 70000;
```

### 多关系查询

```sql
-- 找出所有教师的名字，以及他们所在系的名称和系所在建筑的名称
select name, instructor.dept_name, building
from instructor, department
where instructor.dept_name = department.dept_name;
```

SQL 查询的子句：
  - select：用于列出查询结果中所需要的属性；
  - from：一个查询求值中需要访问的关系列表；
  - where：一个作用在 from子句中关系的属性上的谓词；

- 对于相同的属性名，我们在属性名前加上关系名作为前缀，表示该属性来自于哪个关系；
- 对于那些只出现在单个模式中的属性，我们通常去掉关系名前缀。
```sql

```
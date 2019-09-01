# 关系模型介绍
数据模型是描述数据、数据联系、数据语义以及一致性约束的概念工具的集合。 其中关系模型就是数据模型的一种。

## 关系数据库的结构
- 关系数据库由表（table）的集合构成，每个表有唯一的名字。表中一行代表了一组值之间的一种联系。
- 在关系模型的术语中，关系（relation）用来指代表，而元组（tuple）用来指代行，属性（attribute）指代的是表中的列。
- 关系实例（relation instance）这个术语用来表示一个关系的特定实例，也就是所包含的一组特定的行。
- 空（null）值是一个特殊的值，表示值未知或不存在。

## 数据库模式
- 当我们谈论数据库时，我们必须区分数据库模式（database schema）和数据库实例（database instance），前者是数据库的逻辑设计，后者是给定时刻数据库中数据的一个快照。
- 关系的概念对应程序设计语言中变量的概念，而关系模式（relation schema）的概念对应于程序设计语言中类型定义的概念。
- 几种关系模式
  ```sql
  department(dept_name, building, budget);
  section(course_id, sec_id, semester, year, building, room_number, time_slot_id);
  teaches(ID, course_id, sec_id, semester, year);
  student(ID, name, dept_name, tot_cred);
  advisor(s_id, i_id);
  takes(ID, course_id, sec_id, semester, year, grade);
  classroom(building, room_number, capacity);
  time_slot(time_slot_id, day, start_time, end_time);
  ```

## 码
+ 我们必须有一种能区分给定关系中的不同元组的方法。超码（superkey）是一个或多个属性的集合，这些属性的组合可以使我们在一个关系中唯一地表示一个元组。（例如，instructor 关系的 ID 属性足以将不同的教师元组区分开）
+ 我们用主码（primary key）这个术语来代表被数据库设计者选中的、主要用来在一个关系中区分不同元组的候选码。
+ 从 section 到 teaches 的约束是参照完整性约束（referential integrity constraint）的一个例子。参照完整性约束要求在参照关系中任意元组在特定属性上的取值必然等于被参照关系中某个元素在特定属性上的取值。

## 关系查询语言
- 查询语言（query language）是用户用来从数据库中请求获取信息的语言：
  - 过程化语言（procedural language）：用户指导系统对数据库执行一系列操作以计算出所需结果；
  - 非过程化语言（nonprocedural language）：用户只需描述所需信息，而不要给出获取该信息的具体过程；

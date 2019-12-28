# 使用 MySQL

```sql
-- 选择数据库
USE crashcourse;  -- Output: Database changed

-- 返回可用数据库列表
SHOW DATABASES;

-- 获得一个数据库内的表的列表；
SHOW TABLES;

-- 展示表的字段信息；
SHOW COLUMNS FROM customers;

-- 显示广泛的服务器状态信息；
SHOW STATUS;

-- 显示创建特定数据库和表的 MySQL 语句
SHOW CREATE DATABASE;
SHOW CREATE TABLE;

-- 显示授予用户（所有用户或特定用户）的安全权限
SHOW GRANTS;

-- 显示服务器错误或警告信息
SHOW ERRORS;
SHOW WARNINGS;
```
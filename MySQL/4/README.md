# 查询数据

## 检索数据

```sql
-- 检索单个列
SELECT prod_name
FROM products;

-- 检索多个列
SELECT prod_id, prod_name, prod_price
FROM products;

-- 检索所有列
SELECT *
FROM products;

-- 检索不同的值
SELECT DISTINCT vend_id
FROM products;

-- 限制返回数量（分页）
SELECT prod_name
FROM products
LIMIT 5 -- 限制的数量
OFFSET 5; -- 跳过的数量
```

多条 SQL 语句必须以分号（;）分隔；在查询时，通常对所有 SQL 关键字使用大写，而对列和表名使用小写，这样做使代码更易于阅读和调试。多数 SQL 开发人员认为将 SQL 语句分为多行更容易阅读和调试。

## 排序数据

```sql
-- 排序检索
SELECT prod_name
FROM products
ORDER BY prod_name;

-- 多列排序检索
SELECT prod_id, prod_name, prod_price
FROM products
ORDER BY prod_price, prod_name;

-- 指定排序方向
SELECT prod_id, prod_price, prod_name
FROM products
ORDER BY prod_price DESC, prod_name; -- 默认为 ASC

-- 检索最贵的物品
SELECT prod_price, prod_name
FROM products
ORDER BY prod_price DESC
LIMIT 1;
```

子句（clause）：SQL 语句由子句组成，有些子句是必需的，而有的是可选的。一个子句通常由一个关键字和所提供的数据组成。
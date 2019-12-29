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

## 过滤数据

```sql
-- 条件搜索
SELECT prod_name, prod_price
FROM products
WHERE prod_price = 2.50;

-- 条件搜索
SELECT prod_name, prod_price
FROM products
WHERE prod_name = 'fuses';

-- 列出价格小于 10 美元的所有产品
SELECT prod_name, prod_price
FROM products
WHERE prod_price < 10;

-- 列出价格小于等于 10 美元的所有产品
SELECT prod_name, prod_price
FROM products
WHERE prod_price <= 10;

-- 不匹配检查
SELECT vend_id, prod_name
FROM products
WHERE vend_id <> 1003;

-- 范围值搜索
SELECT prod_name, prod_price
FROM products
WHERE prod_price BETWEEN 5 AND 10;

-- 检查具有空值的列
SELECT cust_id
FROM customers
WHERE cust_email IS NULL;

-- 多条件检索
SELECT prod_id, prod_price, prod_name
FROM products
WHERE vend_id = 1003 AND prod_price <= 10;

-- OR 条件搜索
SELECT prod_name, prod_price
FROM products
WHERE vend_id = 1002 OR vend_id = 1003;

-- 组合条件查询
SELECT prod_name, prod_price
FROM products
WHERE (vend_id = 1002 OR vend_id = 1003) AND prod_price >= 10;

-- IN 操作符搜索，检索符合条件的选项
SELECT prod_name, prod_price
FROM products
WHERE vend_id IN (1002, 1003)
ORDER BY prod_name;

-- NOT 操作符，检索不符合条件的选项，除 1002 和 1003 以外的所有供应商制造的产品
SELECT prod_name, prod_price
FROM products
WHERE vend_id NOT IN (1002, 1003)
ORDER BY prod_price;
```

WHERE 子句的位置：在同时使用 ORDER BY 和 WHERE 子句时，应该让 ORDER BY 位于 WHERE 之后，否则将会产生错误

WHERE 子句操作符：
- = 等于
- <> 不等于
- != 不等于
- < 小于
- <= 小于等于
- \> 大于
- \>= 大于等于
- BETWEEN 在指定的两个值之间

IN 操作符的优点：
- 在使用长的合法选项清单时，IN 操作符的语法更清楚且更直观；
- 在使用 IN 时，计算的次序更容易管理（因为使用的操作符更少）；
- IN 操作符一般比 OR 操作符清单执行更快；
- IN 的最大有点是可以包含其他 SELECT 语句,使得能够更动态的建立 WHERE 语句；

## 用通配符进行过滤

```sql
-- 匹配以 xxx 开头的数据
SELECT prod_id, prod_name
FROM products
WHERE prod_name LIKE 'jet%';

-- 匹配包含 xxx 的数据
SELECT prod_id, prod_name
FROM products
WHERE prod_name LIKE '%anvil%';

-- 匹配 s 开头 e 结尾的数据
SELECT prod_id, prod_name
FROM products
WHERE prod_name LIKE 's%e';

-- 匹配一个字符
SELECT prod_id, prod_name
FROM products
WHERE prod_name LIKE '_ ton anvil';
```

使用通配符的技巧：

- 不要过度使用通配符。如果其他操作符能达到相同的目的，应该使用其他操作符；
- 在确实需要使用通配符时，除非绝对有必要，否则不要把它们用在搜索模式的开始处。把通配符置于搜搜模式的开始处，搜索起来是最慢的；
- 仔细注意通配符的位置。如果放错地方，可能不会返回想要的数据；

## 使用正则表达式进行搜索

```sql
-- 使用正则匹配检索数据
SELECT prod_name
FROM products
WHERE prod_name REGEXP '.000'
ORDER BY prod_name;

-- 正则条件匹配
SELECT prod_name
FROM products
WHERE prod_name REGEXP '1000|2000'
ORDER BY prod_name;

-- 正则匹配几个字符之一
SELECT prod_name
FROM products
WHERE prod_name REGEXP '[123] Ton'
ORDER BY prod_name;

-- 正则匹配范围
SELECT prod_name
FROM products
WHERE prod_name REGEXP '[1-5] Ton'
ORDER BY prod_name;
```

为更方便工作，可以使用预定义的字符集，称为字符类：
- [:alnum:] 任意字母和数字（同 [a-zA-Z0-9]）
- [:alpha:] 任意字符（同 [a-zA-Z]）
- [:blank:] 空格和制表（同 [\\t]）
- [:cntrl:] ASCII 控制字符（ASCII 0 到 31 和 127）
- [:digit:] 任意数字（同 [0-9]）
- [:graph:] 与 [:print:] 相同，但不包括空格
- [:lower:] 任意小写字母（同 [a-z]）
- [:print:] 任意可打印字符
- [:punct:] 既不再 [:alnum:] 又不在 [:cntrl:] 中的任意字符；
- [:space:] 包括空格在内的任意空白字符（同 [\\f\\n\\r\\t\\v]）
- [:upper:] 任意大写字母（同 [A-Z]）
- [:xdigit:] 任意十六进制数字（同 [a-fA-F0-9]

`^` 的双重用途： `^` 有两种用法。在集合中（用 [ 和 ] 定义），用来否定该集合，否则，用来指串的开始处。

LIKE 与 REGEXP：LIKE 和 REGEXP 的不同在于，LIKE 匹配整个串而 REGEXP 匹配子串。利用定位符，通过用 `^` 开始每个表达式，用 `$` 结束每个表达式，可以使 REGEXP 的作用与 LIKE 一样。

## 创建计算字段
```sql
-- 拼接两个字段检索
SELECT Concat(vend_name, ' (', vend_country, ')')
FROM vendors
ORDER BY vend_name;

-- 去除空格
SELECT Concat(vend_name, ' (', RTrim(vend_country), ')')
FROM vendors
ORDER BY vend_name;

-- 使用别名拼接字段
SELECT Concat(RTrim(vend_name), ' (', RTrim(vend_country), ')') AS vend_title
FROM vendors
ORDER BY vend_name;
```
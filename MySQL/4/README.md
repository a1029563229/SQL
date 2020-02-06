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

## 使用数据处理函数

```sql
-- 将文本转换为大写
SELECT vend_name, Upper(vend_name) AS vend_name_upcase
FROM vendors
ORDER BY vend_name;

-- 日期检索
SELECT cust_id, order_num
FROM orders
WHERE Date(order_date) = '2005-09-01';

-- 日期区间检索
SELECT cust_id, order_num
FROM orders
WHERE Date(order_date) BETWEEN '2005-09-01' AND '2005-09-30';

-- 检索月份
SELECT cust_id, order_num
FROM orders
WHERE Year(order_date) = 2005 AND Month(order_date) = 9;
```

常用的文本处理函数：
- Left()：返回串左边的字符；
- Right()：返回串右边的字符；
- Length()：返回串的长度；
- Locate()：找出串的一个子串；
- Lower()：将串转换为小写；
- Upper()：将串转换为大写；
- LTrim()：去掉串左边的空格；
- RTrim()：去掉串右边的空格；
- Soundex()：返回串的 SOUNDEX 值；
- SubString()：返回子串的字符；

日期和时间处理函数：
- AddDate()：增加一个日期（天、周等）；
- AddTime()：增加一个时间（时、分等）；
- CurDate()：返回当前日期；
- CruTime()：返回当前时间；
- Date()：返回日期时间的日期部分；
- DateDiff()：计算两个日期之差；
- Date_Add()：高度灵活的日期计算函数；
- Date_Format()：返回一个格式化的日期或时间串；
- Day()：返回一个日期的天数部分；
- DayOfWeek()：对于一个日期，返回对应的星期几；
- Hour()：返回一个时间的小时部分；
- Minute()：返回一个时间的分钟部分；
- Month()：返回一个日期的月份部分；
- Now()：返回当前日期和时间；
- Second()：返回一个时间的秒部分；
- Time()：返回一个日期时间的时间部分；
- Year()：返回一个日期的年份部分；

## 汇总数据

```sql
-- 计算平均价格
SELECT AVG(prod_price) AS avg_price
FROM products;

-- 查询特定供应商的平均产品价格
SELECT AVG(prod_price) AS avg_price
FROM products
WHERE vend_id = 1003;

-- 查询总数
SELECT COUNT(*) AS num_cust
FROM customers;

-- 查询有邮箱的客户总数
SELECT COUNT(cust_email) AS num_cust
FROM customers;

-- 返回指定列的最大值
SELECT MAX(prod_price) AS max_price
FROM products;

-- 返回指定列的最小值
SELECT MIN(prod_price) AS min_price
FROM products;

-- 返回指定列值的和
SELECT SUM(quantity) AS items_ordered
FROM orderitems
WHERE order_num = 20005;

-- 组合聚集函数
SELECT COUNT(*) AS num_items,
       MIN(prod_price) AS price_min,
       MAX(prod_price) AS price_max,
       AVG(prod_price) AS price_avg
FROM products;
```

SQL 聚集函数：
- AVG()：返回某列的平均值；
- COUNT()：返回某列的行数；
- MAX()：返回某列的最大值；
- MIN()：返回某列的最小值；
- SUM()：返回某列值之和；

## 过滤分组

```sql
-- 分组统计数量
SELECT vend_id, COUNT(*) AS num_prods
FROM products
GROUP BY vend_id;

-- 过滤两个以上的订单
SELECT cust_id, COUNT(*) AS orders
FROM orders
GROUP BY cust_id
HAVING COUNT(*) >= 2;

-- 双重过滤分组
SELECT vend_id, COUNT(*) AS num_prods
FROM products
WHERE prod_price >= 10
GROUP BY vend_id
HAVING COUNT(*) >= 2;

-- 计算订单总价并排序
SELECT order_num, SUM(quantity*item_price) AS ordertotal
FROM orderitems
GROUP BY order_num
HAVING SUM(quantity*item_price) >= 50
ORDER BY ordertotal;
```

## 使用子查询

```sql
-- 子查询相关客户
SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (
  SELECT cust_id
  FROM orders
  WHERE order_num IN (
    SELECT order_num
    FROM orderitems
    WHERE prod_id = 'TNT2'
  )
);

-- 子查询统计数量
SELECT cust_name,
       cust_state,
       (SELECT COUNT(*)
        FROM orders
        WHERE orders.cust_id = customers.cust_id) AS orders
FROM customers
ORDER BY cust_name;
```

## 联结表

```sql
-- 跨表查询
SELECT vend_name, prod_name, prod_price
FROM vendors, products
WHERE vendors.vend_id = products.vend_id
ORDER BY vend_name, prod_name;

-- 等值联结
SELECT vend_name, prod_name, prod_price
FROM vendors INNER JOIN products
ON vendors.vend_id = products.vend_id;

-- 联结多个表
SELECT prod_name, vend_name, prod_price, quantity
FROM orderitems, products, vendors
WHERE products.vend_id = vendors.vend_id
  AND orderitems.prod_id = products.prod_id
  AND order_num = 20005;

-- 联结多个表
SELECT cust_name, cust_contact
FROM customers, orders, orderitems
WHERE customers.cust_id = orders.cust_id
  AND orderitems.order_num = orders.order_num
  AND prod_id = 'TNT2';

-- 创建表别名
SELECT cust_name, cust_contact
FROM customers AS c, orders AS o, orderitems AS oi
WHERE c.cust_id = o.cust_id
  AND oi.order_num = o.order_num
  AND prod_id = 'TNT2';

-- 联结查询
SELECT p1.prod_id, p1.prod_name
FROM products AS p1, products AS p2
WHERE p1.vend_id = p2.vend_id
  AND p2.prod_id = 'DTNTR';

-- 带聚集函数的联结
SELECT customers.cust_name,
       customers.cust_id,
       COUNT(orders.order_num) AS num_ord
FROM customers INNER JOIN orders
  ON customers.cust_id = orders.cust_id
GROUP BY customers.cust_id;
```

应该保证所有联结都有 WHERE 子句。

## 组合查询

```sql
-- 组合查询
SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5
UNION
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN(1001,1002);

-- 组合查询排序
SELECT vend_id, prod_id, prod_price
FROM products
WHERE prod_price <= 5
UNION
SELECT vend_id, prod_id, prod_price
FROM products
WHERE vend_id IN(1001,1002)
ORDER BY vend_id, prod_price;
```

## 全文本搜索

```sql
-- 全文本搜索
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('rabbit');
```
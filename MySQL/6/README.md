## 创建和操纵表

```sql
-- 创建表
CREATE TABLE customers
(
  cust_id int NOT NULL AUTO_INCREMENT,
  cust_name char(50) NOT NULL,
  cust_address char(50) NULL,
  cust_city char(50) NULL,
  cust_state char(5) NULL,
  cust_zip char(10) NULL,
  cust_country char(50) NULL,
  cust_contact char(50) NULL,
  cust_email char(255) NULL,
  PRIMARY KEY(cust_id)
) ENGINE=InnoDB;

-- 多个列主键
CREATE TABLE orderitems
(
  order_num int NOT NULL,
  order_item int NOT NULL,
  prod_id char(10) NOT NULL,
  quantity int NOT NULL,
  item_price decimal(8,2) NOT NULL,
  PRIMARY KEY (order_num, order_item)
) ENGINE=InnoDB;

-- 自增值
cust_id int NOT NULL AUTO_INCREMENT;

-- 指定默认值
quantity int NOT NULL DEFAULT 1;

-- 删除表
DROP TABLE customers2;

-- 重命名表
RENAME TABLE customers2 TO customers;
```

表中的每个行必须具有唯一的主键值。如果主键使用单个列，则它的值必须唯一。如果使用多个列，则这些列的组合值必须唯一。
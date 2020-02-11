# 插入数据

## 插入数据

```sql
-- 插入一条数据
INSERT INTO customers(cust_name,
  cust_address,
  cust_city,
  cust_state,
  cust_zip,
  cust_country,
  cust_contact,
  cust_email
) VALUES('Pep E. LaPew',
  '100 Main Street',
  'Los Angeles',
  'CA',
  '90046',
  'USA',
  NULL,
  NULL
);

-- 插入多条数据
INSERT INTO customers(cust_name,
  cust_address,
  cust_city,
  cust_state,
  cust_zip,
  cust_country,
  cust_contact,
  cust_email
) VALUES('Pep E. LaPew',
  '100 Main Street',
  'Los Angeles',
  'CA',
  '90046',
  'USA',
  NULL,
  NULL
),
('Pep E. LaPew',
  '100 Main Street',
  'Los Angeles',
  'CA',
  '90046',
  'USA',
  NULL,
  NULL
);

-- 插入检索出的数据
INSERT INTO customers(cust_id,
  cust_contact,
  cust_email,
  cust_name,
  cust_address,
  cust_city,
  cust_state,
  cust_zip,
  cust_country)
SELECT cust_id,
  cust_email,
  cust_name,
  cust_address,
  cust_city,
  cust_state,
  cust_zip,
  cust_country
FROM custnew;
```

## 更新和删除数据

```sql
-- 更新一列
UPDATE customers
SET cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

-- 更新多个列
UPDATE customers
SET cust_name = 'The Fudds'
    cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

-- 删除某条数据
DELETE FROM customers
WHERE cust_id = 10006;
```
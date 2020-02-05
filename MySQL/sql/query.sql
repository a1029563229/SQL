SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (
  SELECT cust_id
  FROM orders
  WHERE order_num IN (
    SELECT order_num
    FROM order_items
    WHERE prod_id = 'TNT2'
  )
);
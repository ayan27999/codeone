-- To make order_id as primary key in the superstore table
ALTER TABLE superstore ADD PRIMARY KEY (order_id)

-- to link all table with the superstore table ( parent table)
ALTER TABLE customers ADD FOREIGN KEY(order_id)REFERENCES superstore(order_id)
ALTER TABLE sales ADD FOREIGN KEY(order_id)REFERENCES superstore(order_id)
ALTER TABLE products ADD FOREIGN KEY(order_id)REFERENCES superstore(order_id)

-- count the number of rows of all tables to overview
SELECT count(*) AS total_record_superstore FROM superstore -- o/p : total NO OF ROWS : 5009
SELECT count(*) AS total_record_customers FROM customers  -- o/p : total NO OF ROWS : 5009
SELECT count(*) AS total_record_products FROM products  -- o/p : total NO OF ROWS : 5009
SELECT count(*) AS total_record_sales FROM sales  -- o/p : total NO OF ROWS : 5009

-- to understand the varriable type of superstore
DESC superstore 

-- output
-- order_date	varchar(50)
-- ship_date	varchar(50)

-- here note that the order date and ship date in charecter type 
-- to convert the data type varchar to date type
-----------------------------------------------------
SELECT * FROM superstore
-- 5 column are null value so drop those column 
ALTER TABLE superstore 
DROP COLUMN Column6,
DROP COLUMN Column7,
DROP COLUMN Column8,
DROP COLUMN Column9,
DROP COLUMN Column10;
-- to check superstore table 
SELECT * FROM superstore -- ok
-- 1 > what are the total sales by segment in each / year ?

SELECT segment,sum(sales) FROM superstore LEFT JOIN sales 
                       ON superstore.order_id=sales.order_id
                       LEFT JOIN customers 
               ON superstore.order_id = customers.order_id
GROUP BY segment 

-- what are the total sales,quantity,discount and profit in each category ?

SELECT category, sum(sales)AS total_sales,
       sum(quantity),
       sum(profit),
       avg(discount)
       FROM superstore LEFT JOIN sales 
               ON superstore.order_id=sales.order_id
                       LEFT JOIN customers 
               ON superstore.order_id = customers.order_id
                       LEFT JOIN products 
               ON superstore.order_id =products.order_id
 GROUP BY category 







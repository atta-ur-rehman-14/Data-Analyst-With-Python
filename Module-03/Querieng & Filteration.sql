use BikeStores


SELECT *
FROM sales.customers


SELECT *
FROM production.products
-- database.schema.table


-- column wise filteration 
SELECT customer_id,first_name,email,city
FROM sales.customers

 -- as -> Alias
SELECT
	product_id,
	product_name,
	list_price,
	list_price * 0.8 as discounted_price  -- 80 % value (20 % discount)
FROM 
	production.products


select list_price as Retail_price from production.products;

-- Distinct (Removing Duplicates with DISTINCT give unique id's)

select distinct category_id from production.products

select product_id, product_name, category_id from production.products;

select * from production.categories;

-- Sorting with ORDER BY (By default asc)

select product_name,list_price
from production.products
order by list_price desc; -- desc

select product_name,list_price
from production.products
order by list_price asc; -- asc


SELECT product_name, category_id, list_price
FROM production.products
ORDER BY category_id ASC, list_price desc;


-- Limiting Rows

select top 5 product_name,list_price
from production.products
order by list_price desc;

-- OFFSET 3 skips the first three rows, FETCH NEXT 3 returns the next three

SELECT product_name, list_price
FROM production.products
ORDER BY list_price DESC
OFFSET 3 ROWS FETCH NEXT 3 ROWS ONLY;

-- Filtering with WHERE

select product_name,category_id,list_price
from production.products
where category_id = 6 or category_id = 7;


select product_name,category_id,list_price
from production.products
where category_id = 6 and list_price > 1000;

-- wrong one it will return all the results with list price greater than 1000 or with cateogry id 6 
select product_name,category_id,list_price
from production.products
where category_id = 6 or list_price > 1000;


-- with cateid - 6 & 7 and list price > 1000
select product_name,category_id,list_price
from production.products
where (category_id =  6 or category_id = 7) AND list_price > 1000;


-- Filtering Lists with IN
-- 5,6,7
SELECT product_name, category_id, list_price
FROM production.products
where category_id in (4,5,6,7)
order by category_id asc

-- list price 500 - 1500 
SELECT product_name, category_id, list_price
FROM production.products
where list_price >= 500 and list_price <= 1500;


-- Filtering Ranges with BETWEEN

SELECT product_name, category_id, list_price
FROM production.products
where list_price between 500 AND 1500;

-- Handling NULL Values 

select * from sales.orders
where shipped_date is null;


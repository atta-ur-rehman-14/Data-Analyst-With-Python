         -- Aggregation Functions
-- Aggregate functions perform calculations on a set of values and return a single result.
-- Common aggregate functions include: COUNT, SUM, AVG, MIN, MAX
-- Aggregate functions are often used with GROUP BY and HAVING clauses.

-- Key concepts:
-- 1. WHERE filters individual rows BEFORE grouping
-- 2. HAVING filters grouped records AFTER grouping
-- 3. GROUP BY groups rows that have the same values in specified columns
-- 4. Aggregate functions collapse many rows into a single result

                         ------------------------------- Aggregation Functions ----------------------------------
-- 1 order of 10 products -- 
-- total 10 rows -- sum of rows will become 1 row 

--An aggregate function collapses many rows into a single result.

select * from production.products;

select count(*) as Total_Products from production.products;

SELECT
    AVG(list_price) AS Avg_price,
    MIN(list_price) AS Cheapest,
    MAX(list_price) AS Priciest,
    SUM(list_price) AS Catalog_value
FROM production.products;


select count(*) AS Total_Rows from sales.customers ; -- 1445
select count(phone) AS Total_Rows from sales.customers; -- 178  -- 1445 - 178 = 1267 null values


select count(*) from sales.customers
where phone is null;

-- GROUP BY
select
    category_id,
    count (*) as Product_Count
from 
    production.products
group by category_id



select
    brand_id,
    count (*) as Product_Count
from 
    production.products
group by brand_id
order by count(*) asc;

-- count by a model year
select
    model_year,
    count(model_year) as Total_Product  -- *
from 
    production.products
group by model_year;

-- GROUP BY Multiple Columns

SELECT
    category_id,
    brand_id,
    COUNT(*) AS product_count
FROM production.products
GROUP BY category_id, brand_id
ORDER BY category_id, product_count DESC;

-- group by brand then on category 

select 
    brand_id,
    category_id,
    COUNT(*) as product_count
from production.products
group by brand_id, category_id
order by 1,2

-- Having 
-- products_count should be greater than 50 
-- having is always with aggregation means with group by when the filteration 


select 
    model_year, 
    count(model_year) as products_count
from production.products 
group by model_year
having count(model_year) > 50;

/*
+--------------------------------+--------------------------------+
|             WHERE              |             HAVING             |
+--------------------------------+--------------------------------+
| 1. Filters individual rows.    | 1. Filters grouped records.    |
|                                |                                |
| 2. Used before GROUP BY.       | 2. Used after GROUP BY.        |
|                                |                                |
| 3. Cannot directly use         | 3. Can use aggregate           |
|    aggregate functions.        |    functions like COUNT(),     |
|                                |    SUM(), AVG().               |
+--------------------------------+--------------------------------+
|       WHERE = FILTER ROWS      |     HAVING = FILTER GROUPS     |
+--------------------------------+--------------------------------+
*/

SELECT COUNT(DISTINCT o.order_id) AS total_orders
FROM sales.orders AS o
INNER JOIN sales.order_items AS oi
    ON o.order_id = oi.order_id;


    -- customer_id, first_name, last_name, order_count, total_spent

    -- 1st part

    select 
        c.customer_id,
        c.first_name,
        c.last_name,
        o.order_id
    from 
        sales.customers as c
    inner join sales.orders as o
    on c.customer_id = o.customer_id


    -- 2nd part 
    select 
        c.customer_id,
        c.first_name,
        c.last_name,
        count(o.order_id) as Order_Count
    from 
        sales.customers as c
    inner join sales.orders as o
    on c.customer_id = o.customer_id
    group by c.customer_id,c.first_name,c.last_name
    order by count(o.order_id) desc;

    -- 3rd part

    select 
    c.customer_id,
    c.first_name,
    c.last_name,
    count( distinct o.order_id) as order_count,
    sum(oi.quantity * oi.list_price * (1 - discount)) as total_spent
from 
    sales.customers c
inner join sales.orders o 
    on o.customer_id = c.customer_id
inner join sales.order_items oi 
    on oi.order_id = o.order_id
group by 
    c.customer_id, 
    c.first_name, 
    c.last_name
order by sum(oi.quantity * oi.list_price * (1 - discount)) desc 

-- total spent -- 
-- list_price -- price on one item (quantity * list_price)
-- dicount - 15 

select * from sales.order_items;
-- 0.20 == 20% 
-- 100 - 20 = 80
-- 100 * 0.8 = 80


-- 200 * (1 - discount) =
-- 200 * (1 - 0.20) == 200 * 0.80 ==  160

-- Task- find customers who have placed more than two orders

select 
    c.customer_id,
    count(o.order_id) as Total_Order
from 
    sales.customers as c
inner join sales.orders as o
    on o.customer_id = c.customer_id
group by 
     c.customer_id
having count(o.order_id) > 2





select * from sales.customers
select * from sales.orders
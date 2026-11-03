-- CTE (Common Table Expressions)
-- A CTE provides a temporary named result set that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement.
-- CTEs improve readability and can be used for recursive queries.


-- CTE Common Table Expressions 
-- we can read virtual table as a table

--WITH expression_name [(column_name [, ...])]
--AS (
--    CTE_definition
--)
--SQL_statement;

with cte_products as (
	Select 
		p.product_id, 
		p.product_name,
		p.brand_id,
		b.brand_name,p.list_price

	from 
		production.products p
	inner join production.brands b
	on b.brand_id = p.brand_id 
) 
select * from cte_products
Union all
Select * from cte_products;


-- Difficult to handle-- increasing lines of code and difficult to maintain
Select 
		p.product_id, 
		p.product_name,
		p.brand_id,
		b.brand_name,
		p.list_price
	from 
		production.products p
	inner join production.brands b
	on b.brand_id = p.brand_id 

Union all 

Select 
		p.product_id, 
		p.product_name,
		p.brand_id,
		b.brand_name,
		p.list_price

	from 
		production.products p
	inner join production.brands b
	on b.brand_id = p.brand_id 


	with cte_sales_amounts (staff, sales, year) as (
	SELECT    
		s.first_name + ' ' + s.last_name as full_name, 
		SUM(quantity * list_price * (1 - discount))st,
		YEAR(order_date)
	FROM    
		sales.orders o
	INNER JOIN sales.order_items i ON i.order_id = o.order_id
	INNER JOIN sales.staffs s ON s.staff_id = o.staff_id
	GROUP BY 
		first_name + ' ' + last_name,
		year(order_date)
)

--select * from cte_sales_amounts
--where year = 2017;

select sum(sales) as Total_Sales, year from  cte_sales_amounts
group by year;



with cte_avg_staff_order as (
SELECT
    staff_id,
    COUNT(order_id) AS order_count
FROM sales.orders
    WHERE 
        YEAR(order_date) = 2018
GROUP BY staff_id
)
select avg(order_count) as avg_orders_per_staff from cte_avg_staff_order



--- Category_id, category_name, product_count and sales


select 
	c.category_id, c.category_name,
	COUNT(p.product_id) as products_count,
	SUM(oi.quantity * oi.list_price * (1 - oi.discount)) as sales_price
from production.products p
inner join production.categories c 
	on p.category_id = c.category_id
inner join sales.order_items oi
	on p.product_id = oi.product_id
inner join sales.orders o
	on o.order_id = oi.order_id
WHERE o.order_status = 4
group by c.category_id, c.category_name;


-- Now By Using CTE

with cte_category_counts as (
	select 
		c.category_id, c.category_name,
		COUNT(p.product_id) as products_count
	from production.products p
	inner join production.categories c 
		on p.category_id = c.category_id
	group by c.category_id, c.category_name 
),
cte_category_sales as (
	select 
		p.category_id,
		SUM(oi.quantity * oi.list_price * (1 - oi.discount)) as sales_price
	from production.products p
	inner join sales.order_items oi
		on p.product_id = oi.product_id
	inner join sales.orders o
		on o.order_id = oi.order_id
	WHERE o.order_status = 4 -- Completed
	group by p.category_id
)

select c.category_id, category_name, c.products_count, s.sales_price from cte_category_counts c
inner join cte_category_sales s
on s.category_id = c.category_id;
	
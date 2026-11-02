-- Set Operators
-- Set operators (UNION, UNION ALL, INTERSECT, EXCEPT) combine the results of two or more SELECT statements into a single result set.
-- These operators require that the corresponding columns in both SELECT statements have the same data type and number of columns.

-- Key points:
-- 1. UNION combines rows and removes duplicates
-- 2. UNION ALL combines rows and retains duplicates
-- 3. INTERSECT returns only the rows that exist in both result sets
-- 4. EXCEPT (or MINUS) returns only the rows from the first query that don't exist in the second query

-- Syntax:
-- SELECT columns FROM table1
-- UNION
-- SELECT columns FROM table2

-- UNION removes duplicate rows, UNION ALL retains them


-- U = [1,2,3,4,5,6,7]
-- a = [1,2,3]
-- b = [2,5,6,7]

-- Union
-- a U b - [1,2,3,5,6,7]

-- Intersection
-- a | b - [2]

-- Syntax

--query_1
--UNION -- removes duplicate
--query_2

-- The number and the order of the columns must be the same in both queries.
-- The data types of the corresponding columns must be the same or compatible

-- number of columns should be same in union

select first_name,last_name from sales.customers -- 1445
union -- remove duplicate
select first_name,last_name from sales.staffs -- 10 rows

-- after union -- 1454  (1445 + 10 = 1455) 

-- Task -- Find that duplicate name 

select 
	Full_Name,
	count(*) AS Duplicate_Count
from (
	select 
		concat(first_name,' ',last_name) AS Full_Name
from 
	sales.customers 

union all
select 
	concat(first_name,' ',last_name) AS Full_Name
from 
	sales.staffs 
)  AS Combined_Data
group by Full_Name
having count(*) > 1;


select first_name, last_name,
    count(*) as duplicate_count
from sales.customers
group by first_name, last_name
having count(*) > 1;



-- UNION ALL


select first_name,last_name from sales.customers -- 1445
union all
select first_name,last_name from sales.staffs -- 10 rows


-- Error 
select first_name, last_name, city from sales.customers -- 1445 
Union 
select first_name, last_name from sales.staffs; -- 10 


-- Include Null column 
select first_name, last_name, city from sales.customers -- 1445 
Union 
select first_name, last_name, 'karachi' from sales.staffs; -- 10 


-- Intersection 
-- Syntax 

--query_1
--INTERSECT
--query_2


SELECT
    city
FROM
    sales.customers
INTERSECT
SELECT
    city
FROM
    sales.stores
ORDER BY
    city;

select first_name, last_name from sales.customers
INTERSECT
select first_name, last_name from sales.staffs;  


select * from sales.customers
where first_name = 'Justina' and last_name = 'Jenkins';

-- EXCEPT

-- SQL mein EXCEPT ka use tab hota hai jab humein first query ke woh records chahiye hon jo second query mein present nahi hain.
SELECT
    product_id
FROM
    production.products
EXCEPT
SELECT
    product_id
FROM
    sales.order_items;


-- EXCEPT with ORDER BY

SELECT
    product_id
FROM
    production.products
EXCEPT
SELECT
    product_id
FROM
    sales.order_items
ORDER BY 
	product_id;




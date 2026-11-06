-- ============================================================
--  ASSIGNMENT 10 — Group By & Subqueries
--  Database : BikeStores
--  Topics   : Aggregate functions, GROUP BY, HAVING,
--             subqueries in WHERE (IN / NOT IN / scalar),
--             subqueries in FROM (derived tables),
--             subqueries in SELECT
-- ============================================================


-- ============================================================
--  Question 1 — Aggregate Functions
--  From sales.order_items, write ONE query that returns:
--    • total number of order lines
--    • total units sold (SUM of quantity)
--    • average, minimum and maximum list_price
--  Give every column a meaningful alias.
-- ============================================================

SELECT
    COUNT(*) AS Total_Order_Lines,
    SUM(quantity) AS Total_Units_Sold,
    AVG(list_price) AS Average_List_Price,
    MIN(list_price) AS Minimum_List_Price,
    MAX(list_price) AS Maximum_List_Price
FROM
    sales.order_items;


-- ============================================================
--  Question 2 — COUNT(*) vs COUNT(column)
--  a) How many rows are there in sales.customers?
--  b) How many customers have an email on record, and how many
--     have a phone number on record?
--  c) Using the results above, how many customers have NO phone
--     number? Confirm it with a separate query using IS NULL.
--  Add the numbers you get as comments.
-- ============================================================

-- Part a:
select 
    count(*) as Total_Rows
from 
    sales.customers

-- Part b:
select
    COUNT(email) AS Customers_With_Email,
    COUNT(phone) AS Customers_With_Phone
from
    sales.customers


-- Part c:

select 
    count(*) as Customers_Without_Phone
from
    sales.customers
where phone is null   

-- 1267


-- ============================================================
--  Question 3 — GROUP BY
--  a) Find the total units sold (SUM of quantity) for each
--     product_id in sales.order_items, highest first.
--  b) Count the number of customers in each state, highest
--     first.
--  c) Count the number of orders handled by each staff_id and
--     each order_status combination.
-- ============================================================

-- Part a:
select 
    product_id,
    SUM(quantity) As Total_Units_Sold
from 
    sales.order_items 
group by 
    product_id
order by 
    Total_Units_Sold  DESC;

-- Part b:

select 
    count(customer_id) AS Total_State,
    state
from
    sales.customers
group by 
    state
order by Total_State DESC ;


-- Part c:
select  
    staff_id,
    order_status,
    count(*) As Total_Orders
from 
    sales.orders
group by 
    staff_id,
    order_status

-- ============================================================
--  Question 4 — GROUP BY with Joins
--  a) Show category_name and the average list_price of its
--     products (rounded to 2 decimals). Join products and
--     categories.
--  b) Show brand_name and the number of products in each brand,
--     sorted by the product count descending.
--  c) For every customer, show customer_id, first_name,
--     last_name, order_count and total_spent.
--     total_spent = SUM(quantity * list_price * (1 - discount))
--     Hint: use COUNT(DISTINCT order_id) so orders are not
--     counted once per item.
-- ============================================================

-- Part a:
select 
    c.category_name,
    ROUND(AVG(p.list_price),2) AS Average_List_Price
from 
    production.categories as c
inner join 
    production.products as p
on 
    c.category_id = p.category_id
group by 
    c.category_name

-- Part b:
select 
    b.brand_name,
    count(p.product_id) As Total_Product
from 
    production.products p 
inner join 
    production.brands b
on
    p.brand_id = b.brand_id
group by
    b.brand_name
ORDER BY
    Total_Product DESC;
    
-- Part c:
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT o.order_id) AS order_count,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_spent
FROM
    sales.customers AS c
INNER JOIN
    sales.orders AS o
ON
    c.customer_id = o.customer_id
INNER JOIN
    sales.order_items AS oi
ON
    o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    c.customer_id;



-- ============================================================
--  Question 5 — HAVING
--  a) List the model_year values that have more than 50
--     products, with the product count.
--  b) List the customers who have placed 2 or more orders
--     (customer_id and order_count).
--  c) List the product_ids that have sold more than 100 units
--     in total.
--  d) In a comment, explain why part (a) cannot be written
--     with WHERE alone.
-- ============================================================

-- Part a:
SELECT
    model_year,
    COUNT(product_id) AS Total_Products
FROM
    production.products
GROUP BY
    model_year
HAVING
    COUNT(product_id) > 50
ORDER BY
    model_year;

-- Part b:
SELECT
    customer_id,
    COUNT(order_id) AS order_count
FROM
    sales.orders
GROUP BY
    customer_id
HAVING
    COUNT(order_id) >= 2
ORDER BY
    order_count DESC;

-- Part c:
SELECT
    product_id,
    SUM(quantity) AS Total_Units_Sold
FROM
    sales.order_items
GROUP BY
    product_id
HAVING
    SUM(quantity) > 100
ORDER BY
    Total_Units_Sold DESC;

-- Part d (answer as a comment):

-- WHERE cannot be used alone in part (a) because it filters
-- individual rows before GROUP BY, whereas we need to filter
-- groups based on COUNT(product_id).
-- HAVING is used to filter aggregated results after GROUP BY.


-- ============================================================
--  Question 6 — WHERE + GROUP BY + HAVING Together
--  Using only orders placed in the year 2017, find the stores
--  (store_id) whose total revenue is above 100000.
--  Show store_id and total_revenue, highest first.
--  Hint: WHERE filters rows before grouping, HAVING filters
--  groups after grouping.
-- ============================================================

SELECT
    o.store_id,
    SUM(oi.list_price * oi.quantity * (1 - oi.discount)) AS total_revenue
FROM sales.orders AS o
INNER JOIN sales.order_items AS oi
    ON o.order_id = oi.order_id
WHERE YEAR(o.order_date) = 2017
GROUP BY o.store_id
HAVING SUM(oi.list_price * oi.quantity * (1 - oi.discount)) > 100000
ORDER BY total_revenue DESC;




-- ============================================================
--  Question 7 — Subquery in WHERE (IN)
--  a) Return all orders placed by customers who live in
--     'New York'. Use a subquery on sales.customers.
--  b) Return the product_id and product_name of all products
--     that belong to the categories 'Electric Bikes' or
--     'Cruisers Bicycles'. Use a subquery on categories.
--  c) Return the customers (first_name, last_name, city) who
--     have placed at least one order. Use IN with a subquery.
-- ============================================================

-- Part a:
SELECT *
FROM sales.orders
WHERE customer_id IN (
    SELECT customer_id
    FROM sales.customers
    WHERE city = 'New York'
);

-- Part b:
SELECT
    product_id,
    product_name
FROM production.products
WHERE category_id IN (
    SELECT category_id
    FROM production.categories
    WHERE category_name IN ('Electric Bikes', 'Cruisers Bicycles')
);

-- Part c:

SELECT
    first_name,
    last_name,
    city
FROM sales.customers
WHERE customer_id IN (
    SELECT customer_id
    FROM sales.orders
);


-- ============================================================
--  Question 8 — Subquery in WHERE (Scalar & NOT IN)
--  a) Return all products priced ABOVE the overall average
--     list_price. Do not hardcode the average.
--  b) Return all products priced BELOW the overall average
--     list_price, and write a second query that counts how
--     many such products there are.
--  c) Return the customers who have NEVER placed an order,
--     using NOT IN.
--  d) Return the products that have never been ordered
--     (not present in sales.order_items).
--  Hint for c and d: filter out NULLs inside the subquery so
--  NOT IN works correctly.
-- ============================================================

-- Part a:
SELECT *
FROM production.products
WHERE list_price > (
    SELECT AVG(list_price)
    FROM production.products
);

-- Part b:
SELECT
    product_id,
    product_name,
    list_price
FROM production.products
WHERE list_price < (
    SELECT AVG(list_price)
    FROM production.products
);

-- Part c:
SELECT
    first_name,
    last_name,
    city
FROM sales.customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM sales.orders
    WHERE customer_id IS NOT NULL
);

-- Part d:

SELECT *
FROM production.products
WHERE product_id NOT IN (
    SELECT product_id
    FROM sales.order_items
    WHERE product_id IS NOT NULL
);


-- ============================================================
--  Question 9 — Subquery in FROM (Derived Table)
--  a) First find the number of orders handled by each staff
--     member. Then, using that result as a derived table,
--     calculate the average, minimum and maximum order count
--     per staff member.
--  b) Using a derived table of total_spent per customer,
--     return the average total_spent across all customers.
--  Remember: a derived table needs an alias.
-- ============================================================

-- Part a:
SELECT
    AVG(order_count) AS average_orders,
    MIN(order_count) AS minimum_orders,
    MAX(order_count) AS maximum_orders
FROM (
    SELECT
        staff_id,
        COUNT(order_id) AS order_count
    FROM sales.orders
    GROUP BY staff_id
) AS staff_orders;

-- Part b:

SELECT
    AVG(total_spent) AS average_total_spent
FROM (
    SELECT
        customer_id,
        SUM(oi.list_price * oi.quantity * (1 - oi.discount)) AS total_spent
    FROM sales.orders AS o
    INNER JOIN sales.order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY customer_id
) AS customer_spending;


-- ============================================================
--  Question 10 — Subquery in SELECT
--  a) For each product (product_id, product_name, list_price),
--     show the total quantity sold as a column named
--     units_sold, using a correlated subquery on
--     sales.order_items.
--  b) For each order (order_id, order_date), show the number of
--     items in that order as item_count and the highest
--     list_price in that order as max_item_price.
--  c) Show the difference between each product's list_price and
--     the overall average list_price as price_difference.
-- ============================================================

-- Part a:
SELECT
    p.product_id,
    p.product_name,
    p.list_price,
    (
        SELECT SUM(oi.quantity)
        FROM sales.order_items AS oi
        WHERE oi.product_id = p.product_id
    ) AS units_sold
FROM production.products AS p;

-- Part b:

SELECT
    o.order_id,
    o.order_date,
    (
        SELECT COUNT(*)
        FROM sales.order_items AS oi
        WHERE oi.order_id = o.order_id
    ) AS item_count,
    (
        SELECT MAX(oi.list_price)
        FROM sales.order_items AS oi
        WHERE oi.order_id = o.order_id
    ) AS max_item_price
FROM sales.orders AS o;
-- Part c:
SELECT
    product_id,
    product_name,
    list_price,
    list_price - (
        SELECT AVG(list_price)
        FROM production.products
    ) AS price_difference
FROM production.products;



-- ============================================================
--  Question 11 — Challenge
--  Find the customers whose total_spent is higher than the
--  average total_spent of all customers.
--  Show customer_id, first_name, last_name and total_spent,
--  highest first.
--  Hint: combine GROUP BY + HAVING with a scalar subquery
--  (or a derived table) that calculates the average.
-- ============================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(oi.list_price * oi.quantity * (1 - oi.discount)) AS total_spent
FROM sales.customers AS c
INNER JOIN sales.orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN sales.order_items AS oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING SUM(oi.list_price * oi.quantity * (1 - oi.discount)) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT
            o.customer_id,
            SUM(oi.list_price * oi.quantity * (1 - oi.discount)) AS customer_total
        FROM sales.orders AS o
        INNER JOIN sales.order_items AS oi
            ON o.order_id = oi.order_id
        GROUP BY o.customer_id
    ) AS customer_spending
)
ORDER BY total_spent DESC;

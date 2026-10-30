                                   
                                   
                                ---------JOINS----------


SELECT product_id,product_name,brand_id FROM production.products
SELECT * FROM production.brands;
-- Inner Join

SELECT 
     p.product_id,
     p.product_name,
     p.brand_id,
     b.brand_name
FROM 
     production.products p
inner join production.brands b
on b.brand_id = p.brand_id

SELECT product_id,product_name,category_id FROM production.products
SELECT * FROM production.categories;

SELECT 
    p.product_id,
    p.product_name,
    c.category_id,
    c.category_name
FROM 
    production.products p
inner join production.categories c
on c.category_id = p.category_id

SELECT
    o.order_id,
    o.order_date,
    s.store_name,
    s.city
FROM sales.orders AS o
INNER JOIN sales.stores AS s
    ON o.store_id = s.store_id
WHERE o.order_id IN (1, 2, 3, 4);

-- LEFT JOIN
SELECT
    p.product_name,
    oi.order_id,
    oi.quantity
FROM production.products AS p
LEFT JOIN sales.order_items AS oi
    ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;

-- RIGHT JOIN


SELECT
    p.product_name,
    oi.order_id,
    oi.quantity
FROM sales.order_items AS oi
RIGHT JOIN  production.products AS p
    ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;



SELECT
    st.store_name,
    s.first_name,
    s.last_name
FROM sales.staffs AS s
RIGHT JOIN sales.stores AS st
    ON s.store_id = st.store_id; 


-- FULL OUTER JOIN
-- CREATE SCHEMA pm;



CREATE TABLE pm.projects(
    id INT PRIMARY KEY IDENTITY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE pm.members(
    id INT PRIMARY KEY IDENTITY,
    name VARCHAR(120) NOT NULL,
    project_id INT,
    FOREIGN KEY (project_id) 
        REFERENCES pm.projects(id)
);

INSERT INTO 
    pm.projects(title)
VALUES
    ('New CRM for Project Sales'),
    ('ERP Implementation'),
    ('Develop Mobile Sales Platform');


INSERT INTO
    pm.members(name, project_id)
VALUES
    ('John Doe', 1),
    ('Lily Bush', 1),
    ('Jane Doe', 2),
    ('Jack Daniel', null);


SELECT * FROM pm.projects;
SELECT * FROM pm.members;

SELECT 
    m.name as member, 
    p.title as project
FROM 
    pm.members m
FULL OUTER JOIN pm.projects p 
ON p.id = m.project_id;


SELECT 
    m.name as member, 
    p.title as project
FROM 
    pm.members m
left JOIN pm.projects p 
ON p.id = m.project_id;

SELECT 
    m.name as member, 
    p.title as project
FROM 
    pm.members m
right JOIN pm.projects p 
ON p.id = m.project_id;



SELECT 
    m.name as member, 
    p.title as project
FROM 
    pm.members m
inner JOIN pm.projects p 
ON p.id = m.project_id;



SELECT
    p.product_name,
    s.quantity
FROM production.products AS p
FULL OUTER JOIN production.stocks AS s
    ON p.product_id = s.product_id


-- Joining more than one table

-- Customer details (first_name, last_name)
-- order details (order status, shipped_date)
-- order_items (quantity)


SELECT 
    concat(first_name, ' ',last_name) As Full_Name ,
    o.order_status,
    o.shipped_date,
    oi.quantity,
    p.product_name
FROM 
    sales.customers as c
Inner Join sales.orders as o
on o.customer_id = c.customer_id
inner join sales.order_items oi
    on o.order_id = oi.order_id
inner join production.products p 
    on oi.product_id = p.product_id


select * from sales.order_items
where order_id in (1,2);


select * from sales.orders;
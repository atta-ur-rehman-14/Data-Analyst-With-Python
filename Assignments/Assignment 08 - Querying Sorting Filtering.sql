-- ============================================================
--  ASSIGNMENT 01 — Querying, Sorting & Filtering
--  Database : BikeStores
--  Topics   : SELECT, WHERE, ORDER BY, TOP/OFFSET-FETCH,
--             DISTINCT, AND / OR
-- ============================================================
CREATE DATABASE BikeStores;
USE BikeStores;
create schema bikestores;

CREATE TABLE bikestores.customers
(
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    state CHAR(2),
    phone VARCHAR(20) NULL
);


INSERT INTO bikestores.customers
(customer_id, first_name, last_name, city, state, phone)
VALUES
(1, 'John', 'Smith', 'Los Angeles', 'CA', '123-456-7890'),
(2, 'Ali', 'Khan', 'San Diego', 'CA', NULL),
(3, 'Emma', 'Brown', 'San Francisco', 'CA', '555-123-4567'),
(4, 'David', 'Wilson', 'Houston', 'TX', '444-555-6666'),
(5, 'Sarah', 'Davis', 'Sacramento', 'CA', '777-888-9999'),
(6, 'Michael', 'Taylor', 'Austin', 'TX', NULL),
(7, 'Ayesha', 'Ahmed', 'San Jose', 'CA', '111-222-3333'),
(8, 'James', 'Miller', 'New York', 'NY', '222-333-4444');


SELECT *
FROM bikestores.customers;


-- ============================================================
--  Question 1 — SELECT & WHERE
--  Retrieve the first name, last name, city, and phone number
--  of all customers who live in the state of 'CA' (California)
--  and have a phone number on record.
-- ============================================================
SELECT
    first_name,
    last_name,
    city,
    phone
FROM bikestores.customers
WHERE state = 'CA'
  AND phone IS NOT NULL;




-- ============================================================
--  Question 2 — ORDER BY (Multiple Columns)
--  Fetch the product_id, product_name, model_year, and
--  list_price of all products.
--  Sort the results by model_year in descending order, and
--  within the same year sort by list_price in ascending order.
-- ============================================================

CREATE TABLE bikestores.products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    model_year INT NOT NULL,
    list_price DECIMAL(10,2) NOT NULL
);



INSERT INTO bikestores.products
(product_id, product_name, model_year, list_price)
VALUES
(1, 'Mountain Bike', 2025, 1200.00),
(2, 'Road Bike', 2025, 900.00),
(3, 'City Bike', 2024, 600.00),
(4, 'Electric Bike', 2025, 2500.00),
(5, 'Hybrid Bike', 2024, 800.00),
(6, 'Kids Bike', 2023, 250.00),
(7, 'BMX Bike', 2024, 450.00),
(8, 'Touring Bike', 2023, 700.00);


SELECT *
FROM bikestores.products;

SELECT
    product_id,
    product_name,
    model_year,
    list_price
FROM bikestores.products
ORDER BY
    model_year DESC,
    list_price ASC;




-- ============================================================
--  Question 3 — TOP N & TOP PERCENT
--  a) Return the top 5 most expensive products showing only
--     product_name and list_price.
--  b) Return the top 5% of cheapest products (all columns).
--     How many rows does the 5% result return? Add the row
--     count as a comment in your answer.
-- ============================================================

-- Part a:

SELECT TOP 5
    product_name,
    list_price
FROM bikestores.products
ORDER BY list_price DESC;


-- Part b:


SELECT TOP 5 PERCENT *
FROM bikestores.products
ORDER BY list_price ASC;


SELECT COUNT(*) AS TotalRows
FROM
(
    SELECT TOP 5 PERCENT *
    FROM bikestores.products
    ORDER BY list_price ASC
) AS CheapestProducts;



-- ============================================================
--  Question 4 — OFFSET & FETCH (Pagination)
--  The sales team wants to browse products page by page,
--  10 products per page, sorted by list_price descending.
--  Write queries to return:
--    a) Page 1  (rows  1 – 10)
--    b) Page 2  (rows 11 – 20)
--    c) Page 3  (rows 21 – 30)
-- ============================================================

-- Page 1:
SELECT *
FROM bikestores.products
ORDER BY list_price DESC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;


-- Page 2:

SELECT *
FROM bikestores.products
ORDER BY list_price DESC
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;
-- Page 3:

SELECT *
FROM bikestores.products
ORDER BY list_price DESC
OFFSET 20 ROWS
FETCH NEXT 10 ROWS ONLY

-- ============================================================
--  Question 5 — DISTINCT
--  a) List all unique states in which BikeStores has customers.
--     Sort the result alphabetically.
--  b) List every unique combination of state and city,
--     sorted by state then city (both ascending).
--  c) How many unique model years exist in the products table?
--     (Retrieve the distinct values; count them manually or
--     use COUNT — your choice.)
-- ============================================================

-- Part a:


SELECT DISTINCT state
FROM bikestores.customers
ORDER BY state ASC;


-- Part b:

SELECT DISTINCT
    state,
    city
FROM bikestores.customers
ORDER BY
    state ASC,
    city ASC;
-- Part c:

SELECT COUNT(DISTINCT model_year) AS UniqueModelYears
FROM bikestores.products;


SELECT DISTINCT model_year
FROM bikestores.products
ORDER BY model_year ASC;
GO


-- ============================================================
--  Question 6 — Logical Operators (AND / OR)
--  Write a single query that returns the product_id,
--  product_name, brand_id, category_id, and list_price for
--  products that meet ALL of the following conditions:
--    • list_price is between $500 and $1500 (inclusive)
--    • model_year is 2019 OR 2020
--  Sort the results by list_price ascending.
--  Hint: use parentheses to control the order of evaluation.
-- ============================================================

SELECT
    product_id,
    product_name,
    brand_id,
    category_id,
    list_price
FROM bikestores.products
WHERE list_price BETWEEN 500 AND 1500
  AND (model_year = 2019 OR model_year = 2020)
ORDER BY list_price ASC;

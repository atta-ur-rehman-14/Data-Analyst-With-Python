                                   
                                   
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


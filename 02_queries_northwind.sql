-- cmd + return to execute the queries 

-- 1. Get the names and the quantities in stock for each product.
SELECT product_name, quantity_per_unit, units_in_stock
 FROM products;
 
-- 2.  Get a list of current products (Product ID and name).
SELECT product_id, product_name FROM products;

-- 3. Get a list of the most and least expensive products (name and unit price).
SELECT product_name, unit_price 
FROM products
ORDER BY unit_price DESC
LIMIT 10; 

SELECT product_name, unit_price 
FROM products
ORDER BY unit_price ASC
LIMIT 10;

-- 4. Get products that cost less than $20.
SELECT product_name, unit_price 
	FROM products
	WHERE unit_price < 20;
	
-- 5. Get products that cost between $15 and $25.
SELECT product_name, unit_price
	FROM products
	WHERE unit_price BETWEEN 15 AND 25;	

-- 6. Get products above average price.


SELECT AVG(unit_price)
	FROM products;


SELECT product_name, unit_price
	FROM products
	ORDER BY unit_price
	LIMIT 28.86;


SELECT product_name, AVG(unit_price)
FROM products 
GROUP BY product_name
HAVING AVG(unit_price) > 25;

-- 7. Find the ten most expensive products.
SELECT DISTINCT product_name, unit_price
	FROM products
	ORDER BY unit_price DESC
	LIMIT 10;


-- nested queries:
-- select3 * from (select2 * from (select1 * from) )
-- where select3 is your last and select1 yout first

-- or create views:
-- CREATE VIEW view_name AS SELECT * 

/* 
    
    
    Get a list of discontinued products (Product ID and name).
    Count current and discontinued products.
    Find products with less units in stock than the quantity on order.
    Find the customer who had the highest order amount
    Get orders for a given employee and the according customer
    Find the hiring age of each employee
    Create views and/or named queries for some of these queries


*/
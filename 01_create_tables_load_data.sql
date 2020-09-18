


/*
Northwind Database. 
It is a sample database that is shipped along with Microsoft Access. 
The data is about “Northwind Traders”, a fictional company. 
The database contains all sales transactions between the company 
and its customers as well as purchases from Northwinds suppliers.

*/

-- create the table definitions:
-- Include columns for all fields from the northwind data.
-- Choose a name for the table
-- Choose aproppriate data types.
-- Make sure to include a primary key column
-- Decide whether you need NOT NULL on a column


-- execute file in commandline:
-- psql -h localhost -U postgres -d northwind -f ~/repos/dashboard_northwind/01_create_tables_load_data.sql

-- use the SQL COPY command to load the CSV files into the database
-- COPY my-table-name FROM 'filename_as_absolute_path.txt' DELIMITER ',' CSV HEADER;


--COPY my-table-name FROM 'filename_as_absolute_path.txt' DELIMITER ',' CSV HEADER;


--DROP TABLE employee_territorities;


CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category_id INT,
    category_name VARCHAR(100) NOT NULL,
    description VARCHAR,
    picture VARCHAR
);

-- copy csv contents
COPY categories(category_id, category_name, description, picture)
FROM '/Users/lara/repos/dashboard_northwind/data/categories.csv'
DELIMITER ','
CSV HEADER;




CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    customer_ID CHAR(5) NOT NULL,
    company_name VARCHAR NOT NULL,
    contact_name VARCHAR NOT NULL,
    contact_title VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    city VARCHAR NOT NULL,
    region VARCHAR,
    postal_code VARCHAR(10),
    country VARCHAR,
    phone VARCHAR,
    fax VARCHAR
);



COPY customers(customer_ID, company_name, contact_name, contact_title, 
address, city, region, postal_code, country, phone, fax)
FROM '/Users/lara/repos/dashboard_northwind/data/customers.csv'
DELIMITER ','
CSV HEADER;



CREATE TABLE employee_territorities(
    id SERIAL PRIMARY KEY,
    employee_id SMALLINT,
    territory_id INT 
);


COPY employee_territorities(employee_id, territory_id)
FROM '/Users/lara/repos/dashboard_northwind/data/employee_territories.csv'
DELIMITER ','
CSV HEADER;


-- has extra column, some prob
CREATE TABLE employees(
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(300) NOT NULL,
    first_name VARCHAR(300) NOT NULL,
    title_of_courtesy VARCHAR(5),
    birth_date TIMESTAMP NOT NULL,
    hire_date TIMESTAMP NOT NULL,
    address VARCHAR(500) NOT NULL,
    city VARCHAR(500) NOT NULL,
    region VARCHAR(100),
    postal_code VARCHAR(10),
    country VARCHAR(300),
    phone VARCHAR(50),
    extension INT,
    photo VARCHAR(500),
    notes VARCHAR,
    reports_to INT,
    photo_path VARCHAR
);

COPY employees(last_name, first_name, title_of_courtesy, birth_date,
hire_date, address, city, region, postal_code, country, phone, extension,
photo, notes, reports_to, photo_path)
FROM '/Users/lara/repos/dashboard_northwind/data/employees.csv'
DELIMITER ','
CSV HEADER;


CREATE TABLE order_details(
    id SERIAL PRIMARY KEY,
    order_id SMALLINT NOT NULL,
    product_id SMALLINT NOT NULL,
    unit_price REAL NOT NULL,
    quantity SMALLINT NOT NULL,
    discount REAL
);

COPY order_details(order_id, product_id, unit_price, quantity, discount)
FROM '/Users/lara/repos/dashboard_northwind/data/order_details.csv'
DELIMITER ','
CSV HEADER;



CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    order_id SMALLINT NOT NULL,
    customer_id CHAR(5) NOT NULL,
    employee_id SMALLINT NOT NULL,
    order_date TIMESTAMP NOT NULL,
    required_date TIMESTAMP,
    shipped_date VARCHAR, -- how to deal with NULL in timestamp col?
    ship_via SMALLINT NOT NULL,
    freight REAL NOT NULL,
    ship_name VARCHAR(500) NOT NULL,
    ship_adress VARCHAR(500) NOT NULL,
    ship_city VARCHAR(500) NOT NULL,
    ship_region VARCHAR(500),
    ship_postal_code VARCHAR(100) NOT NULL,
    ship_country VARCHAR(200) NOT NULL
);


COPY orders(order_id, customer_id, employee_id, order_date,
required_date, shipped_date, ship_via, freight, ship_name, ship_adress,
ship_city, ship_region, ship_postal_code, ship_country)
FROM '/Users/lara/repos/dashboard_northwind/data/orders.csv'
DELIMITER ','
CSV HEADER;


CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    product_id SMALLINT,
    product_name VARCHAR(500) NOT NULL,
    supplier_id SMALLINT NOT NULL,
    category_id SMALLINT NOT NULL,
    quantity_per_unit VARCHAR (200) NOT NULL,
    unit_price REAL NOT NULL,
    units_in_stock SMALLINT NOT NULL,
    units_on_order SMALLINT NOT NULL,
    reorder_level SMALLINT NOT NULL,
    discontinued SMALLINT NOT NULl
);

COPY products(product_id, product_name, supplier_id, category_id,
quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level,
discontinued)
FROM '/Users/lara/repos/dashboard_northwind/data/products.csv'
DELIMITER ','
CSV HEADER;




CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    region_id SMALLINT,
    region_description VARCHAR(200)
);


COPY regions(region_id, region_description)
FROM '/Users/lara/repos/dashboard_northwind/data/regions.csv'
DELIMITER ','
CSV HEADER;



CREATE TABLE shippers(
    id SERIAL PRIMARY KEY,
    shipper_id SMALLINT,
    company_name VARCHAR(300) NOT NULL,
    phone VARCHAR(50)
);

COPY shippers(shipper_id, company_name, phone)
FROM '/Users/lara/repos/dashboard_northwind/data/shippers.csv'
DELIMITER ','
CSV HEADER;



CREATE TABLE suppliers(
    id SERIAL PRIMARY KEY,
    supplier_id SMALLINT NOT NULL,
    company_name VARCHAR(300) NOT NULL,
    contact_name VARCHAR(300) NOT NULL,
    contact_title VARCHAR(300) NOT NULL,
    address VARCHAR NOT NULL,    
    city VARCHAR(300) NOT NULL,
    region VARCHAR,
    postal_code VARCHAR(10) NOT NULL,
    country VARCHAR NOT NULL,
    phone VARCHAR(20),
    fax VARCHAR(20),
    homepage VARCHAR
);

COPY suppliers(supplier_id, company_name, contact_name, contact_title,
address, city, region, postal_code, country, phone, fax, homepage)
FROM '/Users/lara/repos/dashboard_northwind/data/suppliers.csv'
DELIMITER ','
CSV HEADER;



CREATE TABLE territories(
    id SERIAL PRIMARY KEY,
    territory_id INT,
    territory_description VARCHAR,
    region_id SMALLINT

);


COPY territories(territory_id, territory_description, region_id)
FROM '/Users/lara/repos/dashboard_northwind/data/territories.csv'
DELIMITER ','
CSV HEADER;



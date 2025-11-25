/*
=============================================================
DDL Script: Create tables in the Bronze schema
-------------------------------------------------------------
Script Purpose:
	This script creates tables in the 'bronze' schema - 
	dropping tables first if they already exist in the schema,
	it then define the DDL structure of the tables.
=============================================================
*/

IF OBJECT_ID ('bronze.customers', 'U') IS NOT NULL
	DROP TABLE bronze.customers;
CREATE TABLE bronze.customers (
customer_id INT,
age INT,
gender NVARCHAR(20),
marital_status NVARCHAR(20),
customer_city NVARCHAR(50),
customer_state NVARCHAR(50)
);

IF OBJECT_ID ('bronze.transactions', 'U') IS NOT NULL
	DROP TABLE bronze.transactions;
CREATE TABLE bronze.transactions (
transaction_id INT,
customer_id INT,
product_id INT,
transaction_date DATETIME,
quantity INT,
unit_price DECIMAL(18,2),
discount_applied DECIMAL(18,2),
payment_method NVARCHAR(50)
);

IF OBJECT_ID ('bronze.products', 'U') IS NOT NULL
	DROP TABLE bronze.products;
CREATE TABLE bronze.products (
product_id INT,
product_name NVARCHAR(50),
product_category NVARCHAR(50),
product_manufacture_date DATETIME,
product_expiry_date DATETIME
);

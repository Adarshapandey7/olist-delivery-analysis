-- Create a new database named "olist" for this project.
/* 
CREATE DATABASE olist; 
*/


-- Create a dedicated schema (namespace) named "olist" to organize all tables for this project.
-- This keeps the Olist datasets separate from the default "public" schema
-- and makes it easier to manage, query, or drop the entire project later if needed.

/*
CREATE SCHEMA IF NOT EXISTS olist;
*/

-- Create all tables matching the nine CSV files from the Olist dataset

/*
-- 1. Customers table
CREATE TABLE IF NOT EXISTS olist.customers (
  customer_id TEXT,
  customer_unique_id TEXT,
  customer_zip_code_prefix INT,
  customer_city TEXT,
  customer_state TEXT
);
-- 2. Orders table
CREATE TABLE IF NOT EXISTS olist.orders (
  order_id TEXT,
  customer_id TEXT,
  order_status TEXT,
  order_purchase_timestamp TIMESTAMP,
  order_approved_at TIMESTAMP,
  order_delivered_carrier_date TIMESTAMP,
  order_delivered_customer_date TIMESTAMP,
  order_estimated_delivery_date TIMESTAMP
);

-- 3. Order items table
CREATE TABLE IF NOT EXISTS olist.order_items (
  order_id TEXT,
  order_item_id INT,
  product_id TEXT,
  seller_id TEXT,
  shipping_limit_date TIMESTAMP,
  price NUMERIC,
  freight_value NUMERIC
);

-- 4. Order payments table
CREATE TABLE IF NOT EXISTS olist.order_payments (
  order_id TEXT,
  payment_sequential INT,
  payment_type TEXT,
  payment_installments INT,
  payment_value NUMERIC
);

-- 5. Order reviews table
CREATE TABLE IF NOT EXISTS olist.order_reviews (
  review_id TEXT,
  order_id TEXT,
  review_score INT,
  review_comment_title TEXT,
  review_comment_message TEXT,
  review_creation_date TIMESTAMP,
  review_answer_timestamp TIMESTAMP
);

-- 6. Products table
CREATE TABLE IF NOT EXISTS olist.products (
  product_id TEXT,
  product_category_name TEXT,
  product_name_length INT,
  product_description_length INT,
  product_photos_qty INT,
  product_weight_g NUMERIC,
  product_length_cm NUMERIC,
  product_height_cm NUMERIC,
  product_width_cm NUMERIC
);

-- 7. Product category translations table
CREATE TABLE IF NOT EXISTS olist.product_category_name_translation (
  product_category_name TEXT,
  product_category_name_english TEXT
);

-- 8. Sellers table
CREATE TABLE IF NOT EXISTS olist.sellers (
  seller_id TEXT,
  seller_zip_code_prefix INT,
  seller_city TEXT,
  seller_state TEXT
);

-- 9. Geolocation table
CREATE TABLE IF NOT EXISTS olist.geolocation (
  geolocation_zip_code_prefix INT,
  geolocation_lat NUMERIC,
  geolocation_lng NUMERIC,
  geolocation_city TEXT,
  geolocation_state TEXT
);
*/

-- Importing all Olist CSV datasets into their respective tables
-- Each \copy command reads data from the local CSV file and inserts it into the table.
-- Note: Using \copy (client-side) avoids permission issues and handles local paths correctly.

/*
COPY olist.customers
FROM 'C:/Business Analytics Project/olist_customers_dataset.csv'
WITH (FORMAT csv, HEADER true);

COPY olist.orders
FROM 'C:/Business Analytics Project/olist_orders_dataset.csv'
WITH (FORMAT csv, HEADER true);

COPY olist.order_items
FROM 'C:/Business Analytics Project/olist_order_items_dataset.csv'
WITH (FORMAT csv, HEADER true);

COPY olist.order_payments
FROM 'C:/Business Analytics Project/olist_order_payments_dataset.csv'
WITH (FORMAT csv, HEADER true);

COPY olist.products
FROM 'C:/Business Analytics Project/olist_products_dataset.csv'
WITH (FORMAT csv, HEADER true);

COPY olist.product_category_name_translation
FROM 'C:/Business Analytics Project/product_category_name_translation.csv'
WITH (FORMAT csv, HEADER true);

COPY olist.sellers
FROM 'C:/Business Analytics Project/olist_sellers_dataset.csv'
WITH (FORMAT csv, HEADER true);

COPY olist.geolocation
FROM 'C:/Business Analytics Project/olist_geolocation_dataset.csv'
WITH (FORMAT csv, HEADER true);

COPY olist.order_reviews
FROM 'C:/Business Analytics Project/olist_order_reviews_dataset.csv'
WITH (FORMAT csv, HEADER true);
*/
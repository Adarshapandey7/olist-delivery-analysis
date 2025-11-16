-- I will begin next step in data cleaning by combining tables, and over time identify the columns that are irrelavant


-- 1. Joining tables order_items and orders
/*
CREATE TABLE olist.orders_items_join AS
SELECT
    -- Select the unique join key once
    o.order_id,
    
    -- Select all columns from the orders table (excluding the second order_id)
    o.customer_id, 
    o.order_status, 
    o.order_purchase_timestamp,
    -- ... other columns from olist.orders
    
    -- Select all columns from the order_items table
    oi.order_item_id, 
    oi.product_id, 
    oi.seller_id,
    oi.shipping_limit_date, 
    oi.price, 
    oi.freight_value 
    -- ... other columns from olist.order_items

FROM olist.orders AS o
JOIN olist.order_items AS oi
    ON o.order_id = oi.order_id;
*/    


-- 2. Joining customers table to above created table
/*
CREATE TABLE olist.orders_items_customers AS
SELECT
    oi.*,                       -- everything from orders + order_items
    c.customer_city,
    c.customer_state,
    c.customer_zip_code_prefix
FROM olist.orders_items_join AS oi
LEFT JOIN olist.customers AS c
    ON oi.customer_id = c.customer_id;
*/


-- 3. Joining sellers table to above created table

/*
CREATE TABLE olist.orders_items_cust_sellers AS
SELECT
    oic.*,                      -- previous table columns
    s.seller_city,
    s.seller_state,
    s.seller_zip_code_prefix
FROM olist.orders_items_customers AS oic
LEFT JOIN olist.sellers AS s
    ON oic.seller_id = s.seller_id;
*/


-- 4. Joining products table to above

/*
CREATE TABLE olist.orders_items_cust_sellers_prod AS
SELECT
    oics.*,                     -- previous table columns
    p.product_category_name,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM olist.orders_items_cust_sellers AS oics
LEFT JOIN olist.products AS p
    ON oics.product_id = p.product_id;
*/


-- 5. Joining reviews table to above

/*
CREATE TABLE olist.orders_items_cust_sellers_prod_reviews AS
SELECT
    oicsp.*,                    -- previous table columns
    r.review_score
FROM olist.orders_items_cust_sellers_prod AS oicsp
LEFT JOIN olist.order_reviews AS r
    ON oicsp.order_id = r.order_id;
*/

-- 6. Joining payments table to above

/*
CREATE TABLE olist.orders_items_full AS
SELECT
    oicspr.*,                   -- all previous columns
    pay.payment_type,
    pay.payment_installments,
    pay.payment_value
FROM olist.orders_items_cust_sellers_prod_reviews AS oicspr
LEFT JOIN olist.order_payments AS pay
    ON oicspr.order_id = pay.order_id;
*/


--- At this poit in my analysis, I found that geolocation datset is slightly irrelevant hence i will exclude it
-- SELECT * FROM olist.geolocation;
-- SELECT * FROM olist.orders_items_full;

-- now finally joining the product category name translation table

/*
CREATE TABLE olist.final_data AS
SELECT
    f.*,  -- all existing columns from your big table
    t.product_category_name_english
FROM olist.orders_items_full AS f
LEFT JOIN olist.product_category_name_translation AS t
    ON f.product_category_name = t.product_category_name;
*/

-- SELECT * FROM olist.final_data;

-- Dropping the column with portuguese product category name

/*
ALTER TABLE olist.final_data
DROP COLUMN product_category_name;
*/

-- Renaming the product category name english to just product category name

/*
ALTER TABLE olist.final_data
RENAME COLUMN product_category_name_english TO product_category_name;
*/

SELECT * FROM olist.final_data;

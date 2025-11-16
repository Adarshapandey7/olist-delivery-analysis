-- =========================================================
--  DATA UNDERSTANDING
-- Goal: Explore each dataset to understand structure, columns,
-- and relationships for later merging and analysis.
-- =========================================================

-- 1️ Customers Table
SELECT * FROM olist.customers LIMIT 5;
-- Columns:
-- customer_id: unique identifier for each customer
-- customer_unique_id: anonymized but consistent across orders
-- customer_zip_code_prefix: numeric ZIP code prefix
-- customer_city: city name of customer
-- customer_state: two-letter state code (e.g., SP, RJ, MG)

-- 2️ Orders Table
SELECT * FROM olist.orders LIMIT 5;
-- Columns:
-- order_id: unique order identifier
-- customer_id: links to olist.customers
-- order_status: delivered, shipped, canceled, etc.
-- order_purchase_timestamp: when order was made
-- order_approved_at: when payment was approved
-- order_delivered_carrier_date: when shipment left seller
-- order_delivered_customer_date: when customer received it
-- order_estimated_delivery_date: system’s estimated delivery

-- 3️ Order Items Table
SELECT * FROM olist.order_items LIMIT 5;
-- Columns:
-- order_id: links to olist.orders
-- order_item_id: index of item within order
-- product_id: links to olist.products
-- seller_id: links to olist.sellers
-- shipping_limit_date: deadline for seller to ship
-- price: item price
-- freight_value: shipping cost charged to buyer

-- 4️ Order Payments Table
SELECT * FROM olist.order_payments LIMIT 5;
-- Columns:
-- order_id: links to olist.orders
-- payment_type: credit card, boleto, voucher, etc.
-- payment_installments: number of installments
-- payment_value: total payment amount

-- 5️ Order Reviews Table
SELECT * FROM olist.order_reviews LIMIT 5;
-- Columns:
-- review_id: unique review identifier
-- order_id: links to olist.orders
-- review_score: rating (1–5)
-- review_comment_title & review_comment_message: text feedback
-- review_creation_date & review_answer_timestamp: review timeline

-- 6️ Products Table
SELECT * FROM olist.products LIMIT 5;
-- Columns:
-- product_id: unique product identifier
-- product_category_name: category in Portuguese
-- product_name_length, product_description_length, product_photos_qty
-- product_weight_g, product_length_cm, product_height_cm, product_width_cm

-- 7️ Product Category Translation Table
SELECT * FROM olist.product_category_name_translation LIMIT 5;
-- Columns:
-- product_category_name: Portuguese name
-- product_category_name_english: English translation

-- 8️ Sellers Table
SELECT * FROM olist.sellers LIMIT 5;
-- Columns:
-- seller_id: unique identifier for seller
-- seller_zip_code_prefix, seller_city, seller_state: location info

-- 9️ Geolocation Table
SELECT * FROM olist.geolocation LIMIT 5;
-- Columns:
-- geolocation_zip_code_prefix: matches customer/seller ZIP prefix
-- geolocation_lat, geolocation_lng: coordinates
-- geolocation_city, geolocation_state: location names


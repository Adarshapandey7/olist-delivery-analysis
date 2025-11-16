-- customers table cleaning
-- Check for NULL or duplicate values

-- 1. Checking customers table
-- SELECT * FROM olist.customers;

-- SELECT * FROM olist.customers WHERE customer_id is NULL;
-- SELECT * FROM olist.customers WHERE customer_unique_id is NULL;
-- SELECT * FROM olist.customers WHERE customer_zip_code_prefix is NULL;
-- SELECT * FROM olist.customers WHERE customer_city is NULL;
-- SELECT * FROM olist.customers WHERE customer_state is NULL;



-- 2. Checking orders table
-- SELECT * FROM olist.orders;

-- SELECT * FROM olist.orders WHERE order_id IS NULL;
-- SELECT * FROM olist.orders WHERE customer_id IS NULL;
-- SELECT * FROM olist.orders WHERE order_status IS NULL;
-- SELECT * FROM olist.orders WHERE order_purchase_timestamp IS NULL;

    -- SELECT * FROM olist.orders WHERE order_approved_at IS NULL;
    --> This column has null values

    -- SELECT * FROM olist.orders WHERE order_delivered_carrier_date IS NULL;
    --> This column has null values

    -- SELECT * FROM olist.orders WHERE order_delivered_customer_date IS NULL;
    --> This column has null values

-- SELECT * FROM olist.orders WHERE order_estimated_delivery_date IS NULL;



-- 3. Checking order items table 
-- SELECT * FROM olist.order_items

-- SELECT * FROM olist.order_items WHERE order_id IS NULL;
-- SELECT * FROM olist.order_items WHERE order_item_id IS NULL;
-- SELECT * FROM olist.order_items WHERE product_id IS NULL;
-- SELECT * FROM olist.order_items WHERE seller_id IS NULL;
-- SELECT * FROM olist.order_items WHERE shipping_limit_date IS NULL;
-- SELECT * FROM olist.order_items WHERE price IS NULL;
-- SELECT * FROM olist.order_items WHERE freight_value IS NULL;



-- 4. Checking order payments table
-- SELECT * FROM olist.order_payments

-- SELECT * FROM olist.order_payments WHERE order_id IS NULL;
-- SELECT * FROM olist.order_payments WHERE payment_sequential IS NULL;
-- SELECT * FROM olist.order_payments WHERE payment_type IS NULL;
-- SELECT * FROM olist.order_payments WHERE payment_installments IS NULL;
-- SELECT * FROM olist.order_payments WHERE payment_value IS NULL;



-- 5. Checking order reviews table
-- SELECT * FROM olist.order_reviews;

-- SELECT * FROM olist.order_reviews WHERE review_id IS NULL;
-- SELECT * FROM olist.order_reviews WHERE order_id IS NULL;
-- SELECT * FROM olist.order_reviews WHERE review_score IS NULL;

    -- SELECT * FROM olist.order_reviews WHERE review_comment_title IS NULL;
    --> This column has null values

    -- SELECT * FROM olist.order_reviews WHERE review_comment_message IS NULL;
    --> This column has null values

-- SELECT * FROM olist.order_reviews WHERE review_creation_date IS NULL;
-- SELECT * FROM olist.order_reviews WHERE review_answer_timestamp IS NULL;



-- 6. Checking products table
-- SELECT * FROM olist.products;

-- SELECT * FROM olist.products WHERE product_id IS NULL;

    -- SELECT * FROM olist.products WHERE product_category_name IS NULL;
    --> This column has null values

    -- SELECT * FROM olist.products WHERE product_name_length IS NULL;
    --> This column has null values

    -- SELECT * FROM olist.products WHERE product_description_length IS NULL;
    --> This column has null values

    -- SELECT * FROM olist.products WHERE product_photos_qty IS NULL;
    --> This column has null values

    -- SELECT * FROM olist.products WHERE product_weight_g IS NULL;
    --> This column has null values

    -- SELECT * FROM olist.products WHERE product_length_cm IS NULL;
    --> This column has null values

    -- SELECT * FROM olist.products WHERE product_height_cm IS NULL;
    --> This column has null values

    -- SELECT * FROM olist.products WHERE product_width_cm IS NULL;
    --> This column has null values



-- 7. Checking product category name translation table
-- SELECT * FROM olist.product_category_name_translation;

-- SELECT * FROM olist.product_category_name_translation WHERE product_category_name IS NULL;
-- SELECT * FROM olist.product_category_name_translation WHERE product_category_name_english IS NULL;



-- 8. Checking sellers table
-- SELECT * FROM olist.sellers;

-- SELECT * FROM olist.sellers WHERE seller_id IS NULL;
-- SELECT * FROM olist.sellers WHERE seller_zip_code_prefix IS NULL;
-- SELECT * FROM olist.sellers WHERE seller_city IS NULL;
-- SELECT * FROM olist.sellers WHERE seller_state IS NULL;



-- 9. Checking geolocation table
-- SELECT * FROM olist.geolocation;

-- SELECT * FROM olist.geolocation WHERE geolocation_zip_code_prefix IS NULL;
-- SELECT * FROM olist.geolocation WHERE geolocation_lat IS NULL;
-- SELECT * FROM olist.geolocation WHERE geolocation_lng IS NULL;
-- SELECT * FROM olist.geolocation WHERE geolocation_city IS NULL;
-- SELECT * FROM olist.geolocation WHERE geolocation_state IS NULL;



-- So let's look at those columns with null values

-- SELECT * FROM olist.orders WHERE order_approved_at IS NULL;
-- SELECT * FROM olist.orders WHERE order_delivered_carrier_date IS NULL;
-- SELECT * FROM olist.orders WHERE order_delivered_customer_date IS NULL;
-- SELECT * FROM olist.order_reviews WHERE review_comment_title IS NULL;
-- SELECT * FROM olist.order_reviews WHERE review_comment_message IS NULL;
-- SELECT * FROM olist.products WHERE product_category_name IS NULL;
-- SELECT * FROM olist.products WHERE product_name_length IS NULL;
-- SELECT * FROM olist.products WHERE product_description_length IS NULL;
-- SELECT * FROM olist.products WHERE product_photos_qty IS NULL;
-- SELECT * FROM olist.products WHERE product_weight_g IS NULL;
-- SELECT * FROM olist.products WHERE product_length_cm IS NULL;
-- SELECT * FROM olist.products WHERE product_height_cm IS NULL;
-- SELECT * FROM olist.products WHERE product_width_cm IS NULL;


-- It is better to remove irrelevant columns to my project before I deal with columns with null values

-- Dropping irrelevant columns

/*
ALTER TABLE olist.order_payments
DROP COLUMN IF EXISTS payment_sequential;
*/

/*
ALTER TABLE olist.order_reviews
DROP COLUMN IF EXISTS review_creation_date,
DROP COLUMN IF EXISTS review_answer_timestamp,
DROP COLUMN IF EXISTS review_comment_title, 
DROP COLUMN IF EXISTS review_comment_message;
*/

/*
ALTER TABLE olist.products
DROP COLUMN IF EXISTS product_name_length,
DROP COLUMN IF EXISTS product_description_length,
DROP COLUMN IF EXISTS product_photos_qty;
*/

-- So the columns that have remained with null values include:

-- NULL order_approved_at means the order was never fully approved, which is important to distinguish incomplete orders from those that moved into the shipping process.
-- SELECT * FROM olist.orders WHERE order_approved_at IS NULL;

-- NULL order_delivered_carrier_date means the order was never handed to the carrier, helping you separate pre-shipping issues from shipping/logistics delays.
-- SELECT * FROM olist.orders WHERE order_delivered_carrier_date IS NULL;

-- NULL order_delivered_customer_date means the customer never received the order, which is critical for measuring undelivered or severely delayed orders.
-- SELECT * FROM olist.orders WHERE order_delivered_customer_date IS NULL;

-- NULL product_category_name means the product’s category is unknown, and you’ll keep these rows but treat them as an 'unknown_category' group in category-level analysis.
-- SELECT * FROM olist.products WHERE product_category_name IS NULL;

-- NULL product_weight_g means the product’s weight is missing, which matters for freight and delivery-time analysis, so these rows should be flagged or filtered in logistics models.
-- SELECT * FROM olist.products WHERE product_weight_g IS NULL;

-- NULL product_length_cm means the package length is missing, so you keep these rows but must handle them carefully when using package dimensions to explain delays.
-- SELECT * FROM olist.products WHERE product_length_cm IS NULL;

-- NULL product_height_cm means the package height is missing, again important to flag because size can influence handling and delivery efficiency.
-- SELECT * FROM olist.products WHERE product_height_cm IS NULL;

-- NULL product_width_cm means the package width is missing, which you must account for whenever you analyze how package dimensions affect delivery performance.
-- SELECT * FROM olist.products WHERE product_width_cm IS NULL;


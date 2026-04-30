-- select * from RETAIL_SALES;

-- ==================== ROW_NUMBER() ========================================

--1. Assign a unique row number to each order based on order_date (oldest to latest).

-- select order_id,customer_id,customer_name,ORDER_DATE,
-- row_number() over(order by order_date asc) as rn from RETAIL_SALES;


--2. Find the latest order for each customer using ROW_NUMBER.

-- select * from(select order_id,customer_name,order_date,
-- row_number() over(partition by customer_id order by order_date DESC) as rn from RETAIL_SALES ) where rn=1;

-- 3. Retrieve the top 2 highest priced products in each category using ROW_NUMBER.

-- select * from(select product_id,product_name,category,price,
-- row_number() over(partition by category order by price DESC) as rn from RETAIL_SALES) where rn<=2;


--============================================ Rank() =============================================================================

-- 1. Rank all orders based on price in descending order.

-- select order_id,price,
-- rank() over(order by price DESC) as rk from RETAIL_SALES;

-- 2. Find the 2nd highest priced product in each category using RANK.

-- select * from(select product_id,product_name,category,price,
-- rank() over(PARTITION by category order by price DESC) as rk from RETAIL_SALES) where rk <=2;

-- ================================= DENSE_RANK() ==================================================================================

-- 1. Assign dense rank to products based on price within each category.

-- select product_id,product_name,category,
-- dense_rank() over(PARTITION by category order by price DESC) as rk from RETAIL_SALES;

-- 2. Get the top 3 unique price levels across all products using DENSE_RANK.

-- select * from (select product_id, product_name,price,
-- DENSE_RANK() over(order by price desc) as rk from RETAIL_SALES
-- ) where rk<=3

-- ================================== LAG & LEAD ===========================================================================================

-- 1. Display the next order price for each customer based on order_date using LEAD.

-- select order_id,customer_id,customer_name,order_date,
-- lead(ORDER_DATE) over(partition by customer_id order by order_date) as ld from RETAIL_SALES;

-- 2. Show the next order date for each customer using LEAD.

-- select order_id,customer_id,customer_name,order_date,
-- lead(order_date) over(PARTITION by customer_id order by ORDER_DATE) as ld from RETAIL_SALES;

-- 3. Display the previous order price for each customer based on order_date using LAG

-- select order_id,customer_id,customer_name,price,
-- lag(order_date) OVER(order by ORDER_DATE) as lg from RETAIL_SALES;
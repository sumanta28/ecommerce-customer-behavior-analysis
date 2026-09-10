-- ============================================================
-- E-commerce Customer Analysis (PostgreSQL)
-- ============================================================


-- ============================================================
-- Create the customers table
-- ============================================================

CREATE TABLE customers (
    customer_id TEXT,
    customer_name TEXT,
    age INTEGER,
    gender TEXT,
    state TEXT,
    city TEXT,
    signup_date DATE,
    last_order_date DATE,
    product_category TEXT,
    orders_count INTEGER,
    total_spend_inr NUMERIC(12,2),
    average_order_value_inr NUMERIC(12,2),
    discount_amount_inr NUMERIC(12,2),
    discount_used TEXT,
    return_count INTEGER,
    return_rate NUMERIC(8,4),
    sessions_count INTEGER,
    product_views INTEGER,
    cart_adds INTEGER,
    checkout_starts INTEGER,
    conversion_rate NUMERIC(8,4),
    payment_method TEXT,
    device_type TEXT,
    acquisition_channel TEXT,
    membership_tier TEXT,
    delivery_type TEXT,
    support_contacts INTEGER,
    average_rating NUMERIC(3,1),
    loyalty_segment TEXT,
    churned TEXT,
    age_group TEXT,
    view_group TEXT
);


-- ============================================================
-- Verify the imported data
-- ============================================================

SELECT *
FROM customers
LIMIT 5;

SELECT COUNT(*) AS total_customers
FROM customers;


-- ============================================================
-- Q1. Product Category Performance
-- Calculate total revenue and total orders for each
-- product category.
-- ============================================================

SELECT
    product_category,
    SUM(total_spend_inr) AS total_revenue,
    SUM(orders_count) AS total_orders
FROM customers
GROUP BY product_category
ORDER BY total_revenue DESC;


-- ============================================================
-- Q2. Loyalty Segment Spending
-- Calculate customer count, total spending and average
-- customer spending for each loyalty segment.
-- ============================================================

SELECT
    loyalty_segment,
    COUNT(*) AS customer_count,
    SUM(total_spend_inr) AS total_spending,
    AVG(total_spend_inr) AS avg_customer_spending
FROM customers
GROUP BY loyalty_segment
ORDER BY avg_customer_spending DESC;


-- ============================================================
-- Q3. Payment Method Performance
-- Calculate customer count and total revenue for each
-- payment method.
-- ============================================================

SELECT
    payment_method,
    COUNT(*) AS customer_count,
    SUM(total_spend_inr) AS total_revenue
FROM customers
GROUP BY payment_method
ORDER BY customer_count DESC;


-- ============================================================
-- Q4. State-Level Revenue
-- Calculate customer count, total orders and total revenue
-- for each state.
-- ============================================================

SELECT
    state,
    COUNT(*) AS customer_count,
    SUM(orders_count) AS total_orders,
    SUM(total_spend_inr) AS total_revenue
FROM customers
GROUP BY state
ORDER BY total_revenue DESC;


-- ============================================================
-- Q5. Identify High-Value Customers
-- Find customers who:
-- total_spend_inr > ₹10,000
-- orders_count >= 5
-- ============================================================

SELECT
    customer_id,
    customer_name,
    total_spend_inr,
    orders_count
FROM customers
WHERE total_spend_inr > 10000
  AND orders_count >= 5;


-- ============================================================
-- Q6. High Purchase Frequency but Low Spending
-- Find customers who:
-- orders_count >= 5
-- total_spend_inr < ₹8,000
-- ============================================================

SELECT
    customer_id,
    customer_name,
    orders_count,
    total_spend_inr
FROM customers
WHERE orders_count >= 5
  AND total_spend_inr < 8000;


-- ============================================================
-- Q7. Customers With No Returns
-- Identify customers who have made at least 3 orders
-- and have never returned an order.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    return_count,
    orders_count
FROM customers
WHERE return_count = 0
  AND orders_count >= 3;


-- ============================================================
-- Q8. High-Engagement Customers With Low Conversion
-- Identify customers with:
-- product_views >= 100
-- conversion_rate < 5%
-- ============================================================

SELECT
    customer_id,
    customer_name,
    conversion_rate,
    product_views
FROM customers
WHERE product_views >= 100
  AND conversion_rate < 0.05;


-- ============================================================
-- Q9. Product Categories Meeting Two Conditions
-- Identify categories with:
-- total orders > 3,000
-- average customer spending < ₹8,000
-- ============================================================

SELECT
    product_category,
    SUM(orders_count) AS total_orders,
    AVG(total_spend_inr) AS avg_spending
FROM customers
GROUP BY product_category
HAVING SUM(orders_count) > 3000
   AND AVG(total_spend_inr) < 8000;


-- ============================================================
-- Q10. Discount Usage by Product Category
-- Calculate:
-- total customers
-- discount users
-- discount usage percentage
-- for each product category.
-- ============================================================

SELECT
    product_category,
    COUNT(*) AS total_customers,
    COUNT(
        CASE
            WHEN discount_used = 'Yes' THEN 1
        END
    ) AS discount_users,
    COUNT(
        CASE
            WHEN discount_used = 'Yes' THEN 1
        END
    ) * 100.0 / COUNT(*) AS discount_usage_percentage
FROM customers
GROUP BY product_category;


-- ============================================================
-- Q11. Customer Spending by Age Group
-- Calculate:
-- number of customers
-- total revenue
-- average customer spending
-- Sort by total revenue descending.
-- ============================================================

SELECT
    age_group,
    SUM(total_spend_inr) AS total_revenue,
    COUNT(customer_name) AS customer_count,
    SUM(total_spend_inr) / COUNT(customer_name) AS avg_spending
FROM customers
GROUP BY age_group
ORDER BY total_revenue DESC;


-- ============================================================
-- Q12. Return Rate by Product Category
-- Calculate total orders, total returns and return rate
-- for each product category.
-- ============================================================

SELECT
    product_category,
    SUM(orders_count) AS total_orders,
    SUM(return_count) AS total_returns,
    SUM(return_count) * 100.0 / SUM(orders_count) AS return_rate
FROM customers
GROUP BY product_category
ORDER BY return_rate DESC;


-- ============================================================
-- Q13. Spending Analysis by Discount Usage
-- Compare customers who used discounts with those who
-- did not use discounts.
-- ============================================================

SELECT
    discount_used,
    COUNT(customer_id) AS total_customers,
    SUM(total_spend_inr) AS total_revenue,
    SUM(total_spend_inr) / COUNT(customer_id) AS avg_customer_spending
FROM customers
GROUP BY discount_used
ORDER BY avg_customer_spending DESC;


-- ============================================================
-- Q14. Acquisition Channel Efficiency
-- Calculate customer count, total orders, total revenue
-- and average orders per customer for each acquisition
-- channel.
-- ============================================================

SELECT
    acquisition_channel,
    COUNT(customer_id) AS total_customers,
    SUM(orders_count) AS total_orders,
    SUM(total_spend_inr) AS total_revenue,
    SUM(orders_count)::numeric / COUNT(customer_id) AS avg_orders
FROM customers
GROUP BY acquisition_channel
ORDER BY avg_orders DESC;


-- ============================================================
-- Q15. Customer Activity and Order Performance by Device
-- Calculate customer count, total orders, average orders
-- and average spending for each device type.
-- ============================================================

SELECT
    device_type,
    COUNT(customer_id) AS total_customers,
    SUM(orders_count) AS total_orders,
    SUM(orders_count)::numeric / COUNT(customer_id) AS avg_orders,
    SUM(total_spend_inr) / COUNT(customer_id) AS avg_spending
FROM customers
GROUP BY device_type
ORDER BY avg_spending DESC;


-- ============================================================
-- Q16. Customer Order Activity and Spending by Membership Tier
-- Calculate customer count, total orders, average orders
-- and average spending for each membership tier.
-- ============================================================

SELECT
    membership_tier,
    COUNT(customer_id) AS total_customers,
    SUM(orders_count) AS total_orders,
    SUM(orders_count)::numeric / COUNT(customer_id) AS avg_orders,
    SUM(total_spend_inr) / COUNT(customer_id) AS avg_spending
FROM customers
GROUP BY membership_tier
ORDER BY avg_orders DESC;


-- ============================================================
-- Q17. Customer Value Segmentation
-- Classify customers as:
-- High Value   : ₹15,000+
-- Medium Value : ₹8,000–₹14,999
-- Low Value    : below ₹8,000
-- Then calculate customer count and total revenue.
-- ============================================================

SELECT
    customer_value,
    COUNT(customer_id) AS total_customers,
    SUM(total_spend_inr) AS total_revenue
FROM
(
    SELECT
        total_spend_inr,
        customer_id,
        CASE
            WHEN total_spend_inr >= 15000 THEN 'High Value'
            WHEN total_spend_inr BETWEEN 8000 AND 14999 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS customer_value
    FROM customers
) AS classified_customers
GROUP BY customer_value
ORDER BY total_revenue DESC;


-- ============================================================
-- Q18. Identify Customers Spending Above the Overall Average
-- ============================================================

SELECT
    customer_name,
    customer_id,
    total_spend_inr
FROM customers
WHERE total_spend_inr >
(
    SELECT
        SUM(total_spend_inr) / COUNT(customer_id)
    FROM customers
)
ORDER BY total_spend_inr DESC;


-- ============================================================
-- Q19. Top 3 Customers by Spending Within Each State
-- Use ROW_NUMBER() to assign a unique position to each
-- customer within their state.
-- ============================================================

SELECT
    row_num,
    customer_id,
    customer_name,
    state,
    total_spend_inr
FROM
(
    SELECT
        customer_id,
        customer_name,
        state,
        total_spend_inr,
        ROW_NUMBER() OVER (
            PARTITION BY state
            ORDER BY total_spend_inr DESC
        ) AS row_num
    FROM customers
) AS customer_info
WHERE row_num <= 3
ORDER BY state, total_spend_inr DESC;


-- ============================================================
-- Q20. Compare Individual Customer Spending With State Average
-- Calculate the difference between each customer's spending
-- and the average spending of customers in their state.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    state,
    avg_spending,
    total_spend_inr - avg_spending AS diff_spending
FROM
(
    SELECT
        state,
        customer_id,
        customer_name,
        total_spend_inr,
        AVG(total_spend_inr) OVER (
            PARTITION BY state
        ) AS avg_spending
    FROM customers
) AS customer_info;


-- ============================================================
-- Q21. Compare Customer Order Activity With the Previous Customer
-- Order customers by signup date and compare each customer's
-- orders with the previous customer's orders.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    total_orders,
    previous_orders_count,
    total_orders - previous_orders_count AS orders_difference
FROM
(
    SELECT
        customer_name,
        customer_id,
        signup_date,
        orders_count AS total_orders,
        LAG(orders_count) OVER (
            ORDER BY signup_date
        ) AS previous_orders_count
    FROM customers
) AS customer_info
ORDER BY signup_date;


-- ============================================================
-- Q22. Rank Customers Within Each State
-- Identify the top 3 spending ranks within each state.
-- RANK() allows customers with equal spending to receive
-- the same rank.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    state,
    total_spend_inr,
    spending_rank
FROM
(
    SELECT
        customer_id,
        customer_name,
        state,
        total_spend_inr,
        RANK() OVER (
            PARTITION BY state
            ORDER BY total_spend_inr DESC
        ) AS spending_rank
    FROM customers
) AS customer_info
WHERE spending_rank <= 3
ORDER BY state, spending_rank;


-- ============================================================
-- Q23. Churn Rate by Membership Tier
-- For each membership tier, calculate:
-- total customers
-- churned customers
-- churn rate
-- ============================================================

SELECT
    membership_tier,
    COUNT(*) AS total_customers,
    COUNT(
        CASE
            WHEN churned = 'Yes' THEN 1
        END
    ) AS churned_customers,
    COUNT(
        CASE
            WHEN churned = 'Yes' THEN 1
        END
    ) * 100.0 / COUNT(*) AS churn_rate
FROM customers
GROUP BY membership_tier
ORDER BY churn_rate DESC;


-- ============================================================
-- Q24. Churned Customers With High Engagement
-- Identify customers who have churned despite having
-- at least 100 product views.
-- ============================================================

SELECT
    customer_id,
    customer_name,
    product_views,
    total_spend_inr
FROM customers
WHERE churned = 'Yes'
  AND product_views >= 100
ORDER BY product_views DESC;






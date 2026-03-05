 -- Top 10 Customers by Revenue
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 10;
-- Product Sales Performance
SELECT p.product_id, p.name, SUM(oi.quantity) AS total_sold,
       SUM(oi.quantity * oi.price) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY p.product_id, p.name
ORDER BY total_revenue DESC;
-- Monthly Revenue Trend
SELECT date_format(order_date,"%y -%m-01") AS month,
       SUM(total_amount) AS monthly_revenue
FROM orders
WHERE status = 'Delivered'
GROUP BY month
ORDER BY month;
 -- Churn-Risk Customers (No Purchase in 3 Months)
SELECT c.customer_id, c.name, MAX(o.order_date) AS last_purchase
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING MAX(o.order_date) < DATE_SUB(CURDATE(), INTERVAL 3 MONTH);
 -- Dead Stock Products
SELECT p.product_id, p.name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN orders o ON oi.order_id = o.order_id 
                   AND o.order_date >= DATE_SUB(CURDATE(), INTERVAL 60 DAY)
WHERE o.order_id IS NULL;
-- Repeat Purchase Trend Using Window Function
SELECT customer_id, order_date,
       COUNT(order_id) OVER (PARTITION BY customer_id ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_orders
FROM orders
WHERE status = 'Delivered';
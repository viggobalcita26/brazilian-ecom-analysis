
WITH revenue AS (
    SELECT 
    order_id,
    SUM(price) AS total_revenue
    FROM order_items
    GROUP BY order_id
)

SELECT 
    YEAR(o.order_purchase_timestamp) AS year,
    MONTH(o.order_purchase_timestamp) AS month, 
    COUNT(o.order_id) AS total_orders,
    CAST(SUM(r.total_revenue) AS DECIMAL (18,2)) AS total_revenue,
    COUNT(DISTINCT c.customer_unique_id) AS unique_customer_count
FROM orders AS o
JOIN revenue AS r
    ON o.order_id = r.order_id
JOIN customers AS c
    ON o.customer_id = c.customer_id
WHERE o.order_status NOT IN ('canceled', 'unavailable')
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY year ASC, month ASC;



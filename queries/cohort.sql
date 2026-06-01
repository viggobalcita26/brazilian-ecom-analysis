WITH birth_month AS (
    SELECT
    c.customer_unique_id,
    MIN(o.order_purchase_timestamp) AS birth_date
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    WHERE o.order_status NOT IN ('canceled', 'unavailable')
    GROUP BY c.customer_unique_id
)

SELECT
    o.order_id,
    b.customer_unique_id, 
    FORMAT(CAST(o.order_purchase_timestamp AS DATETIME), 'yyyy-MM') AS order_purchase_timestamp, 
    FORMAT(CAST(b.birth_date AS DATETIME), 'yyyy-MM') AS birth_date
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN birth_month b
    ON c.customer_unique_id = b.customer_unique_id
WHERE o.order_status NOT IN ('canceled', 'unavailable')
ORDER BY c.customer_unique_id, o.order_purchase_timestamp;
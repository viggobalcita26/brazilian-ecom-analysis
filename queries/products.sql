
SELECT
    o1.product_id AS product_a,
    o2.product_id AS product_b,
    COUNT(*) AS times_bought_together
FROM order_items o1
JOIN order_items o2
    ON o1.order_id = o2.order_id
    AND o1.product_id < o2.product_id
GROUP BY o1.product_id, o2.product_id
ORDER BY times_bought_together DESC;
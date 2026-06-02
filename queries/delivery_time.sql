
SELECT
    r.order_id,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    r.review_score,
    c.customer_state
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id
JOIN order_reviews r 
    ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL;
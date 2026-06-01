USE OlistEcom;

SELECT
    o1.order_id,
    o2.product_id,
    o1.order_item_id
FROM order_items o1
JOIN order_items o2
    ON o1.order_id = o2.order_id
WHERE o1.product_id != o2.product_id;
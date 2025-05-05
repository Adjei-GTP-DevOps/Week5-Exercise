SELECT 
    c.country,
    AVG(order_total) AS avg_order_value
FROM (
    SELECT 
        o.order_id, 
        c.customer_id, 
        c.country,
        SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.order_id
) AS order_values
GROUP BY country;

-- A query that displays the number of orders that involved 2 or more products

-- The column should be called count_of_multiple_orders

WITH mul_orders AS (
    SELECT order_id, COUNT(*)
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(*) > 1)

SELECT count(*) as count_of_multiple_orders
FROM mul_orders;
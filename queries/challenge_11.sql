-- A query that displays the percentage of orders that had *any* discount applied.

-- The only column should be 'percentage_discounted'

-- The percentage should be rounded to 2 d.p.
WITH orders_with_discount AS (
    SELECT DISTINCT order_id
    FROM order_details
    WHERE discount > 0
)

SELECT ROUND(
    (CAST((SELECT COUNT(*) FROM orders_with_discount) AS NUMERIC) / 
     CAST((SELECT COUNT(DISTINCT order_id) FROM order_details) AS NUMERIC)) * 100, 
    2
) AS percentage_discounted;

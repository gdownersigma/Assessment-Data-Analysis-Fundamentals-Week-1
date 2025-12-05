-- A query that displays the first ten orders where the total price is more than the price of the most expensive product in the database.

-- The columns should be order_id and total_price only.

-- total_price should be displayed as an integer.

-- Results should be ordered by descending order_id

-- When calculating the order price, ignore any discounts and use the warehouse-standard price for the products only

WITH expensive_prod AS(
    SELECT unit_price
    FROM products
    ORDER BY unit_price DESC
    LIMIT 1
),
total_order AS (
    SELECT order_id, sum(unit_price*quantity) as order_price
    FROM order_details
    GROUP BY order_id)

SELECT order_id,
        CAST(ROUND(order_price) AS INT) as total_price
FROM total_order
WHERE (order_price) > (SELECT unit_price FROM expensive_prod)
ORDER BY order_id DESC
LIMIT 10;

        
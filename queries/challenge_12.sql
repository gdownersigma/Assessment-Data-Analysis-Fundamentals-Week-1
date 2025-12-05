-- A query that returns details on the difference in price between individual orders (including discount) and the standard warehouse price

-- Products have a standard price, but an additional percentage discount may be applied to the product total

-- The columns should be order_id, expected_price, actual_price, and price_difference

-- Only the top five rows (in descending order of price_difference) should be displayed

-- All values should be rounded to 2 d.p. for display (but otherwise kept at full precision)

WITH individual_item AS 
    (SELECT od.order_id,
            ROUND(CAST(p.unit_price * od.quantity AS NUMERIC), 2) as exp_price,
            ROUND(CAST(od.unit_price * od.quantity * (1-od.discount) AS NUMERIC), 2) as act_price
    FROM order_details od
    JOIN products p ON od.product_id = p.product_id)
SELECT order_id,
       SUM(exp_price) as expected_price,
       SUM(act_price) as actual_price,
       (SUM(exp_price) - SUM(act_price)) as price_difference
FROM individual_item
GROUP BY order_id
ORDER BY price_difference DESC
LIMIT 5;
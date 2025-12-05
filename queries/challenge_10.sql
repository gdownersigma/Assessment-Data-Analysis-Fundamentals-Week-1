-- A query that displays the name of the third most expensive product(s) for each category.

-- The columns should be category_name, product_name.

-- Results should be sorted alphabetically by category.

WITH ranked AS (
    SELECT 
    category_name,
    product_name,
    unit_price,
    RANK() OVER (PARTITION BY category_id ORDER BY unit_price DESC) as price_rank
FROM products
JOIN categories USING(category_id))

SELECT category_name, product_name
FROM ranked
WHERE price_rank = 3
ORDER BY category_name;


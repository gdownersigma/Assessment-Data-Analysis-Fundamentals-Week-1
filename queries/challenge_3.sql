-- A query that displays category_name and product_name only for each product where the product name begins with "S".

-- Results should be ordered alphabetically by category_name and product_name

SELECT category_name, product_name
FROM products
JOIN categories USING(category_id)
WHERE product_name LIKE 'S%'
ORDER BY category_name, product_name;
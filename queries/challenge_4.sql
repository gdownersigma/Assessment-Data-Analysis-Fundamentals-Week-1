-- A query that displays the category_name and total count of products (num_products) for each category.

-- Results should be sorted  in descending order by count, with any ties sorted by descending order of category name.

SELECT category_name,
        COUNT(product_id) as num_products
FROM products
JOIN categories USING (category_id)
GROUP BY category_name
ORDER BY num_products DESC, category_name DESC;

-- A query that displays the average product price (average_price) for each category from each supplier when the category name contains the letter 'm' (case-insensitive).

-- The columns should be supplier, category, average_price.

-- average_price should be an integer.

-- Results should be sorted alphabetically by supplier and category.

WITH pcs AS(
    SELECT unit_price,
            category_name AS category, 
            company_name AS supplier
    FROM products
    JOIN suppliers USING(supplier_id)
    JOIN categories USING(category_id)
    )

SELECT supplier,
        category,
        CAST(ROUND(AVG(unit_price)) AS INT) as average_price
FROM pcs
GROUP BY supplier,category
HAVING lower(category) LIKE '%m%'
ORDER BY supplier,category;

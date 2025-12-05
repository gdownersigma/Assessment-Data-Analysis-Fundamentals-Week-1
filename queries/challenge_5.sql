-- A query that displays the five most expensive products supplied by suppliers based in London or Tokyo.

-- The columns should be product_name and unit_price only.

-- Results should be sorted in descending order of price

SELECT product_name, unit_price
FROM products
JOIN suppliers USING(supplier_id)
WHERE city = 'London' OR city = 'Tokyo'
ORDER BY unit_price DESC
LIMIT 5;
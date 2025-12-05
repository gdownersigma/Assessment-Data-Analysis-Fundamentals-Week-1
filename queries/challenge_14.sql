-- A query that creates or replaces a VIEW, customer_summary, containing an overview of all customers with more than 15 orders

-- The view should have columns company, city, and total_orders only

-- Rows should be sorted in ascending order by the date of the customer's earliest order

CREATE OR REPLACE VIEW customer_summary AS(
    SELECT company_name as company,
            city,
            COUNT(order_id) as total_orders
    FROM customers
    JOIN orders USING (customer_id)
    GROUP BY company_name,city
    HAVING COUNT(order_id) > 15
    ORDER BY MIN(order_date)
)
-- Task 2
use art_studio_data;
-- Window Function:- Rank Customers by Total Spend
SELECT 
    c.name,
    c.art_style,
    SUM(o.quantity * o.price_per_unit) AS total_spent,
    RANK() OVER (ORDER BY SUM(o.quantity * o.price_per_unit) DESC) AS spend_rank
FROM customers c
JOIN art_orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.art_style;

-- Subquery: Customers Who Spent More Than ₹1000
SELECT name, city
FROM customers
WHERE customer_id IN (
SELECT customer_id
FROM art_orders
GROUP BY customer_id
HAVING SUM(quantity * price_per_unit) > 1000);

-- CTE: Top 3 Spending Customers
WITH customer_spending AS (
    SELECT 
        c.customer_id,
        c.name,
        c.art_style,
        SUM(o.quantity * o.price_per_unit) AS total_spent
    FROM customers c
    JOIN art_orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.name, c.art_style
)
SELECT * FROM customer_spending
ORDER BY total_spent DESC
LIMIT 3;
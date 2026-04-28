-- 1. Comprehensive Inventory Report
SELECT 
    p.product_name, 
    c.category_name, 
    s.company_name AS supplier, 
    p.stock_quantity, 
    p.price
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON p.supplier_id = s.supplier_id;

-- 2. Low Stock Alert (Less than 15 units)
SELECT product_name, stock_quantity 
FROM products 
WHERE stock_quantity < 15;

-- 3. Total Inventory Value per Category
SELECT 
    c.category_name, 
    SUM(p.stock_quantity * p.price) AS total_value
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- 4. Recent Stock Movements
SELECT TOP 10 
    t.transaction_date, 
    p.product_name, 
    t.transaction_type, 
    t.quantity
FROM stock_transactions t
JOIN products p ON t.product_id = p.product_id
ORDER BY t.transaction_date DESC;
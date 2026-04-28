-- 1. Insert Categories
INSERT INTO categories (category_name) VALUES 
('Electronics'), 
('Office Supplies'), 
('Furniture'),
('Peripherals');

-- 2. Insert Suppliers
INSERT INTO suppliers (company_name, contact_info) VALUES 
('TechGiant Solutions', 'sales@techgiant.com'),
('Global Logistics Co.', 'logistics@global.pl'), -- Polonya hedefi için .pl uzantısı ekledim ;)
('Premium Office Furniture', 'contact@premiumoffice.com');

-- 3. Insert Products
-- Note: category_id and supplier_id must match the IDs in the tables above.
INSERT INTO products (product_name, stock_quantity, price, category_id, supplier_id) VALUES 
('Monitor 27 inch', 15, 300.00, 1, 1),
       ('Wireless Mouse', 100, 25.50, 4, 1),
       ('Ergonomic Chair', 8, 450.00, 3, 3),
       ('HDMI Cable 2m', 250, 12.99, 4, 2),
       ('Office Desk', 5, 600.00, 3, 3);
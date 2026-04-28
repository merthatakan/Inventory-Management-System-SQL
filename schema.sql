-- 1. Categories Table
CREATE TABLE categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- 2. Suppliers Table
CREATE TABLE suppliers (
    supplier_id INT IDENTITY(1,1) PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(50)
);

-- 3. Products Table
CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    stock_quantity INT DEFAULT 0,
    price DECIMAL(10, 2),
    category_id INT,
    supplier_id INT,
    CONSTRAINT FK_Category FOREIGN KEY (category_id) REFERENCES categories(category_id),
    CONSTRAINT FK_Supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- 4. Stock Transactions Table
CREATE TABLE stock_transactions (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT,
    transaction_type VARCHAR(10) CHECK (transaction_type IN ('IN', 'OUT')),
    quantity INT NOT NULL,
    transaction_date DATETIME DEFAULT GETDATE(), 
    notes VARCHAR(200),
    
    CONSTRAINT FK_Transaction_Product FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Let's say we received 20 more Monitors
INSERT INTO stock_transactions (product_id, transaction_type, quantity, notes)
VALUES (1, 'IN', 20, 'New shipment arrived from TechGiant');

-- Let's say we sold 3 Wireless Mouses
INSERT INTO stock_transactions (product_id, transaction_type, quantity, notes)
VALUES (2, 'OUT', 3, 'Online order #552');

-- For better performance, we can create indexes on frequently queried columns
CREATE INDEX idx_product_name ON products(product_name);
CREATE INDEX idx_category_id ON products(category_id);

ALTER TABLE products ADD is_active BIT DEFAULT 1; 


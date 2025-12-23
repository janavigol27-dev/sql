-- Create database
create database projectsdb;

-- Use database
use projectsdb;

-- Create Customer table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(200)
);

-- Insert customer records
INSERT INTO Customer (customer_id, name, email, address)
VALUES
(1, 'Alice', 'alice@gmail.com', 'Mumbai, Maharashtra'),
(2, 'Priya', 'priya.patel@gmail.com', 'Ahmedabad, Gujarat'),
(3, 'Alice', 'alice12@gmail.com', 'Pune, Maharashtra'),
(4, 'Neha', 'neha.singh@gmail.com', 'Lucknow, Uttar Pradesh'),
(5, 'Suresh Kumar', 'suresh.kumar@gmail.com', 'Chennai, Tamil Nadu');

-- Display all customers
SELECT * FROM Customer;

-- Update address of customer id 2
UPDATE Customer 
SET address = 'Surat, Gujarat' 
WHERE customer_id = 2;

-- Delete customer with id 5
DELETE FROM Customer WHERE customer_id = 5;

-- Display customers named Alice
SELECT * FROM Customer WHERE name = 'Alice';



-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Insert order records
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
(101, 1, '2025-01-10', 2500.00),
(102, 2, '2025-12-12', 1800.50),
(103, 1, '2025-01-15', 3200.00),
(104, 3, '2025-12-18', 1500.00),
(105, 4, '2025-01-20', 2100.75);

-- Display all orders
SELECT * FROM Orders;

-- Orders of customer id 1
SELECT * FROM Orders WHERE customer_id = 1;

-- Update total amount of order 103
UPDATE Orders
SET total_amount = 3200.00
WHERE order_id = 103;

-- Delete order with id 104
DELETE FROM Orders WHERE order_id = 104;

-- Orders placed in last 30 days
SELECT * FROM Orders
WHERE order_date >= CURRENT_DATE - INTERVAL 30 DAY;

-- Highest, lowest and average order amount
SELECT 
    MAX(total_amount) AS highest_order_amount,
    MIN(total_amount) AS lowest_order_amount,
    AVG(total_amount) AS average_order_amount
FROM Orders;



-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

-- Insert product records
INSERT INTO Products (product_id, product_name, price, stock)
VALUES
(1, 'Laptop', 55000.00, 10),
(2, 'Mobile Phone', 25000.00, 20),
(3, 'Headphones', 3500.00, 0),
(4, 'Keyboard', 1500.00, 30),
(5, 'Mouse', 800.00, 40);

-- Display all products
SELECT * FROM Products;

-- Display products sorted by price (high to low)
SELECT * FROM Products ORDER BY price DESC;

-- Update price of product id 3
UPDATE Products
SET price = 3000.00
WHERE product_id = 3;

-- Delete products that are out of stock
DELETE FROM Products WHERE stock = 0;

-- Products with price between 500 and 2000
SELECT * FROM Products
WHERE price BETWEEN 500 AND 2000;

-- Most expensive and cheapest product
SELECT 
    MAX(price) AS most_expensive,
    MIN(price) AS cheapest
FROM Products;


-- Create OrderDetails table
CREATE TABLE OrderDetails (
    orderdetail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    sub_total DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert order details
INSERT INTO OrderDetails (orderdetail_id, order_id, product_id, quantity, sub_total)
VALUES
(1, 101, 1, 1, 55000.00),
(2, 101, 3, 2, 6000.00),
(3, 102, 2, 1, 25000.00),
(4, 103, 4, 3, 4500.00),
(5, 105, 5, 5, 4000.00);

-- Display all OrderDetails
SELECT * FROM OrderDetails;

-- Order details of order id 101
SELECT * FROM OrderDetails
WHERE order_id = 101;

-- Total revenue from all orders
SELECT SUM(sub_total) AS total_revenue
FROM OrderDetails;

-- Top 3 most ordered products
SELECT product_id, SUM(quantity) AS total_quantity
FROM OrderDetails
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 3;

-- Count how many times product id 3 is sold
SELECT COUNT(*) AS times_sold
FROM OrderDetails
WHERE product_id = 3;


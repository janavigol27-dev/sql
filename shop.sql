CREATE DATABASE SHOPDB;
USE SHOPDB;

CREATE TABLE PRODUCT (
    PRODUCT_ID INT PRIMARY KEY,
    NAME VARCHAR(100),
    CATEGORY VARCHAR(50),
    PRICE DECIMAL(10,2),
    STOCK INT,
    ADD_DATE DATE
);

INSERT INTO PRODUCT VALUES
(1,'Laptop','Electronics',55000,10,'2023-01-05'),
(2,'Mobile','Electronics',25000,20,'2023-02-10'),
(3,'Keyboard','Accessories',800,50,'2023-03-12'),
(4,'Mouse','Accessories',500,60,'2023-03-15'),
(5,'Printer','Electronics',12000,8,'2023-04-01'),
(6,'Headphones','Accessories',1500,30,'2023-04-18'),
(7,'Monitor','Electronics',9000,12,'2023-05-05'),
(8,'USB Drive','Accessories',700,100,'2023-05-20'),
(9,'Tablet','Electronics',30000,6,'2023-06-01'),
(10,'Router','Networking',2500,15,'2023-06-10');

-- Show all products
SELECT * FROM PRODUCT;

-- Show product name and price
SELECT NAME, PRICE FROM PRODUCT;

-- Price greater than 5000
SELECT * FROM PRODUCT WHERE PRICE > 5000;

-- Order by price (high to low)
SELECT * FROM PRODUCT ORDER BY PRICE DESC;

-- Update price
UPDATE PRODUCT
SET PRICE = 27000
WHERE PRODUCT_ID = 2;

-- Update category
UPDATE PRODUCT
SET CATEGORY = 'Computer Accessories'
WHERE PRODUCT_ID = 1;

-- Delete single product
DELETE FROM PRODUCT WHERE PRODUCT_ID = 3;

-- Delete all products
DELETE FROM PRODUCT;

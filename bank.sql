CREATE DATABASE BANKDB;
USE BANKDB;

CREATE TABLE ACCOUNT (
    ACCOUNT_NO INT PRIMARY KEY,
    NAME VARCHAR(100),
    ACCOUNT_TYPE VARCHAR(50),
    BALANCE DECIMAL(12,2),
    OPEN_DATE DATE,
    BRANCH VARCHAR(50)
);

INSERT INTO ACCOUNT VALUES
(101,'Ravi','Saving',50000,'2020-01-10','Rajkot'),
(102,'Neha','Current',120000,'2019-03-15','Ahmedabad'),
(103,'Amit','Saving',35000,'2021-06-20','Surat'),
(104,'Pooja','Saving',78000,'2022-02-25','Vadodara'),
(105,'Karan','Current',200000,'2018-08-01','Mumbai'),
(106,'Sneha','Saving',45000,'2020-11-11','Delhi'),
(107,'Rohit','Saving',62000,'2021-07-19','Pune'),
(108,'Anita','Current',150000,'2019-05-05','Jaipur'),
(109,'Vikas','Saving',39000,'2022-09-09','Indore'),
(110,'Mehul','Saving',88000,'2023-01-01','Udaipur');


-- ======================
-- SAME QUERIES (PATIENT → ACCOUNT)
-- ======================

-- 1) Show all accounts
SELECT * FROM ACCOUNT;

-- 2) Show name and balance
SELECT NAME, BALANCE FROM ACCOUNT;

-- 3) Balance greater than 50000
SELECT * FROM ACCOUNT WHERE BALANCE > 50000;

-- 4) Order by balance (high to low)
SELECT * FROM ACCOUNT ORDER BY BALANCE DESC;

-- 5) Update balance
UPDATE ACCOUNT
SET BALANCE = 130000
WHERE ACCOUNT_NO = 102;

-- 6) Update branch
UPDATE ACCOUNT
SET BRANCH = 'Main Branch'
WHERE ACCOUNT_NO = 101;

-- 7) Delete single account
DELETE FROM ACCOUNT WHERE ACCOUNT_NO = 103;

-- 8) Delete all accounts
DELETE FROM ACCOUNT;
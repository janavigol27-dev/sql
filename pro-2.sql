-- create database
create database listt;

-- use database
use listt;

-- create customers table
create table CUSTOMERS(
	CustomerId int PRIMARY KEY,
    FirstName varchar (50),
    LastName varchar (50),
    Email varchar(50),
    RegistrationDate date
);

-- insert multiple values
INSERT INTO CUSTOMERS (CustomerId, FirstName, LastName, Email, RegistrationDate) 
VALUES
(1, 'John', 'Deo', 'john.deo@gmail.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@gmail.com', '2021-11-02'),
(3, 'Michael', 'Brown', 'michael.brown@gmail.com', '2023-06-18'),
(4, 'Emily', 'Johnson', 'emily.johnson@gmail.com', '2023-09-25'),
(5, 'David', 'Wilson', 'david.wilson@gmail.com', '2024-01-12');

 

 -- create orders table
 create table ORDERS(
	OrderId int PRIMARY KEY,
    CustomerId int,
    OrderDate date,
    TotalAmount decimal(10,2),
    foreign key (CustomerId) references CUSTOMERS (CustomerId)
);

-- insert multiple values
INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount) 
VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 3, '2023-07-20', 1320.75),
(104, 4, '2023-08-10', 450.25),
(105, 5, '2023-12-25', 510.00);



-- create employees table
create table EMPLOYEES (
	EmployeeId int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Department varchar(50),
    HireDate date,
    Salary int
);

-- insert multiple values 
INSERT INTO EMPLOYEES (EmployeeId, FirstName, LastName, Department, HireDate, Salary) 
VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
(3, 'Michael', 'Johnson', 'IT', '2022-01-15', 50000),
(4, 'Emily', 'Davis', 'Marketing', '2023-03-18', 28000),
(5, 'David', 'Wilson', 'Sales', '2019-11-05', 45000);

-- inner join
SELECT o.*, c.FirstName, c.LastName, c.Email, c.RegistrationDate
FROM Orders as o
INNER JOIN Customers as c ON o.CustomerID = c.CustomerID;

-- left join
SELECT c.*, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers as c
LEFT JOIN Orders as o ON c.CustomerID = o.CustomerID;

-- right join
SELECT c.*, o.OrderID, o.OrderDate, o.TotalAmount
FROM Orders as o
RIGHT JOIN Customers as c ON o.CustomerID = c.CustomerID;

-- full outer join
SELECT c.*, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers as c
LEFT JOIN Orders as o ON c.CustomerID = o.CustomerID
UNION
SELECT c.*, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers as c
RIGHT JOIN Orders as o ON c.CustomerID = o.CustomerID;


-- above avarage
SELECT * FROM CUSTOMERS c
WHERE c.CustomerId IN (SELECT o.CustomerId FROM ORDERS o WHERE o.TotalAmount > (SELECT AVG(TotalAmount) FROM ORDERS)
);

-- salary filter 
SELECT * FROM EMPLOYEES
WHERE Salary > (SELECT AVG(Salary) FROM EMPLOYEES);

-- year month 
SELECT OrderId, CustomerId, OrderDate,
    YEAR(OrderDate) AS Order_Year,
    MONTH(OrderDate) AS Order_Month
FROM ORDERS;

-- date difference
SELECT OrderId, CustomerId, OrderDate,
    DATEDIFF(CURDATE(), OrderDate) AS Days_Difference
FROM ORDERS;

-- date format
SELECT OrderId, CustomerId,
    DATE_FORMAT(OrderDate, '%d-%m-%Y') AS Formatted_OrderDate
FROM ORDERS;

-- full name
SELECT CustomerId,
    CONCAT(FirstName, ' ', LastName) AS Full_Name
FROM CUSTOMERS;

-- replace name
SELECT CustomerId,
    REPLACE(FirstName, 'John', 'Johnath') AS Updated_FirstName
FROM CUSTOMERS;

-- upper lower case
SELECT CustomerId,
    UPPER(FirstName) AS FirstName_Upper,
    LOWER(LastName) AS LastName_Lower
FROM CUSTOMERS;

-- trim email
SELECT CustomerId,
    TRIM(Email) AS Trimmed_Email
FROM CUSTOMERS;

-- running total 
SELECT OrderId, OrderDate, TotalAmount,
    SUM(TotalAmount) OVER (ORDER BY OrderDate) AS Running_Total
FROM ORDERS;

-- rank orders
SELECT OrderId, OrderDate, TotalAmount,
    RANK() OVER (ORDER BY TotalAmount DESC) AS Order_Rank
FROM ORDERS;

-- discount conditions  
SELECT OrderId, OrderDate, TotalAmount, TotalAmount - 
    (CASE
        WHEN TotalAmount > 1000 THEN TotalAmount * 0.10
        WHEN TotalAmount > 500 THEN TotalAmount * 0.05
        ELSE 0
     END) AS Discounted_Amount
FROM ORDERS;

-- salary category 
SELECT EmployeeId, FirstName, LastName, Salary,
    CASE
        WHEN Salary >= 50000 THEN 'High'
        WHEN Salary >= 30000 THEN 'Medium'
        ELSE 'Low'
    END AS Salary_Category
FROM EMPLOYEES;


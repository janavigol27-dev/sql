-- Database create
CREATE DATABASE CompanyDB;

-- Database use
USE CompanyDB;

-- Table create
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    dept VARCHAR(20)
);

-- Data insert
INSERT INTO Employees (id, name, salary, dept) VALUES
(1, 'Rahul', 40000, 'IT'),
(2, 'Amit', 25000, 'HR'),
(3, 'Neha', 30000, 'IT'),
(4, 'Pooja', 28000, 'Finance'),
(5, 'Suresh', 50000, 'IT');

-- All records
SELECT * FROM Employees;

-- Specific columns
SELECT name, salary FROM Employees;

-- Salary greater than 30000
SELECT * FROM Employees WHERE salary > 30000;

-- Order by salary ascending
SELECT * FROM Employees ORDER BY salary ASC;

-- Order by salary descending
SELECT * FROM Employees ORDER BY salary DESC;

-- Total employees count
SELECT COUNT(*) FROM Employees;

-- Department wise employee count
SELECT dept, COUNT(*) 
FROM Employees 
GROUP BY dept;

-- Department wise average salary > 30000
SELECT dept, AVG(salary) 
FROM Employees 
GROUP BY dept 
HAVING AVG(salary) > 30000;

-- IT department employees with high salary
SELECT name, salary 
FROM Employees 
WHERE dept = 'IT' 
ORDER BY salary DESC;

-- create databese
CREATE DATABASE PERSONDB;

-- use database
USE PERSONDB;

-- create table
CREATE TABLE STUDENT(
    STUDENT_ID INT PRIMARY KEY,                     
    NAME VARCHAR(50) NOT NULL,              
    AGE INT CHECK (AGE >= 18),               
    MARKS INT CHECK (MARKS BETWEEN 0 AND 100), 
    CITY VARCHAR(50) DEFAULT 'Delhi'
);

-- insert values
INSERT INTO STUDENT VALUES
(1, 'Rahul', 20, 85, 'Mumbai'),
(2, 'Amit', 19, 78, 'Delhi'),
(3, 'Priya', 21, 92, 'Pune'),
(4, 'Neha', 22, 88, 'Delhi'),
(5, 'Suresh', 18, 65, 'Bhopal'),
(6, 'Anjali', 23, 90, 'Delhi'),
(7, 'Rohit', 24, 55, 'Nagpur'),
(8, 'Kavita', 19, 72, 'Mumbai'),
(9, 'Vikas', 20, 60, 'Delhi'),
(10, 'Pooja', 21, 95, 'Ahmedabad');

-- show table
SELECT * FROM STUDENT;

-- show name and marks
SELECT NAME , MARKS FROM STUDENT;

-- marks are greater than 70
SELECT * FROM STUDENT WHERE MARKS > 70;

-- students from Delhi
SELECT * FROM STUDENT WHERE CITY = 'Delhi';

-- delhi students with marks above 60
SELECT * FROM STUDENT WHERE CITY = 'Delhi' AND MARKS > 60;

-- students not from Mumbai
SELECT * FROM STUDENT WHERE CITY != 'Mumbai';

-- top 5 students by marks (descending)
SELECT * FROM STUDENT ORDER BY MARKS DESC LIMIT 5;

-- cities having more than 2 students
SELECT CITY FROM STUDENT GROUP BY CITY HAVING COUNT(*) > 2;

-- highest marks in the class
SELECT MAX(MARKS) AS MAX_MARKS FROM STUDENT;

-- average marks of all students
SELECT AVG(MARKS) AS AVERAGE_MARKS FROM STUDENT;

-- total marks of all students
SELECT SUM(MARKS) AS TOTAL_MARKS FROM STUDENT;




-- create table
CREATE TABLE EMPLOYEES (
    EMP_ID INT PRIMARY KEY,                       
    EMP_NAME VARCHAR(50) NOT NULL,                
    SALARY DECIMAL(10,2) CHECK (SALARY > 0),      
    DEPARTMENT VARCHAR(50) NOT NULL,              
    JOININGDATE DATE         
);

-- insert values
INSERT INTO EMPLOYEES VALUES
(101, 'Rahul Sharma', 45000.00, 'IT', '2023-01-10'),
(102, 'Amit Verma', 38000.00, 'HR', '2023-03-15'),
(103, 'Neha Singh', 52000.00, 'Finance', '2022-11-20'),
(104, 'Rohit Kumar', 60000.00, 'IT', '2021-08-05'),
(105, 'Pooja Patel', 24000.00, 'Marketing', '2023-06-01'),
(106, 'Suresh Mehta', 75000.00, 'IT', '2020-02-18'),
(107, 'Anjali Jain', 28000.00, 'HR', '2022-09-12'),
(108, 'Vikas Gupta', 68000.00, 'Finance', '2021-04-25'),
(109, 'Kavita Rao', 47000.00, 'Marketing', '2023-07-30'),
(110, 'Manoj Yadav', 15000.00, 'IT', '2022-12-05');

-- show table
SELECT * FROM EMPLOYEES;

-- Employees with salary greater than 30000
SELECT * FROM EMPLOYEES WHERE SALARY > 30000;

-- Employees in HR or IT departments
SELECT * FROM EMPLOYEES WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'IT';

-- Employees sorted by salary (ascending)
SELECT * FROM EMPLOYEES ORDER BY SALARY ASC;

-- Show first 3 employees
SELECT * FROM EMPLOYEES LIMIT 3;

-- Count of employees in each department
SELECT DEPARTMENT, COUNT(*) FROM EMPLOYEES GROUP BY DEPARTMENT;

-- Departments with average salary greater than 40000
SELECT DEPARTMENT FROM EMPLOYEES GROUP BY DEPARTMENT HAVING AVG(SALARY) > 40000;

-- Minimum salary among employees
SELECT MIN(SALARY) AS MIN_SALARY FROM EMPLOYEES;


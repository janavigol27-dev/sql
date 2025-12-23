CREATE DATABASE LIBRARYDB;
USE LIBRARYDB;

CREATE TABLE BOOK (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(100),
    AUTHOR VARCHAR(100),
    CATEGORY VARCHAR(50),
    PRICE DECIMAL(8,2),
    ISSUE_DATE DATE
);
INSERT INTO BOOK VALUES
(1,'C Programming','Dennis Ritchie','Programming',450,'2023-01-10'),
(2,'Java Basics','James Gosling','Programming',550,'2023-02-12'),
(3,'DBMS','Navathe','Computer',600,'2023-03-15'),
(4,'Python','Guido','Programming',500,'2023-04-18'),
(5,'Networking','Tanenbaum','Computer',650,'2023-05-20'),
(6,'OS','Silberschatz','Computer',700,'2023-01-25'),
(7,'HTML CSS','Duckett','Web',400,'2023-02-05'),
(8,'JavaScript','Flanagan','Web',480,'2023-03-08'),
(9,'AI Basics','Russell','AI',800,'2023-04-10'),
(10,'ML Intro','Mitchell','AI',900,'2023-05-15');

SELECT * FROM BOOK;

SELECT TITLE, PRICE FROM BOOK;

SELECT * FROM BOOK WHERE PRICE > 500;

SELECT * FROM BOOK ORDER BY PRICE DESC;

UPDATE BOOK
SET PRICE = 750
WHERE BOOK_ID = 2;

UPDATE BOOK
SET CATEGORY = 'Advanced Programming'
WHERE BOOK_ID = 1;

DELETE FROM BOOK WHERE BOOK_ID = 3;

DELETE FROM BOOK;

CREATE DATABASE RM
USE RM
CREATE TABLE ORDERS
(
Order_ID INT,
Product_Category VARCHAR(50),
Order_Value DECIMAL(10,2),
Order_Date DATE,
Order_Status VARCHAR(50)
)
INSERT INTO ORDERS VALUES(1,'Electronics',1500.00,'06-20-2024','Completed'),
(2,'Books',20.00,'06-21-2024','Completed'),
(3,'Clothing',200.00,'06-22-2024','Canceled'),
(4,'Electronics',300.00,'06-23-2024','Completed'),
(5,'Books',30.00,'06-24-2024','Canceled'),
(6,'clothing',250.00,'06-25-2024','Completed'),
(7,'Electronics',450.00,'06-27-2024','Completed'),
(8,'Books',40.00,'06-28-2024','Completed')

SELECT * FROM ORDERS
----------------------------------------------------------------------------------------------
CREATE TABLE TRANSACTIONS
(
Transaction_ID INT,
Customer_ID INT,
Amount DECIMAL(10,2),
Transaction_Date DATE,
Revenue DECIMAL(10,2)
)
INSERT INTO TRANSACTIONS VALUES(1,101,350.00,'05-20-2024',350.00),
(2,102,450.00,'05-21-2024',450.00),
(3,103,250.00,'05-19-2024',250.00),
(4,104,150.00,'05-22-2024',150.00),
(5,105,550.00,'05-23-2024',550.00),
(6,106,600.00,'05-24-2024',600.00),
(7,107,650.00,'05-25-2024',650.00),
(8,108,100.00,'05-26-2024',100.00)

SELECT * FROM TRANSACTIONS
------------------------------------------------------------------------------------
--SQL Queries
-- Q1. Calculate the average order value for each product category.

SELECT Product_Category,
       AVG(Order_Value)as avg_Order_Value
FROM ORDERS
GROUP BY Product_Category

-- Q2.Find the top 3 customers who have spent the most money in the past year
SELECT Customer_ID,
       SUM(amount) AS Total_Spent
FROM TRANSACTIONS
WHERE Transaction_Date >=DATEADD(YEAR, -1, GETDATE())
GROUP BY Customer_ID
ORDER BY Total_Spent DESC

--Q3. Count the number of orders placed in the previous year and month.
SELECT COUNT(*) AS Num_of_Orders
FROM ORDERS
WHERE YEAR(Order_Date) = YEAR(DATEADD(YEAR, -1, GETDATE()))    --Previous Year
AND MONTH(Order_Date) = MONTH(DATEADD(YEAR, -1, GETDATE()))    --Previous Month

--Q4.Calculate the total sales revenue for the past quarter
SELECT SUM(revenue)	AS Total_Sales_Revenue
FROM TRANSACTIONS
where Transaction_Date >= DATEADD(MONTH,-3,GETDATE())
 And transaction_Date <= GETDATE()

--Q5.Determine the number of orders that have been canceled in the past year
SELECT COUNT(*) AS CANCELED_ORDERS
FROM ORDERS
WHERE Order_Status = 'CANCELED'
AND Order_Date >= DATEADD(YEAR, -1, GETDATE())
AND ORDER_DATE <= GETDATE()



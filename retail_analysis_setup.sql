-- Retail Sales Analysis Project
-- Author : Rimi Sarkar
-- Tools: MySQL
-- Description : Database creation , table structure and data loading
CREATE DATABASE retail_analysis;
USE retail_analysis;
CREATE TABLE retail (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(50),
    Revenue DECIMAL(12,2),
    Month INT,
    Year INT,
    MonthName VARCHAR(20)
);
SHOW VARIABLES LIKE 'secure_file_priv';
USE retail_analysis;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_retail_final.csv'
INTO TABLE retail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@InvoiceNo,
 @StockCode,
 @Description,
 @Quantity,
 @InvoiceDate,
 @UnitPrice,
 @CustomerID,
 @Country,
 @Revenue,
 @Month,
 @Year,
 @MonthName)
SET
InvoiceNo = @InvoiceNo,
StockCode = @StockCode,
Description = @Description,
Quantity = @Quantity,
InvoiceDate = STR_TO_DATE(@InvoiceDate, '%d-%m-%Y %H:%i'),
UnitPrice = @UnitPrice,
CustomerID = @CustomerID,
Country = @Country,
Revenue = @Revenue,
Month = @Month,
Year = @Year,
MonthName = @MonthName;
SELECT COUNT(*) FROM retail;
SELECT * FROM retail LIMIT 5;

SELECT SUM(Revenue) AS Total_Revenue
FROM retail;

SELECT COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM retail;

SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM retail;

SELECT 
    Year,
    Month,
    SUM(Revenue) AS Monthly_Revenue
FROM retail
GROUP BY Year, Month
ORDER BY Year, Month;

SELECT COUNT(*) AS total_rows
FROM retail;

SELECT ROUND(SUM(Revenue),2) AS total_revenue
FROM retail;

SELECT 
    Year,
    ROUND(SUM(Revenue),2) AS yearly_revenue
FROM retail
GROUP BY Year
ORDER BY Year;

SELECT 
    Year,
    Month,
    ROUND(SUM(Revenue),2) AS monthly_revenue
FROM retail
GROUP BY Year, Month
ORDER BY Year, Month;

SELECT 
    Description,
    ROUND(SUM(Revenue),2) AS product_revenue
FROM retail
GROUP BY Description
ORDER BY product_revenue DESC
LIMIT 10;

SELECT 
    Country,
    ROUND(SUM(Revenue),2) AS country_revenue
FROM retail
GROUP BY Country
ORDER BY country_revenue DESC;

SELECT Year, SUM(Revenue) AS Total_Revenue
FROM retail
GROUP BY Year
ORDER BY Year;

SELECT MonthName, SUM(Revenue) AS Monthly_Revenue
FROM retail
GROUP BY MonthName, Month
ORDER BY Month;

SELECT CustomerID, SUM(Revenue) AS Customer_Revenue
FROM retail
GROUP BY CustomerID
ORDER BY Customer_Revenue DESC
LIMIT 5;

SELECT 
Country,
SUM(Revenue) AS Country_Revenue,
ROUND( (SUM(Revenue) / (SELECT SUM(Revenue) FROM retail)) * 100 , 2) AS Percentage
FROM retail
GROUP BY Country
ORDER BY Country_Revenue DESC
LIMIT 5;

SELECT 
    ROUND(
        SUM(CASE WHEN Country = 'United Kingdom' THEN Revenue ELSE 0 END) 
        / SUM(Revenue) * 100, 2
    ) AS UK_Percentage
FROM retail;

SELECT COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM retail;















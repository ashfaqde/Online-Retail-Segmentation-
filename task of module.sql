create schema retailship;
use retailship;

select * from online_retail;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Online_Retail';

SELECT CustomerID, SUM(UnitPrice * Quantity) AS TotalOrderValue
FROM Online_Retail
GROUP BY CustomerID
ORDER BY TotalOrderValue DESC;

SELECT CustomerID, COUNT(DISTINCT StockCode) AS UniqueProducts
FROM Online_Retail
GROUP BY CustomerID
ORDER BY UniqueProducts DESC;

SELECT CustomerID, COUNT(InvoiceNo) AS PurchaseCount
FROM Online_Retail
GROUP BY CustomerID
HAVING COUNT(InvoiceNo) = 1;

SELECT StockCode, COUNT(*) AS Frequency
FROM Online_Retail
GROUP BY StockCode
ORDER BY Frequency DESC
LIMIT 5;

SELECT CustomerID, COUNT(InvoiceNo) AS PurchaseFrequency,
CASE
    WHEN COUNT(InvoiceNo) > 10 THEN 'High'
    WHEN COUNT(InvoiceNo) BETWEEN 5 AND 10 THEN 'Medium'
    ELSE 'Low'
END AS FrequencySegment
FROM Online_Retail
GROUP BY CustomerID;


SELECT Country, AVG(UnitPrice * Quantity) AS AverageOrderValue
FROM Online_Retail
GROUP BY Country
ORDER BY AverageOrderValue DESC;

SELECT CustomerID
FROM Online_Retail
WHERE InvoiceDate < DATE_SUB(NOW(), INTERVAL 6 MONTH)
GROUP BY CustomerID;

SELECT a.StockCode AS ProductA, b.StockCode AS ProductB, COUNT(*) AS Frequency
FROM Online_Retail a
JOIN Online_Retail b ON a.InvoiceNo = b.InvoiceNo AND a.StockCode <> b.StockCode
GROUP BY a.StockCode, b.StockCode
ORDER BY Frequency DESC
LIMIT 10;

SELECT YEAR(InvoiceDate) AS Year, MONTH(InvoiceDate) AS Month, SUM(UnitPrice * Quantity) AS TotalSales
FROM Online_Retail
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Year, Month;
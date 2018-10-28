SELECT ProductID,
UPPER(name) AS ProductName,
ROUND(Weight,0) AS ApproxWeight
FROM Product;

SELECT ProductID,
UPPER(name) AS ProductName,
ROUND(Weight,0) AS ApproxWeight,
Datename(mm,SellstartDate) AS SellStartMonth,
DateName(yyyy,SellstartDate) AS SellStartYear
FROM Product;

SELECT ProductID,
UPPER(name) AS ProductName,
ROUND(Weight,0) AS ApproxWeight,
SUBSTRING(ProductNumber,0,3) AS ProductType,
Datename(mm,SellstartDate) AS SellStartMonth,
DateName(yyyy,SellstartDate) AS SellStartYear
FROM Product;

SELECT ProductID,
UPPER(name) AS ProductName,
ROUND(Weight,0) AS ApproxWeight,
SUBSTRING(ProductNumber,0,3) AS ProductType,
Datename(mm,SellstartDate) AS SellStartMonth,
DateName(yyyy,SellstartDate) AS SellStartYear
FROM Product WHERE Weight IS NOT NULL;


SELECT CompanyName,
TotalDue AS Revenue,
Rank() OVER(ORDER BY TotalDue DESC) RankByRevenue
FROM Customer
RIGHT JOIN  SalesOrderHeader ON Customer.CustomerId = SalesOrderHeader.CustomerId;

SELECT Product.Name ,
Sum(LineTotal) AS TotalRevenue
FROM Product
RIGHT JOIN  SalesOrderDetail ON SalesOrderDetail.ProductID = Product.ProductID
GROUP BY name
ORDER BY TotalRevenue DESC;

SELECT Product.Name ,
Sum(LineTotal) AS TotalRevenue
FROM Product
RIGHT JOIN  SalesOrderDetail ON SalesOrderDetail.ProductID = Product.ProductID
WHERE ListPrice > 1000
GROUP BY name
ORDER BY TotalRevenue DESC;

SELECT Product.Name ,
Sum(LineTotal) AS TotalRevenue
FROM Product
RIGHT JOIN  SalesOrderDetail ON SalesOrderDetail.ProductID = Product.ProductID
GROUP BY name
HAVING Sum(LineTotal) > 20000
ORDER BY TotalRevenue DESC;

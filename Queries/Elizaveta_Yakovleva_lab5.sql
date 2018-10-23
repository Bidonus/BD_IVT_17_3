SELECT ProductID, UPPER(Name) as ProductName, FLOOR(Weight) as ApproxWeight FROM AdventureWorksLT.SalesLT.Product;

SELECT ProductID, UPPER(Name) as ProductName, FLOOR(Weight) as ApproxWeight, 
Datename(mm,SellstartDate) as SellStartMonth, DateName(yyyy,SellstartDate) as SellStartYear FROM SalesLT.Product;

SELECT  ProductID, UPPER(Name) as ProductName, FLOOR(Weight) as ApproxWeight, 
Datename(mm,SellstartDate) as SellStartMonth, DateName(yyyy,SellstartDate) as SellStartYear, 
LEFT(ProductNumber, 2) as ProductType FROM SalesLT.Product;

SELECT  ProductID, UPPER(Name) as ProductName, FLOOR(Weight) as ApproxWeight, 
Datename(mm,SellstartDate) as SellStartMonth, DateName(yyyy,SellstartDate) as SellStartYear, 
LEFT(ProductNumber, 2) as ProductType
FROM SalesLT.Product WHERE Size LIKE '[1-9][0-9]';

SELECT CompanyName, TotalDue as Revenue, RANK() OVER (ORDER BY TotalDue DESC) as RankByRevenue 
FROM SalesLT.SalesOrderHeader 
JOIN SalesLT.Customer 
ON SalesLT.SalesOrderHeader.CustomerID = SalesLT.Customer.CustomerID;

SELECT Name, SUM(LineTotal) as TotalRevenue FROM SalesLT.SalesOrderDetail 
JOIN SalesLT.Product 
ON SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID
GROUP BY Name 
ORDER BY SUM(LineTotal) DESC;

SELECT Name, SUM(LineTotal) as TotalRevenue FROM SalesLT.SalesOrderDetail 
JOIN SalesLT.Product 
ON SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID 
WHERE LineTotal > 1000 
GROUP BY Name 
ORDER BY SUM(LineTotal) DESC;

SELECT Name, SUM(LineTotal) as TotalRevenue FROM SalesLT.SalesOrderDetail 
JOIN SalesLT.Product 
ON SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID 
GROUP BY Name HAVING SUM(LineTotal) > 20000 
ORDER BY SUM(LineTotal) DESC;
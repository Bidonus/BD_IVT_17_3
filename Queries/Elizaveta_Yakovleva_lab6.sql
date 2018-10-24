SELECT ProductID, Name, ListPrice
FROM AdventureWorksLT.SalesLT.Product 
WHERE ListPrice > (SELECT AVG(UnitPrice) FROM AdventureWorksLT.SalesLT.SalesOrderDetail) 
ORDER BY ProductID; 

SELECT ProductID, Name, ListPrice 
FROM AdventureWorksLT.SalesLT.Product 
WHERE ListPrice >= 100 
AND ProductID IN (SELECT ProductID FROM AdventureWorksLT.SalesLT.SalesOrderDetail WHERE UnitPrice < 100) 
ORDER BY ProductID;

SELECT ProductID, Name, StandardCost, ListPrice, 
(SELECT AVG(UnitPrice) FROM AdventureWorksLT.SalesLT.SalesOrderDetail 
WHERE ProductID = AdventureWorksLT.SalesLT.Product.ProductID) AS AvgSellingPrice 
FROM AdventureWorksLT.SalesLT.Product 
ORDER BY ProductID;

SELECT ProductID, Name, StandardCost, ListPrice, 
(SELECT AVG(UnitPrice) FROM AdventureWorksLT.SalesLT.SalesOrderDetail 
WHERE ProductID = AdventureWorksLT.SalesLT.Product.ProductID) AS AvgSellingPrice 
FROM AdventureWorksLT.SalesLT.Product 
WHERE StandardCost > (SELECT AVG(UnitPrice) FROM AdventureWorksLT.SalesLT.SalesOrderDetail 
WHERE ProductID = AdventureWorksLT.SalesLT.Product.ProductID) 
ORDER BY ProductID;

SELECT SalesOrderID, AdventureWorksLT.SalesLT.SalesOrderHeader.CustomerID, FirstName, LastName, TotalDue 
FROM AdventureWorksLT.SalesLT.SalesOrderHeader 
CROSS APPLY AdventureWorksLT.dbo.ufnGetCustomerInformation(CustomerID) 
ORDER BY SalesOrderID;

SELECT CustomerAddress.CustomerID, FirstName, LastName, AddressLine1, City
FROM AdventureWorksLT.SalesLT.Address
JOIN AdventureWorksLT.SalesLT.CustomerAddress
ON (AdventureWorksLT.SalesLT.Address.AddressID = AdventureWorksLT.SalesLT.CustomerAddress.AddressID)
CROSS APPLY AdventureWorksLT.dbo.ufnGetCustomerInformation(CustomerID) 
ORDER BY CustomerID;
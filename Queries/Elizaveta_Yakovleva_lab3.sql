SELECT CompanyName, SalesOrderID, TotalDue 
FROM AdventureWorksLT.SalesLT.Customer 
INNER JOIN AdventureWorksLT.SalesLT.SalesOrderHeader 
ON AdventureWorksLT.SalesLT.Customer.CustomerID = AdventureWorksLT.SalesLT.SalesOrderHeader.CustomerID;


SELECT AddressLine1, AddressLine2, City, StateProvince, PostalCode, CountryRegion, CompanyName
FROM (AdventureWorksLT.SalesLT.Customer 
INNER JOIN AdventureWorksLT.SalesLT.CustomerAddress
ON AdventureWorksLT.SalesLT.Customer.CustomerID = AdventureWorksLT.SalesLT.CustomerAddress.CustomerID)
JOIN AdventureWorksLT.SalesLT.Address
ON AdventureWorksLT.SalesLT.CustomerAddress.AddressID = AdventureWorksLT.SalesLT.Address.AddressID
Where AdventureWorksLT.SalesLT.CustomerAddress.AddressType LIKE 'Main Office';


SELECT CompanyName, FirstName, LastName, SalesOrderID, TotalDue
FROM AdventureWorksLT.SalesLT.Customer 
LEFT OUTER JOIN AdventureWorksLT.SalesLT.SalesOrderHeader
ON AdventureWorksLT.SalesLT.Customer.CustomerID = AdventureWorksLT.SalesLT.SalesOrderHeader.CustomerID
ORDER BY SalesOrderID DESC;

SELECT AdventureWorksLT.SalesLT.Customer.CustomerID
FROM AdventureWorksLT.SalesLT.Customer 
LEFT JOIN AdventureWorksLT.SalesLT.SalesOrderHeader
ON AdventureWorksLT.SalesLT.Customer.CustomerID = AdventureWorksLT.SalesLT.SalesOrderHeader.CustomerID
WHERE AdventureWorksLT.SalesLT.SalesOrderHeader.CustomerID IS NULL;

SELECT AdventureWorksLT.SalesLT.Customer.CustomerID, ProductID
FROM (AdventureWorksLT.SalesLT.Customer 
LEFT JOIN AdventureWorksLT.SalesLT.SalesOrderHeader
ON AdventureWorksLT.SalesLT.Customer.CustomerID = AdventureWorksLT.SalesLT.SalesOrderHeader.CustomerID)
FULL JOIN AdventureWorksLT.SalesLT.Product
ON AdventureWorksLT.SalesLT.Customer.CustomerID = AdventureWorksLT.SalesLT.Product.ProductID
WHERE AdventureWorksLT.SalesLT.SalesOrderHeader.CustomerID IS NULL;
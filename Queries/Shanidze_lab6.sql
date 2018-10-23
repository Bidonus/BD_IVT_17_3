select ProductID, Name, ListPrice
from SalesLT.Product 
where ListPrice > (select AVG(UnitPrice) from SalesLT.SalesOrderDetail) 
order by ProductID;

select ProductID, Name, ListPrice 
from SalesLT.Product 
where ListPrice >= 100 
AND ProductID IN (select ProductID from SalesLT.SalesOrderDetail where UnitPrice < 100) 
order by ProductID;

select ProductID, Name, StandardCost, ListPrice, (select AVG(UnitPrice) from SalesLT.SalesOrderDetail where ProductID = SalesLT.Product.ProductID) AS AvgSellingPrice 
from SalesLT.Product order by ProductID;

select ProductID, Name, StandardCost, ListPrice, (select AVG(UnitPrice) from SalesLT.SalesOrderDetail where ProductID = SalesLT.Product.ProductID) AS AvgSellingPrice 
from SalesLT.Product 
where StandardCost > (select AVG(UnitPrice) from SalesLT.SalesOrderDetail where ProductID = SalesLT.Product.ProductID) 
order by ProductID;



select SalesOrderID, SalesLT.SalesOrderHeader.CustomerID, FirstName, LastName, TotalDue 
from SalesLT.SalesOrderHeader 
CROSS APPLY dbo.ufnGetCustomerInformation(CustomerID) 
order by SalesOrderID;

select SalesLT.CustomerAddress.CustomerID, FirstName, LastName, AddressLine1, City
from SalesLT.Address
JOIN SalesLT.CustomerAddress
on (SalesLT.Address.AddressID = SalesLT.CustomerAddress.AddressID)
CROSS APPLY dbo.ufnGetCustomerInformation(CustomerID) 
order by CustomerID;

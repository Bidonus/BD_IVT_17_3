SELECT CompanyName, AddressLine1, City, (IIF(AddressType = 'Main Office', 'Billing', ' ' )) as AddressType
FROM (AdventureWorksLT.SalesLT.CustomerAddress
INNER JOIN AdventureWorksLT.SalesLT.Customer
ON AdventureWorksLT.SalesLT.CustomerAddress.CustomerID = AdventureWorksLT.SalesLT.Customer.CustomerID)
JOIN AdventureWorksLT.SalesLT.Address
ON AdventureWorksLT.SalesLT.CustomerAddress.AddressID = AdventureWorksLT.SalesLT.Address.AddressID;

SELECT CompanyName, AddressLine1, City, (IIF(AddressType = 'Shipping', 'Shipping', ' ')) as AddressType
FROM (AdventureWorksLT.SalesLT.CustomerAddress
INNER JOIN AdventureWorksLT.SalesLT.Customer
ON AdventureWorksLT.SalesLT.CustomerAddress.CustomerID = AdventureWorksLT.SalesLT.Customer.CustomerID)
JOIN AdventureWorksLT.SalesLT.Address 
ON AdventureWorksLT.SalesLT.CustomerAddress.AddressID = AdventureWorksLT.SalesLT.Address.AddressID;

SELECT CompanyName, AddressLine1, City, (IIF(AddressType = 'Main Office', 'Billing', 'Shipping' )) as AddressType
FROM (AdventureWorksLT.SalesLT.CustomerAddress
INNER JOIN AdventureWorksLT.SalesLT.Customer
ON AdventureWorksLT.SalesLT.CustomerAddress.CustomerID = AdventureWorksLT.SalesLT.Customer.CustomerID)
JOIN AdventureWorksLT.SalesLT.Address
ON AdventureWorksLT.SalesLT.CustomerAddress.AddressID = AdventureWorksLT.SalesLT.Address.AddressID
ORDER BY AddressType ASC, CompanyName ASC;

SELECT CompanyName
FROM (AdventureWorksLT.SalesLT.CustomerAddress
INNER JOIN AdventureWorksLT.SalesLT.Customer
ON AdventureWorksLT.SalesLT.CustomerAddress.CustomerID = AdventureWorksLT.SalesLT.Customer.CustomerID)
JOIN AdventureWorksLT.SalesLT.Address
ON AdventureWorksLT.SalesLT.CustomerAddress.AddressID = AdventureWorksLT.SalesLT.Address.AddressID
WHERE AddressType = 'Main Office'

INTERSECT

SELECT CompanyName
FROM (AdventureWorksLT.SalesLT.CustomerAddress
INNER JOIN AdventureWorksLT.SalesLT.Customer
ON AdventureWorksLT.SalesLT.CustomerAddress.CustomerID = AdventureWorksLT.SalesLT.Customer.CustomerID)
JOIN AdventureWorksLT.SalesLT.Address 
ON AdventureWorksLT.SalesLT.CustomerAddress.AddressID = AdventureWorksLT.SalesLT.Address.AddressID
WHERE AddressType = 'Shipping';

SELECT CompanyName
FROM (AdventureWorksLT.SalesLT.CustomerAddress
INNER JOIN AdventureWorksLT.SalesLT.Customer
ON AdventureWorksLT.SalesLT.CustomerAddress.CustomerID = AdventureWorksLT.SalesLT.Customer.CustomerID)
JOIN AdventureWorksLT.SalesLT.Address
ON AdventureWorksLT.SalesLT.CustomerAddress.AddressID = AdventureWorksLT.SalesLT.Address.AddressID
WHERE AddressType = 'Main Office'

EXCEPT

SELECT CompanyName
FROM (AdventureWorksLT.SalesLT.CustomerAddress
INNER JOIN AdventureWorksLT.SalesLT.Customer
ON AdventureWorksLT.SalesLT.CustomerAddress.CustomerID = AdventureWorksLT.SalesLT.Customer.CustomerID)
JOIN AdventureWorksLT.SalesLT.Address 
ON AdventureWorksLT.SalesLT.CustomerAddress.AddressID = AdventureWorksLT.SalesLT.Address.AddressID
WHERE AddressType = 'Shipping';
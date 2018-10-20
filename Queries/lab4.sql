SELECT CompanyName, AddressLine1, city, 
CASE 
WHEN addresstype LIKE 'Main office' THEN 'billing' 
WHEN addresstype LIKE 'Shipping' THEN 'Shipping' END addresstype
FROM SalesLT.Customer
FULL OUTER JOIN SalesLT.CustomerAddress 
ON SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
FULL OUTER JOIN SalesLT.Address 
ON SalesLT.CustomerAddress.AddressID = SalesLT.Address.AddressID 
ORDER BY AddressType DESC

SELECT CompanyName, AddressLine1, city, addresstype
FROM SalesLT.Customer
FULL OUTER JOIN SalesLT.CustomerAddress 
ON SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
FULL OUTER JOIN SalesLT.Address 
ON SalesLT.CustomerAddress.AddressID = SalesLT.Address.AddressID 
ORDER BY AddressType DESC


SELECT CompanyName, AddressLine1, city, CASE 
WHEN addresstype LIKE 'Main office' THEN 'billing' 
WHEN AddressType LIKE 'Shipping' THEN 'Shipping' END addresstype
FROM SalesLT.Customer
FULL OUTER JOIN SalesLT.CustomerAddress 
ON SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
FULL OUTER JOIN SalesLT.Address 
ON SalesLT.CustomerAddress.AddressID = SalesLT.Address.AddressID 
ORDER BY AddressType DESC, CompanyName ASC

SELECT CompanyName 
FROM SalesLT.Customer
FULL OUTER JOIN SalesLT.CustomerAddress 
ON SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
WHERE AddressType LIKE 'Main Office'
EXCEPT
SELECT CompanyName  FROM SalesLT.Customer
FULL OUTER JOIN SalesLT.CustomerAddress 
ON SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
WHERE AddressType LIKE 'Shipping'

SELECT CompanyName 
FROM SalesLT.Customer
FULL OUTER JOIN SalesLT.CustomerAddress 
ON SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
WHERE AddressType LIKE 'Shipping'
INTERSECT
SELECT CompanyName  FROM SalesLT.Customer
FULL OUTER JOIN SalesLT.CustomerAddress 
ON SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
WHERE AddressType LIKE 'Main Office'
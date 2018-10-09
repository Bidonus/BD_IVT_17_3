SELECT CompanyName, SalesOrderID, TotalDue 
FROM Customer, SalesOrderHeader 
WHERE Customer.CustomerID = SalesOrderHeader.CustomerID;

SELECT Address.AddressLine1 + ' ' + isnull(Address.AddressLine2, ' ') AS adress,
Address.City, Address.StateProvince, Address.Postalcode, Customer.companyName, SalesOrderHeader.SalesOrderID, SalesOrderHeader.TotalDue FROM Customer
JOIN SalesOrderHeader ON SalesOrderHeader.CustomerID = Customer.CustomerID
JOIN Address ON Address.AddressID = SalesOrderHeader.ShipToAddressID;

SELECT Customer.companyName, Customer.FirstName, Customer.LastName, Customer.EmailAddress, Customer.Phone, SalesOrderHeader.SalesOrderID, SalesOrderHeader.TotalDue FROM Customer 
LEFT JOIN SalesOrderHeader ON SalesOrderHeader.CustomerID = Customer.CustomerID
order by SalesOrderID DESC;

SELECT Customer.CustomerID, Customer.companyName, Customer.FirstName, Customer.LastName, Customer.Phone, CustomerAddress.AddressID FROM  Customer 
FULL OUTER JOIN CustomerAddress ON CustomerAddress.CustomerID = Customer.CustomerID
where AddressID IS NULL;

SELECT Customer.CustomerID, Product.ProductID
FROM SalesOrderDetail
   RIGHT JOIN Product ON Product.ProductID = SalesOrderDetail.ProductID
   FULL OUTER JOIN SalesOrderHeader ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
   FULL OUTER JOIN Customer ON  Customer.CustomerID = SalesOrderHeader.CustomerID
   WHERE SalesOrderDetail.SalesOrderID IS NULL;
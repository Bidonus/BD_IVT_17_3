SELECT * FROM SalesLT.Customer;

SELECT Title, FirstName, MiddleName, LastName, MiddleName FROM Customer;

SELECT SalesPerson, CustomerName = Title + ' ' + LastName, Phone FROM Customer;

SELECT CustomerCompany = CONVERT(varchar, CustomerID) + ': ' + CompanyName FROM Customer;

SELECT OrderRevision = SalesOrderNumber + '(' + CONVERT(varchar, RevisionNumber) + ')', OrderData = CONVERT(varchar, OrderDate, 102) FROM SalesOrderHeader;

SELECT CustomerName = FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName FROM Customer;

SELECT CustomerID, PrimaryContact = ISNULL(EmailAddress, Phone) FROM Customer;

SELECT SalesOrderID, CASE [ShipDate] WHEN ShipDate THEN 'Shipped' ELSE 'Awaiting Shipment' END FROM SalesOrderHeader;


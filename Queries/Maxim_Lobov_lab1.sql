SELECT * FROM SalesLT.Customer;
select Title, FirstName, MiddleName, LastName, Suffix from SalesLT.Customer;
select SalesPerson, CustomerName = Title + ' ' + FirstName, Phone from Saleslt.Customer;
select CustomerCompany = CONVERT(varchar, CustomerID) + ': ' + CompanyName from SalesLT.Customer;
select OrderRevision = SalesOrderNumber + ' (' + CONVERT(varchar, RevisionNumber) + ')', OrderDate = CONVERT(varchar, OrderDate, 102) FROM SalesLT.SalesOrderHeader;
select CustomerName = FirstName + ' ' + ISNULL(middleName,'') + ' ' + LastName from SalesLT.Customer;
update SalesLT.Customer set EmailAddress=NULL where CustomerID % 7 = 1;
select CustomerID, PrimaryContact = ISNULL(EmailAddress, Phone) FROM SalesLT.Customer;
update SalesLT.SalesOrderHeader set ShipDate = null where SalesOrderID > 71899;
select SalesOrderID, case WHEN ShipDate IS NULL THEN 'Awaiting Shipment' ELSE 'Shipped' END AS ShippingStatus FROM SalesLT.SalesOrderHeader;
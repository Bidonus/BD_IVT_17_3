select * from SalesLT.Customer;
select Title, FirstName, MiddleName, Suffix from SalesLT.Customer;
select SalesPerson, (Title + ' ' + LastName) as CustomerName, Phone from SalesLT.Customer;
select (cast(CustomerID AS nvarchar) + ': '+  CompanyName) as CustomerCompany from SalesLT.Customer;
select (SalesOrderNumber + '(' + cast(RevisionNumber AS nvarchar) + ')') as OrderRevision, FORMAT(OrderDate, 'yyyy.MM.dd') as OrderDate from SalesLT.SalesOrderHeader;
select (FirstName + ' ' + ISNULL(MiddleName, '') + ' '  + LastName) as CustomerName from SalesLT.Customer;
select CustomerID, (ISNULL(EmailAddress, Phone)) as PrimaryContact  from SalesLT.Customer;
SELECT SalesOrderID,case WHEN ShipDate IS NULL THEN 'Awaiting Shipment' ELSE 'Shipped' END AS ShippingStatus FROM SalesLT.SalesOrderHeader;
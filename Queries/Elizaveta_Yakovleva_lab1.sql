select * from Customer;

select Title, FirstName, MiddleName, LastName, Suffix from Customer;

select SalesPerson, (Title +' '+ LastName) as CustomerName, Phone from Customer;


select (STR(CustomerID) + ': ' + CompanyName) as  CustomerCompany from Customer;

select (SalesOrderNumber + ' (' + CAST(RevisionNumber as varchar) + ')') as OrderRevision, CAST(OrderDate as date) as OrderDate from SalesOrderHeader;

select (FirstName +' '+ ISNULL(MiddleName, '') + ' '+LastName) as CustomerName from Customer;


select CustomerID, ISNULL(EmailAddress, Phone) as  PrimaryContact from Customer;

SELECT
  SalesOrderID,

  CASE
    [ShipDate]
	WHEN ShipDate THEN 'Shipped'
    ELSE 'Awaiting Shipment'
  END

FROM SalesOrderHeader;

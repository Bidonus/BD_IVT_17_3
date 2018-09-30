select * from SalesLt.Customer;
select Title,FirstName,MiddleName,LastName,Suffix from SalesLt.Customer;
select SalesPerson,
Title + FirstName  as CustomerName,
Phone from SalesLt.Customer;
select
CONVERT(varchar,CustomerID)+ ' : ' + CompanyName as  CustomerCompany
from SalesLt.Customer;
select
CONVERT(varchar, SalesOrderID) + ' (' + CONVERT(varchar,RevisionNumber)+ ')' as OrderRevision,
CONVERT(nvarchar,OrderDate ,102) as OrderDate
from SalesLt.SalesOrderHeader;
select
FirstName +' ' +LastName  +' '+ ISNULL(MiddleName, '')  as  CustomerName
from SalesLt.Customer;
select
ISNULL(EmailAddress , Phone)  as   PrimaryContact
from SalesLt.Customer;
select
SalesOrderID,
ISNULL(CONVERT(nvarchar,ShipDate ,102) , 'Awaiting Shipment')  as   PrimaryContact
from SalesLt.SalesOrderHeader;


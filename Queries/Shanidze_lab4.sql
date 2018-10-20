select CompanyName, AddressLine1, City, AddressType = CASE when AddressType = 'Main Office' then 'Billing' end from SalesLT.Customer join SalesLT.CustomerAddress on (SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID) join SalesLT.Address on (SalesLT.CustomerAddress.AddressID = SalesLT.Address.AddressID);

select CompanyName, AddressLine1, City, AddressType = CASE when AddressType = 'Shipping' then 'Shipping' end from SalesLT.Customer join SalesLT.CustomerAddress on (SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID) join SalesLT.Address on (SalesLT.CustomerAddress.AddressID = SalesLT.Address.AddressID);

select CompanyName, AddressLine1, City, AddressType = CASE when AddressType = 'Main Office' then 'Billing' else 'Shipping' end from SalesLT.Customer join SalesLT.CustomerAddress on (SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID) join SalesLT.Address on (SalesLT.CustomerAddress.AddressID = SalesLT.Address.AddressID)
UNION
select CompanyName, AddressLine1, City, AddressType = CASE when AddressType = 'Shipping' then 'Shipping' else 'Billing' end from SalesLT.Customer join SalesLT.CustomerAddress on (SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID) join SalesLT.Address on (SalesLT.CustomerAddress.AddressID = SalesLT.Address.AddressID) order by CompanyName, AddressType;

select CompanyName from SalesLT.Customer 
EXCEPT 
select CompanyName from SalesLT.Customer join SalesLT.CustomerAddress on (SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID)  where AddressType = 'Shipping';

select CompanyName from SalesLT.Customer join SalesLT.CustomerAddress on (SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID)  where AddressType = 'Main Office'
INTERSECT 
select CompanyName from SalesLT.Customer join SalesLT.CustomerAddress on (SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID)  where AddressType = 'Shipping';
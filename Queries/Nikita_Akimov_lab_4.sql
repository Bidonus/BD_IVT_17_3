Select CompanyName, AddressLine1, city, case  when addresstype like 'Main office' then 'billing' when addresstype like 'Shipping' then 'Shipping' end addresstype
from SalesLT.Customer
full outer join SalesLT.CustomerAddress on SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
full outer join SalesLT.Address on SalesLT.CustomerAddress.AddressID = SalesLT.Address.AddressID order by AddressType DESC


Select CompanyName, AddressLine1, city, addresstype
from SalesLT.Customer
full outer join SalesLT.CustomerAddress on SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
full outer join SalesLT.Address on SalesLT.CustomerAddress.AddressID = SalesLT.Address.AddressID order by AddressType DESC


Select CompanyName, AddressLine1, city, case  when addresstype like 'Main office' then 'billing' when AddressType like 'Shipping' then 'Shipping' end addresstype
from SalesLT.Customer
full outer join SalesLT.CustomerAddress on SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
full outer join SalesLT.Address on SalesLT.CustomerAddress.AddressID = SalesLT.Address.AddressID order by AddressType DESC, CompanyName ASC




SELECT CompanyName  from SalesLT.Customer
full outer join SalesLT.CustomerAddress on SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
where AddressType like 'Main Office'
EXCEPT
SELECT CompanyName  from SalesLT.Customer
full outer join SalesLT.CustomerAddress on SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
where AddressType like 'Shipping'



SELECT CompanyName  from SalesLT.Customer
full outer join SalesLT.CustomerAddress on SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
where AddressType like 'Shipping'
INTERSECT
SELECT CompanyName  from SalesLT.Customer
full outer join SalesLT.CustomerAddress on SalesLT.Customer.CustomerID = SalesLT.CustomerAddress.CustomerID
where AddressType like 'Main Office'
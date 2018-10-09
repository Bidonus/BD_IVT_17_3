SELECT salesLt.Customer.companyName , SalesLT.SalesOrderHeader.SalesOrderID,SalesLT.SalesOrderHeader.TotalDue from salesLt.Customer 
join SalesLT.SalesOrderHeader on SalesLt.SalesOrderHeader.CustomerID = SalesLt.Customer.CustomerID; 
SELECT SalesLt.Address.AddressLine1+' '+isnull(SalesLt.Address.AddressLine2,' ') as adress, 
SalesLT.Address.City,SalesLt.Address.StateProvince,SalesLt.Address.Postalcode,Customer.companyName , SalesLT.SalesOrderHeader.SalesOrderID,SalesLT.SalesOrderHeader.TotalDue from salesLt.Customer 
join SalesLT.SalesOrderHeader on SalesLt.SalesOrderHeader.CustomerID = SalesLt.Customer.CustomerID 
join SalesLT.Address ON SalesLT.Address.AddressID = SalesLT.SalesOrderHeader.ShipToAddressID; 
SELECT salesLt.Customer.companyName, salesLt.Customer.FirstName, salesLt.Customer.LastName , salesLt.Customer.EmailAddress,salesLt.Customer.Phone,SalesLT.SalesOrderHeader.SalesOrderID,SalesLT.SalesOrderHeader.TotalDue from salesLt.Customer 
left join SalesLT.SalesOrderHeader on SalesLt.SalesOrderHeader.CustomerID = SalesLt.Customer.CustomerID 
order by SalesOrderID DESC; 
SELECT salesLt.Customer.CustomerID, salesLt.Customer.companyName, salesLt.Customer.FirstName, salesLt.Customer.LastName ,salesLt.Customer.Phone, SalesLT.CustomerAddress.AddressID from salesLt.Customer 
full OUTER join SalesLT.CustomerAddress on SalesLt.CustomerAddress.CustomerID = SalesLt.Customer.CustomerID 
where AddressID is null; 
Select SalesLT.Customer.CustomerID, Product.ProductID 
FROM SalesLT.SalesOrderDetail 
right JOIN SalesLT.Product 
ON SalesLT.Product.ProductID=SalesLT.SalesOrderDetail.ProductID
full outer join SalesLT.SalesOrderHeader 
on SalesLT.SalesOrderDetail.SalesOrderID = SalesLT.SalesOrderHeader.SalesOrderID 
full outer join SalesLT.Customer 
on SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID 
where SalesOrderDetail.SalesOrderID is null;
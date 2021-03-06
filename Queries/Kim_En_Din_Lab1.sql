SELECT * FROM Customer;
SELECT Title, FirstName, MiddleName, LastName, Suffix FROM Customer;
SELECT SalesPerson, Title + ' ' + FirstName as CustomerName, Phone FROM Customer;
SELECT CAST (CustomerID as nvarchar) + ': ' + CompanyName as CustomerCompany FROM Customer;
SELECT CAST (SalesOrderNumber as nvarchar) + ' (' + CAST (RevisionNumber as nvarchar) + ')' AS OrderRevision, CAST (OrderDate as date) AS OrderDate FROM SalesOrderHeader;
SELECT FirstName + ' ' + ISNULL (MiddleName, '') + LastName AS CustomerName FROM Customer;
SELECT CustomerID, COALESCE (EmailAddress, Phone) AS PrimaryContact FROM Customer;
SELECT SalesOrderID, 
	CASE ISNULL(ShipDate, 0)
	WHEN 0 THEN 'Awaiting Shipping'
	ELSE 'Shipped'
END AS ShippingStatus FROM SalesOrderHeader;
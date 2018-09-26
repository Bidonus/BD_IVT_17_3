SELECT City, StateProvince FROM SalesLT.Address GROUP BY City, StateProvince;
SELECT TOP 10 PERCENT * FROM SalesLT.Product ORDER BY Weight DESC;
SELECT TOP 100 * FROM (SELECT TOP 110 * FROM SalesLT.Product ORDER BY Weight DESC) AS X ORDER BY Weight;
SELECT Name, color, size from SalesLT.Product where productmodelid = 1;
SELECT productnumber,Name from SalesLT.Product where (Color = 'black' or Color ='red' or Color = 'white') and (Size='S' or Size='M'); 
SELECT productnumber,Name,ListPrice from SalesLT.Product where productnumber like 'BK-%';
SELECT productnumber,Name,ListPrice from SalesLT.Product where productnumber like 'BK-%' and productnumber not like 'BK-R%' and productnumber like '%-__' ;

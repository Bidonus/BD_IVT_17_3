SELECT distinct City, StateProvince FROM SalesLT.Address;
SELECT top 10 PERCENT name FROM Saleslt.Product ORDER BY Weight DESC;
SELECT Name, Weight from Saleslt.Product ORDER BY Weight DESC OFFSET 10 ROWS FETCH NEXT 100 ROWS ONLY;
SELECT Name, Color, Size FROM SalesLT.Product WHERE ProductModelID = 1;
SELECT ProductNumber, Name FROM SalesLT.Product WHERE (Color = 'black' or Color = 'red' or Color = 'white')  AND  (Size = 'S' or Size = 'M');
SELECT ProductNumber, Name, ListPrice FROM SalesLT.Product WHERE ProductNumber LIKE 'BK-%';
SELECT ProductNumber, Name, ListPrice FROM SalesLT.Product WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';

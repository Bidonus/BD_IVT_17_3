SELECT City, StateProvince FROM Address GROUP BY City, StateProvince;

SELECT TOP 10 PERCENT * FROM Product ORDER BY Weight DESC;

SELECT TOP 100 * FROM (SELECT TOP 110 * FROM Product ORDER BY Weight DESC) AS X ORDER BY Weight;

SELECT Name, Color, Size FROM Product WHERE ProductModelID = 1;

SELECT ProductNumber, Name FROM Product WHERE 
    (Color = 'Black' OR Color = 'Red' OR Color = 'White') 
    AND (Size = 'S' OR Size = 'M');
    
SELECT ProductNumber, Name, ListPrice FROM Product WHERE SUBSTRING(ProductNumber, 1, 3) = 'BK-';

SELECT ProductNumber, Name, ListPrice FROM Product WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';

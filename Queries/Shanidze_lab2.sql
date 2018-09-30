select City, StateProvince from SalesLT.Address group by City, StateProvince;

select TOP(10)PERCENT WEIGHT from SalesLT.Product order by Weight DESC;

select TOP 100 * from (select TOP 110 * from SalesLT.Product order by Weight DESC) AS X order by Weight;

select Name, Color, Size from SalesLT.Product where ProductModelID = 1;

select ProductNumber, Name from SalesLT.Product where (Color = 'Red' or Color = 'Black' or Color = 'White') and  (Size = 'S' or Size = 'M');

select ProductNumber, Name, ListPrice from SalesLT.Product where ProductNumber LIKE 'BK-%';

select ProductNumber, Name, ListPrice from SalesLT.Product where ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';
Select distinct City, StateProvince from Address;

select TOP 10 PERCENT Name from Product ORDER BY Weight DESC ;

select Name from Product 
ORDER BY Weight DESC Offset 10 Rows FETCH NEXT 100 rows only;

select Name, Color, Size from Product where ProductModelID = 1;

select Name, ProductNumber
from Product 
where (Color = 'Black' or Color = 'Red' or Color = 'White') and (Size = 'M' or Size = 'S');

select ProductNumber, Name, ListPrice from Product where ProductNumber like 'BK-%';

select ProductNumber, Name, ListPrice from Product 
where ProductNumber like 'BK-[^R]%-__';
/* ____ ЗАДАЧА 1: Получение адресов клиентов */

/* 1. Получите платежные адреса */
select c.CompanyName, a.AddressLine1, a.City, case when b.AddressType LIKE 'Main Office' then 'Billing' else '' end as AddressType
from SalesLT.Address as a left join SalesLT.CustomerAddress as b on a.AddressID = b.AddressID
right join SalesLT.Customer as c on b.CustomerID = c.CustomerID
;

/* 2. Получиет адрес доставки */
select c.CompanyName, a.AddressLine1, a.City, case when b.AddressType LIKE 'Shipping' then 'Shipping' else '' end as AddressType
from SalesLT.Address as a left join SalesLT.CustomerAddress as b on a.AddressID = b.AddressID
right join SalesLT.Customer as c on b.CustomerID = c.CustomerID
order by AddressType desc
;

/* 3. Объедините платежный адрес и адрес доставки */
select distinct c.CompanyName, a.AddressLine1, a.City, 
case when b.AddressType LIKE 'Shipping' then 'Shipping'
when b.AddressType LIKE 'Main Office' then 'Billing' else '' end as AddressType
from SalesLT.Address as a left join SalesLT.CustomerAddress as b on a.AddressID = b.AddressID
right join SalesLT.Customer as c on b.CustomerID = c.CustomerID
order by c.CompanyName, AddressType desc
;

/* ____ ЗАДАЧА 2: Отфильтруйте адреса клиентов */

/* 1. Получите клиентов: имеющих только адрес главного офиса */
select a.CompanyName from SalesLT.Customer as a 
left join SalesLT.CustomerAddress as b on a.CustomerID = b.CustomerID
where b.AddressType LIKE 'Main Office'
;

/* 2. Получите клиентов, имеющих оба типа адреса*/
select a.CompanyName from SalesLT.Customer as a left join SalesLT.CustomerAddress as b on (a.CustomerID = b.CustomerID)  where AddressType LIKE 'Main Office'
INTERSECT 
select a.CompanyName from SalesLT.Customer as a left join SalesLT.CustomerAddress as b on (a.CustomerID = b.CustomerID)  where AddressType LIKE 'Shipping';
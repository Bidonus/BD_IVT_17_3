/* ____ ЗАДАЧА 1: Создание отчетов по счетам */

/* 1. Получите заказы клиентов */
select a.CompanyName, b.SalesOrderID, b.TotalDue 
from SalesLT.Customer as a left join SalesLT.SalesOrderHeader as b
on a.CustomerID = b.CustomerID
order by a.CompanyName
;

/* 2. Получите заказы клиентов с адресами */
select c.CompanyName, d.SalesOrderID, d.TotalDue, a.AddressLine1, a.AddressLine2, a.City, a.StateProvince, a.PostalCode, a.CountryRegion
from SalesLT.Address as a left join SalesLT.CustomerAddress as b on a.AddressID = b.AddressID and b.AddressType LIKE 'Main Office'
right join SalesLT.Customer as c on c.CustomerID = b.CustomerID
right join SalesLT.SalesOrderHeader as d on c.CustomerID = d.CustomerID
order by c.CompanyName
;

/* ____ ЗАДАЧА 2: Получение данных по продажам */

/* 1. Получить список всех клиентов и их заказов */
select a.CompanyName, a.FirstName, a.LastName, b.SalesOrderID, b.TotalDue 
from SalesLT.Customer as a left join SalesLT.SalesOrderHeader as b
on a.CustomerID = b.CustomerID
order by b.SalesOrderID desc
;

/* 2. Получить список клиентов без адреса */
select c.CustomerID, c.CompanyName, c.FirstName, c.LastName, c.Phone 
from SalesLT.Address as a left join SalesLT.CustomerAddress as b on a.AddressID = b.AddressID
right join SalesLT.Customer as c on c.CustomerID = b.CustomerID
where a.AddressID is NULL
;

/* 3. Получить список клиентов без адреса */
select distinct a.CustomerID, d.ProductID
from SalesLT.Customer as a left join SalesLT.SalesOrderHeader as b on a.CustomerID = b.CustomerID
left join SalesLT.SalesOrderDetail as c on c.SalesOrderID = b.SalesOrderID
full outer join SalesLT.Product as d on c.ProductID = d.ProductID
where a.CustomerID is not NULL and d.ProductID is NULL 
or a.CustomerID is NULL and d.ProductID is not NULL
order by d.ProductID
;
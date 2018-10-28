/* ____ ЗАДАЧА 1: Получение информации о ценах и товарах */

/* 1. Получите товары, у которых прейскурантная цена выше средней цены за товар */
select ProductID, Name, ListPrice
from SalesLT.Product
where ListPrice > (select AVG(UnitPrice) [UnitPrice] from SalesLT.SalesOrderDetail)
order by ProductID
;

/* 2. Получите товары с прейскурантной ценой в 100 долларов или более, которые были 
проданы менее чем за 100 долларов */
select distinct a.ProductID, a.Name, a.ListPrice
from SalesLT.Product as a join SalesLT.SalesOrderDetail as b on a.ProductID = b.ProductID
where ListPrice >= 100 and b.UnitPrice < 100
order by ProductID
;

/* 3. Получите себестоимость, прейскурантную цену и среднюю цену продажи для каждого товара */
select ProductID, Name, StandardCost, ListPrice, 
(select avg(UnitPrice) from SalesLT.SalesOrderDetail a where a.ProductID = SalesLT.Product.ProductID group by a.ProductID) as AvgSellingPrice
from SalesLT.Product
order by ProductID
;

/* 4. Поулчите товары у которых средняя цена продажи ниже себестоимости */
select ProductID, Name, StandardCost, ListPrice, 
(select avg(UnitPrice) from SalesLT.SalesOrderDetail a where a.ProductID = SalesLT.Product.ProductID group by a.ProductID) as AvgSellingPrice
from SalesLT.Product
where StandardCost > (select avg(UnitPrice) from SalesLT.SalesOrderDetail a where a.ProductID = SalesLT.Product.ProductID group by a.ProductID)
order by ProductID
;

/* ____ ЗАДАЧА 2: Полученте информации о клиенте */

/* 1. Получите информацию о клиентах для всех заказов */
select a.SalesOrderID, b.CustomerID, b.FirstName, b.LastName, a.TotalDue
from SalesLT.SalesOrderHeader a
cross apply dbo.ufnGetCustomerInformation(CustomerID) b
order by a.SalesOrderID
;

/* 2. Получите информацию об адресе клиента */
select b.CustomerID, c.FirstName, c.LastName, a.AddressLine1, a.City from SalesLT.Address a
join SalesLT.CustomerAddress b 
on a.AddressID = b.AddressID
cross apply dbo.ufnGetCustomerInformation(b.CustomerID) c
;



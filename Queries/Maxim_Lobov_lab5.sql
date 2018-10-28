/* ____ ЗАДАЧА 1: Получение информации о товарах */

/* 1. Получите наименование и приблизителный вес каждого товара */
select ProductID, upper(name) as ProductName, ROUND(Weight,0) as ApproxWeight 
from SalesLT.Product
;

/* 2. Получите год и месяц, когда товары были впервые проданы */
select ProductID, upper(name) as ProductName, ROUND(Weight,0) as ApproxWeight,
 YEAR(SellStartDate) as SellStartYear, DATENAME(month, SellStartDate) as SellStartMonth
from SalesLT.Product
;

/* 3. Получите типы товаров из номеров товаров */
select * from SalesLT.Product;
select ProductID, upper(name) as ProductName, ROUND(Weight,0) as ApproxWeight,
 YEAR(SellStartDate) as SellStartYear, DATENAME(month, SellStartDate) as SellStartMonth,
 left(ProductNumber,2) as ProductType
from SalesLT.Product
;

/* 4. Получите только товары, имеющие числовой размер */
select ProductID, upper(name) as ProductName, ROUND(Weight,0) as ApproxWeight,
 YEAR(SellStartDate) as SellStartYear, DATENAME(month, SellStartDate) as SellStartMonth,
 left(ProductNumber,2) as ProductType
from SalesLT.Product
where ISNUMERIC(Size) = 1
;

/* ____ ЗАДАЧА 2: Ранжирование клиентов по доходу */

/* 1. Получите компании, отранжированные по суммом продаж */
select a.CompanyName, b.TotalDue [Revenue],
rank() over(order by b.TotalDue desc) [RankByRevenue]
from SalesLT.Customer as a join SalesLT.SalesOrderHeader as b on a.CustomerID = b.CustomerID
;

/* ____ ЗАДАЧА 3: Агрегирование данных по продажам товаров */

/* 1. Получите общий объем продаж по товару */
select a.Name, SUM(b.LineTotal) TotalRevenue
from SalesLT.Product as a join SalesLT.SalesOrderDetail as b on a.ProductID = b.ProductID
group by a.Name
order by TotalRevenue desc
;

/* 2. Отфильтруйте список продаж товаров, включив в него только те товары, стоимость которых превышает $1000 */
select a.Name, SUM(b.LineTotal) TotalRevenue
from SalesLT.Product as a join SalesLT.SalesOrderDetail as b on a.ProductID = b.ProductID
where b.UnitPrice > 1000
group by a.Name
order by TotalRevenue desc
;

/* 3. Отфильтруйте группы продаж товаров так: чтобы включить только те их них, общий объем продаж которых превышает $20000 */
select a.Name, SUM(b.LineTotal) TotalRevenue
from SalesLT.Product as a join SalesLT.SalesOrderDetail as b on a.ProductID = b.ProductID
where b.UnitPrice > 1000
group by a.Name HAVING SUM(b.LineTotal) > 20000
order by TotalRevenue desc
;


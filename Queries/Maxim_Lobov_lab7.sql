/* ____ ЗАДАЧА 1: Получение данных о товаре */

/* 1. Получите описания модели товара */
select a.ProductID, a.Name [ProductName], a.ProductModelID [ProductModel], b.Summary
from SalesLT.Product [a] join SalesLT.vProductModelCatalogDescription [b] on a.ProductModelID = b.ProductModelID
order by a.ProductID
;

/* 2. Создайте таблицу с уникальными цветами */
DECLARE @Colors AS TABLE (Color varchar(15))
INSERT INTO @Colors
SELECT DISTINCT Color FROM SalesLT.Product where Color is not NULL
SELECT b.ProductID, b.Name [ProductName], b.Color
FROM @Colors as a right join SalesLT.Product as b on a.Color = b.Color
where b.Color in (select * from @Colors)
order by b.Color
;

/* 3. Создайте таблицу с уникальными размерами */
SELECT b.ProductID, b.Name [ProductName], b.Size
FROM #Size as a right join SalesLT.Product as b on a.Size = b.Size
where b.Size in (select * from #Size)
order by b.Size desc
;

/* 4. Получите родительские категории товаров */
select a.ProductID, a.Name [ProductName], b.ParentProductCategoryName [ParentCategory], b.ProductCategoryName [Category]
from SalesLT.Product a
join dbo.ufnGetAllCategories() b on a.ProductCategoryID = b.ProductCategoryID
order by Category, ParentCategory, a.Name
;

/* ____ ЗАДАЧА 2: Получение информации по доходам от продаж клиентам */

/* 1. Получите доходы от продаж по клиентам и контактные данные (используйте производные таблицы) */
SELECT CompanyContact, Revenue
FROM 
(SELECT CompanyContact = a.CompanyName + ' (' + a.FirstName + ' ' + a.LastName + ')', b.TotalDue as Revenue
	FROM SalesLT.Customer as a
	JOIN SalesLT.SalesOrderHeader as b
	ON a.CustomerID = b.CustomerID) as r
ORDER BY CompanyContact;

/* 2. Получите доходы от продаж по клиентам и контактные данные (используйте CTE - обобщенные табличные выражения) */
WITH r (CompanyContact, Revenue) AS
(SELECT CompanyContact = a.CompanyName + ' (' + a.FirstName + ' ' + a.LastName + ')', b.TotalDue as Revenue
	FROM SalesLT.Customer as a
	JOIN SalesLT.SalesOrderHeader as b
	ON a.CustomerID = b.CustomerID)
SELECT CompanyContact, Revenue FROM r
ORDER BY CompanyContact
;



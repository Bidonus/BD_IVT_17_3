SELECT * From SalesLT.Product
SELECT * From SalesLT.Customer
SELECT * From SalesLT.SalesOrderHeader

SELECT ProductID, p.Name as ProductName, v.Name as ProductModel, Summary  
From SalesLT.Product as p JOIN SalesLT.vProductModelCatalogDescription as v 
ON p.ProductModelID = v.ProductModelID ORDER BY p.ProductID;

DECLARE @Colors AS TABLE (Color varchar(15));
INSERT INTO @Colors
SELECT DISTINCT Color FROM SalesLT.Product;
SELECT ProductID, Name as ProductName, Color FROM SalesLT.Product as p Where p.Color in (SELECT * FROM @Colors);

CREATE TABLE #Size
(Size varchar(15));
INSERT INTO #Size
SELECT DISTINCT Size FROM SalesLT.Product;
SELECT ProductID, Name as ProductName, Size FROM SalesLT.Product Where Size in (SELECT * FROM #Size) Order by size desc;

SELECT ProductID, Name as ProductName, ParentProductCategoryName as ParentCategory, ProductCategoryName as Category 
FROM dbo.ufnGetAllCategories() as f JOIN
SalesLT.Product as p on f.ProductCategoryID = p.ProductCategoryID;

SELECT (CompanyName + ' (' + FirstName + ' ' + LastName + ')') as CompanyProduct, TotalDue as Revenue
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS hON h.CustomerID = c.CustomerIDWITH Categories (CompanyProduct, Revenue)
AS
(
SELECT (CompanyName + ' (' + FirstName + ' ' + LastName + ')') as CompanyProduct, TotalDue as Revenue
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS hON h.CustomerID = c.CustomerID
)
SELECT * FROM Categories
ORDER BY CompanyProduct;
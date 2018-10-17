select ProductID, UPPER(Name) as ProductName, ROUND(Weight, 0) as ApproxWeight from SalesLT.Product;

select  ProductID, UPPER(Name) as ProductName, ROUND(Weight, 0) as ApproxWeight, YEAR(SellStartDate) as SellStartYear, DATENAME(MONTH, SellStartDate) as SellStartMonth from SalesLT.Product;

select  ProductID, UPPER(Name) as ProductName, ROUND(Weight, 0) as ApproxWeight, YEAR(SellStartDate) as SellStartYear, DATENAME(MONTH, SellStartDate) as SellStartMonth, LEFT(ProductNumber, 2) as ProductType from SalesLT.Product;

select  ProductID, UPPER(Name) as ProductName, ROUND(Weight, 0) as ApproxWeight, YEAR(SellStartDate) as SellStartYear, DATENAME(MONTH, SellStartDate) as SellStartMonth, LEFT(ProductNumber, 2) as ProductType from SalesLT.Product where Size LIKE '[1-9][0-9]';


select CompanyName, TotalDue as Revenue, RANK () OVER (ORDER BY TotalDue DESC) as RankByRevenue from SalesLT.SalesOrderHeader JOIN SalesLT.Customer on (SalesLT.SalesOrderHeader.CustomerID = SalesLT.Customer.CustomerID);


select Name, SUM(LineTotal) as TotalRevenue from SalesLT.SalesOrderDetail JOIN SalesLT.Product on (SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID) group by Name order by SUM(LineTotal) DESC;

select Name, SUM(LineTotal) as TotalRevenue from SalesLT.SalesOrderDetail JOIN SalesLT.Product on (SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID) where LineTotal > 1000 group by Name order by SUM(LineTotal) DESC;

select Name, SUM(LineTotal) as TotalRevenue from SalesLT.SalesOrderDetail JOIN SalesLT.Product on (SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID)  group by Name HAVING SUM(LineTotal) > 20000 order by SUM(LineTotal) DESC;




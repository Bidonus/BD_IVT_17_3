select ProductID, UPPER(Name) as ProductName, ROUND(Weight, 0) as ApproxWeight from AdventureWorksLT.SalesLT.Product;

select  ProductID, UPPER(Name) as ProductName, ROUND(Weight, 0) as ApproxWeight, YEAR(SellStartDate) as SellStartYear, DATENAME(MONTH, SellStartDate) as SellStartMonth from AdventureWorksLT.SalesLT.Product;

select  ProductID, UPPER(Name) as ProductName, ROUND(Weight, 0) as ApproxWeight, YEAR(SellStartDate) as SellStartYear, DATENAME(MONTH, SellStartDate) as SellStartMonth, LEFT(ProductNumber, 2) as ProductType from AdventureWorksLT.SalesLT.Product;

select  ProductID, UPPER(Name) as ProductName, ROUND(Weight, 0) as ApproxWeight, YEAR(SellStartDate) as SellStartYear, DATENAME(MONTH, SellStartDate) as SellStartMonth, LEFT(ProductNumber, 2) as ProductType from AdventureWorksLT.SalesLT.Product where Size LIKE '[1-9][0-9]';


select CompanyName, TotalDue as Revenue, RANK () OVER (ORDER BY TotalDue DESC) as RankByRevenue from AdventureWorksLT.SalesLT.SalesOrderHeader JOIN AdventureWorksLT.SalesLT.Customer on (AdventureWorksLT.SalesLT.SalesOrderHeader.CustomerID = AdventureWorksLT.SalesLT.Customer.CustomerID);


select Name, SUM(LineTotal) as TotalRevenue from AdventureWorksLT.SalesLT.SalesOrderDetail JOIN AdventureWorksLT.SalesLT.Product on (AdventureWorksLT.SalesLT.SalesOrderDetail.ProductID = AdventureWorksLT.SalesLT.Product.ProductID) group by Name order by SUM(LineTotal) DESC;

select Name, SUM(LineTotal) as TotalRevenue from AdventureWorksLT.SalesLT.SalesOrderDetail JOIN AdventureWorksLT.SalesLT.Product on (AdventureWorksLT.SalesLT.SalesOrderDetail.ProductID = AdventureWorksLT.SalesLT.Product.ProductID) where LineTotal > 1000 group by Name order by SUM(LineTotal) DESC;

select Name, SUM(LineTotal) as TotalRevenue from AdventureWorksLT.SalesLT.SalesOrderDetail JOIN AdventureWorksLT.SalesLT.Product on (AdventureWorksLT.SalesLT.SalesOrderDetail.ProductID = AdventureWorksLT.SalesLT.Product.ProductID)  group by Name HAVING SUM(LineTotal) > 20000 order by SUM(LineTotal) DESC;




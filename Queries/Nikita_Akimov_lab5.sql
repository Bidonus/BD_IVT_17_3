select ProductID,
UPPER(name) as ProductName,
Round(Weight,0) as ApproxWeight
from SalesLT.Product;

select ProductID,
UPPER(name) as ProductName,
Round(Weight,0) as ApproxWeight,
Datename(mm,SellstartDate) as SellStartMonth,
DateName(yyyy,SellstartDate) as SellStartYear
from SalesLT.Product;

select ProductID,
UPPER(name) as ProductName,
Round(Weight,0) as ApproxWeight,
Substring(ProductNumber,0,3) as ProductType,
Datename(mm,SellstartDate) as SellStartMonth,
DateName(yyyy,SellstartDate) as SellStartYear
from SalesLT.Product;
select ProductID,
UPPER(name) as ProductName,
Round(Weight,0) as ApproxWeight,
Substring(ProductNumber,0,3) as ProductType,
Datename(mm,SellstartDate) as SellStartMonth,
DateName(yyyy,SellstartDate) as SellStartYear
from SalesLT.Product where Weight is not null;
select CompanyName,
TotalDue as Revenue,
Rank() OVER(Order by TotalDue DESC) RankByRevenue
from SalesLT.Customer
right join  SalesLT.SalesOrderHeader on SalesLt.Customer.CustomerId = SalesLT.SalesOrderHeader.CustomerId;
select SalesLT.Product.Name ,
Sum(LineTotal) as TotalRevenue
from SalesLT.Product
right join  SalesLT.SalesOrderDetail on SalesLt.SalesOrderDetail.ProductID = SalesLT.Product.ProductID
group by name
order by TotalRevenue DESC;
select SalesLT.Product.Name ,
Sum(LineTotal) as TotalRevenue
from SalesLT.Product
right join  SalesLT.SalesOrderDetail on SalesLt.SalesOrderDetail.ProductID = SalesLT.Product.ProductID
where ListPrice > 1000
group by name
order by TotalRevenue DESC;
select SalesLT.Product.Name ,
Sum(LineTotal) as TotalRevenue
from SalesLT.Product
right join  SalesLT.SalesOrderDetail on SalesLt.SalesOrderDetail.ProductID = SalesLT.Product.ProductID
group by name
HAVING Sum(LineTotal) > 20000
order by TotalRevenue DESC;
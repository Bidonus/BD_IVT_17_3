select * from AdventureWorksLT.SalesLT.Customer;

select Title, FirstName, MiddleName, LastName, Suffix from AdventureWorksLT.SalesLT.Customer;

select SalesPerson, (Title +' '+ LastName) as CustomerName, Phone from AdventureWorksLT.SalesLT.Customer;
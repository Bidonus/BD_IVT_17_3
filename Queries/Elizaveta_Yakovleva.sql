select * from Customer;

select Title, FirstName, MiddleName, LastName, Suffix from Customer;

select SalesPerson, (Title +' '+ LastName) as CustomerName, Phone from Customer;
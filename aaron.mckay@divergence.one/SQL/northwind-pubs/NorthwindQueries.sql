-- This query is using the Northwind sample database provided by microsoft.
-- It is connected to localhost: CARGOSTUD2/aaron. Database name NORTHWIND.
-- The SQL server extention for VS Code is installed and is used to make the 
-- connection to the localhost database and run the query practice challenges.

-- The following queries are taken from the book 
-- "SQL Practice Problems. 57 beginning, Intermediate, and Advanced Challenges"


-- 1. Which Shippers do we have?
select * 
from Shippers;

-- 2. Select Certain Fields from Categories
select CategoryName, Description 
from Categories;

-- 3. Sales Representatives 
select FirstName, LastName, HireDate 
from Employees 
where Title = 'Sales Representative';

-- 4. Sales Representatives from the USA
select FirstName, LastName, HireDate 
from Employees 
where Title = 'Sales Representative' and Country = 'USA';

-- 5. Orders placed by specific EmployeeID
select OrderID, OrderDate 
from Orders 
where EmployeeID = '5';

-- 6. Suppliers and ContactTitles
select SupplierID, ContactName, ContactTitle 
from Suppliers 
where ContactTitle <> 'Marketing Manager';

-- 7. Products with "queso" in ProductName
select ProductID, ProductName 
from Products 
where ProductName like '%queso%';

-- 8. Orders shipping to France or Belgium
select OrderID, CustomerID, ShipCountry 
from Orders 
where ShipCountry = 'France' OR ShipCountry = 'Belgium';
--
select OrderID, CustomerID, ShipCountry 
from Orders 
where ShipCountry IN ('France', 'Belgium');
-- Two different ways are shown that give the same result. Use either the 'IN' comparitor or the 'OR' comparitor

-- 9. Orders shipping to any country in Latin America
select OrderID, CustomerID, ShipCountry 
from Orders 
where ShipCountry IN ('Brazil', 'Mexico', 'Argentina', 'Venezuela'); 

-- 10. Employees, in order of age with age ascending
select firstname, lastname, title, birthdate 
from Employees 
order by birthdate ASC;  

-- 11. Showing only the Date with a DateTime field
select LastName, FirstName, Title, Convert (Date, BirthDate) As BirthDate
from Employees;

-- 12. Employee's Full Name
SELECT FirstName, LastName, CONCAT (FirstName, ' ', LastName) AS FullName
From Employees;

-- 13. OrderDetails amount per line item
Select OrderID, ProductID, UnitPrice, Quantity, UnitPrice * Quantity As TotalPrice
From [Order Details]
Order By OrderID, ProductID;

-- 14. How Many Customers?
SELECT Count(*) AS TotalCustomers From Customers;

-- 15. When was the first order?
SELECT min(orderdate) as FirstOrder 
From Orders;

-- 16. Countries Where there are customers
select Country 
from customers
group by Country; 

-- 17. Contact titles for customers
SELECT ContactTitle, Count(contacttitle) as TotalContactTitle
from Customers
Group by ContactTitle

-- 18. Products with associated supplier names
select ProductID, ProductName, CompanyName
From Products
JOIN suppliers on products.supplierid = suppliers.SupplierID;

-- 19. Orders and Shippers that was used
SELECT OrderID, convert (date, OrderDate) AS OrderDate, CompanyName as Shipper
FROM Orders
JOIN shippers on orders.shipvia = shippers.ShipperID
Where orderid < 10270
Order by OrderID

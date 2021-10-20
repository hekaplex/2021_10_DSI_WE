-- This query is using the Northwind sample database provided by microsoft.  It is connected to localhost. Database name NORTHWIND. The SQL server extention is installed in VS Code



-- 1. Which Shippers do we have?
select * from Shippers;

-- 2. Select Certain Fields from Categories
select CategoryName,Description from Categories;

-- 3. Sales Representatives 
select FirstName, LastName, HireDate from Employees where Title = 'Sales Representative';

-- 4. Sales Representatives from the USA
select FirstName, LastName, HireDate from Employees where Title = 'Sales Representative' and Country = 'USA';

-- 5. Orders placed by specific EmployeeID
select OrderID, OrderDate from Orders where EmployeeID = '5';

-- 6. Suppliers and ContactTitles
select SupplierID, ContactName, ContactTitle from Suppliers where ContactTitle <> 'Marketing Manager';

-- 7. Products with "queso" in ProductName
select ProductID, ProductName from Products where ProductName like '%queso%';

-- 8. Orders shipping to France or Belgium
select OrderID, CustomerID, ShipCountry from Orders where ShipCountry = 'France' OR ShipCountry = 'Belgium';
select OrderID, CustomerID, ShipCountry from Orders where ShipCountry IN ('France', 'Belgium');
-- Two different ways are shown that give the same result. Use either the 'IN' comparitor or the 'OR' comparitor

-- 9. Orders shipping to any country in Latin America
select OrderID, CustomerID, ShipCountry from Orders where ShipCountry IN ('Brazil', 'Mexico', 'Argentina', 'Venezuela'); 

-- 10. Employees, in order of age with age ascending
select firstname, lastname, title, birthdate from Employees order by birthdate ASC;  

-- 11. 
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


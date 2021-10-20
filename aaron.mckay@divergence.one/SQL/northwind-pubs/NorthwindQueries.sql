-- 1. Which Shippers do we have?
select * from Shippers;

-- 2. Select Certain Fields from Categories
select CategoryName,Description from Categories;

-- 3. Sales Representatives 
select FirstName, LastName, HireDate from Employees where Title = 'Sales Representative';

-- 4. Sales Representatives from the US
select FirstName, LastName, HireDate from Employees where Title = 'Sales Representative' and Country = 'USA';

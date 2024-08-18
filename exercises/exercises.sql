-- List the customers in the United States with a credit limit higher than \$1000.
SELECT customerName from Customers where country = 'USA' and creditLimit > 1000;

-- List the employee codes for sales representatives of customers in Spain, France and Italy. Make another query to list the names and email addresses of those employees.

-- Change the job title "Sales Rep" to "Sales Representative"
Update Employees Set jobTitle = 'Sales Representative' where jobTitle = 'Sales Rep';

-- Delete the entries for Sales Representatives working in London.
-- Select Employees.firstName, Employees.jobTitle, Employees.officeCode, Offices.city FROM Employees JOIN Offices ON Employees.officeCode = Offices.officeCode;
-- Select Employees.firstName, Employees.jobTitle, Employees.officeCode, Offices.city FROM Employees JOIN Offices ON Employees.officeCode = Offices.officeCode WHERE Offices.city = 'London';

-- Show a list of employees who are not sales representatives
SELECT * FROM Employees WHERE jobTitle != 'Sales Representative';

-- Show a list of customers with "Toys" in their name
SELECT * FROM Customers WHERE customerName LIKE '%Toys%';


-- List the 5 most expensive products from the "Planes" product line
SELECT productName FROM Products WHERE productLine = 'Planes' ORDER BY buyPrice DESC LIMIT 5;

-- Identify the products that are about to run out of stock (quantity in stock < 100)
SELECT productName, quantityInStock FROM Products WHERE quantityInStock < 100;

-- List 10 products in the "Motorcycles" category with the lowest buy price and more than 1000 units in stock
SELECT productName, buyPrice FROM Products WHERE productLine = 'Motorcycles' AND quantityInStock > 1000  ORDER BY buyPrice LIMIT 10;
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

-- Report the total number of payments received before October 28, 2004.
SELECT COUNT(*) FROM Payments WHERE paymentDate < '2004-10-28';

-- Report the number of customer who have made payments before October 28, 2004.
SELECT COUNT(DISTINCT customerNumber) FROM Payments WHERE paymentDate < '2004-10-28';
SELECT DISTINCT customerNumber FROM Payments WHERE paymentDate < '2004-10-28';

--  Retrieve the details all customers who have made a payment before October 28, 2004.
SELECT * from Customers WHERE customerNumber IN (SELECT DISTINCT customerNumber FROM Payments WHERE paymentDate < '2004-10-28');

--  Retrieve details of all the customers in the United States who have made payments between April 1st 2003 and March 31st 2004.
SELECT * FROM Customers WHERE country = 'USA' AND customerNumber IN (SELECT DISTINCT customerNumber FROM Payments WHERE paymentDate 
BETWEEN '2003-4-1' AND '2004-3-31');

-- SELECT * FROM Customers JOIN Payments ON Customers.customerNumber = Payments.customerNumber WHERE Customers.country = 'USA' AND Payments.paymentDate BETWEEN '2003-4-1' AND '2004-3-31';

-- Find the total number of payments made each customer before October 28, 2004.
 SELECT customerNumber, Count(*) as totalPayments FROM Payments WHERE paymentDate < '2004-10-28' GROUP BY customerNumber;

--   Find the total amount paid by each customer payment before October 28, 2004.
SELECT customerNumber, SUM(amount) as totalPayments FROM Payments WHERE paymentDate < '2004-10-28' GROUP BY customerNumber; 

-- Determine the total number of units sold for each product
SELECT productCode, SUM(quantityOrdered) as totalUnitsSold from OrderDetails GROUP BY productCode;

-- Find the total no. of payments and total payment amount for each customer for payments made before October 28, 2004.
SELECT customerNumber, COUNT(*) as totalNumPayments, SUM(amount) as totalPaymentAmount FROM Payments WHERE paymentDate < '2004-10-28' GROUP BY customerNumber;

-- Modify the above query to also show the minimum, maximum and average payment value for each customer
SELECT customerNumber, MIN(amount) as minPayment, MAX(amount) as maxPayment, AVG(amount) as avgPayment FROM Payments GROUP BY customerNumber;

-- Retrieve the customer number for 10 customers who made the highest total payment in 2004.
SELECT customerNumber, SUM(amount) as totalPayments FROM Payments WHERE paymentDate < '2004-10-28' GROUP BY customerNumber ORDER BY totalPayments DESC LIMIT 10;
-- Retrieve the customer number for next 10 customers who made the highest total payment in 2004.
SELECT customerNumber, SUM(amount) as totalPayments FROM Payments WHERE paymentDate < '2004-10-28' GROUP BY customerNumber ORDER BY totalPayments DESC LIMIT 10 OFFSET 10;

-- Display the full name of point of contact each customer in the United States in upper case, along with their phone number, sorted by alphabetical order of customer name.
SELECT customerName, CONCAT(UCASE(contactFirstName),' ', UCASE(contactLastName)) as contact, phone from Customers WHERE country='USA' ORDER BY customerName;

-- Display a paginated list of customers (sorted by customer name), with a country code column. The country is simply the first 3 letters in the country name, in lower case.
SELECT customerName, LCASE(SUBSTR(country, 1, 3)) as countryCode FROM Customers ORDER BY
 customerName LIMIT 10;

-- Display the list of the 5 most expensive products in the "Motorcycles" product line with their price (MSRP) rounded to dollars.
SELECT productName, ROUND(MSRP) AS salesPrice FROM Products WHERE productLine = 'Motorcycles' ORDER BY salesPrice DESC LIMIT 5;

-- Display the product code, product name, buy price, sale price and profit margin percentage ((MSRP - buyPrice)*100/buyPrice) for the 10 products with the highest profit margin. Round the profit margin to 2 decimals.
SELECT productCode, productName, buyPrice, MSRP, ROUND(((MSRP - buyPrice) * 100/buyPrice), 2) as profitMargins FROM Products ORDER BY profitMargins DESC LIMIT 10;
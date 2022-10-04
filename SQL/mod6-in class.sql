--Calculate average payment by each customer
--Show customer number and average amount
SELECT customerNumber, AVG(amount)
FROM payments
GROUP BY customerNumber;

--Same as above but return customer name and number
--Round the average to two decimals
SELECT p.customerNumber, c.customerName AS "Name", ROUND(AVG(amount),2) AS "Average Payment"
FROM payments p, customers c
WHERE p.customerNumber=c.customerNumber
GROUP BY p.customerNumber;

--Calculate the number of payments made by customers who made payments
--Show num paments and 
SELECT customerNumber, COUNT(amount) AS "NUmber of Payments"
FROM  payments
GROUP BY customerNumber;

--Caluculate number of customers employee has
--Display employee first name, last name, and number of customers
--Display in descending order based on number of customers
SELECT e.firstName, e.lastName, COUNT(c.salesRepEmployeeNumber) AS "Number of Customers"
FROM employees e, customers c 
WHERE e.employeeNumber=c.salesRepEmployeeNumber
GROUP BY c.salesRepEmployeeNumber
ORDER BY COUNT(c.salesRepEmployeeNumber) DESC;

--Calculate total charge for reach order
--Display charge for top ten most exspensive orders in descending order
--Display order number and total charge
--Display order number and total charge
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS "Total Charge"
FROM orderdetails
GROUP By orderNumber
ORDER BY SUM(quantityOrdered * priceEach) DESC
LIMIT 10;
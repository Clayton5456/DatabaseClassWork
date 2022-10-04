--Calculate the number of orders for each product that has been ordered. 
--Display the product name and number of orders in a column called 
--“Number of Orders”. Display the results in descending order based on 
--“Number of Orders”. Note: You are calculating the number of orders and 
--not quantity ordered. For example, if Alice orders 3 pizzas today and 
--5 pizzas next week then pizza orders equals 2 and the quantity of pizzas 
--ordered equals 8. 
--109 rows returned.
SELECT p.productName, COUNT(o.orderNumber) AS "Number of Orders"
FROM products p, orderdetails o
WHERE p.productCode=o.productCode
GROUP BY p.productCode;

--Calculate the total number of each product that has been ordered. 
--Display the product name and quantity ordered in a column called 
--“Quantity Ordered”. Display the results in descending order based on 
--Quantity Ordered. 
--109 rows returned.
SELECT p.productName, SUM(o.quantityOrdered) AS "Quantity Ordered"
FROM products p, orderdetails o
WHERE p.productCode=o.productCode
GROUP BY p.productCode;

--Calculate the total dollar value of the top 25 products that has been 
--ordered in the database. Display the product name and the dollar value 
--in a column called “Total Value”.
SELECT p.productName, SUM(o.quantityOrdered *o.priceEach) AS "Total Value"
FROM products p, orderdetails o
WHERE p.productCode=o.productCode
GROUP BY p.productCode
ORDER BY SUM(o.quantityOrdered *o.priceEach) DESC
LIMIT 25;

--Calculate the number of orders each customer has placed and display the 
--top 25 in descending order based on orders placed. Display the customer name 
--and the orders placed in a columns called “Orders Placed”
SELECT c.customerName, COUNT(o.customerNumber) AS "Orders Placed"
FROM customers c, orders o
WHERE c.customerNumber=o.customerNumber
GROUP BY o.customerNumber
ORDER BY COUNT(o.customerNumber) DESC
LIMIT 25;

--Calculate the total payments made each year. Display the year and total 
--payments in a column called “Total Payments”. Note: you will have to use 
--the YEAR() function to get the year portion of the payment date
SELECT SUM(amount) AS "Total Payments", YEAR(paymentDate) AS "Year"
FROM payments
GROUP BY YEAR(paymentDate);

--Calculate the total payments made each month in 2004. 
--Display the month and total payments in a column called “Total Payments”. 
--Order the results by month in ascending order. Note: you will have to use 
--the MONTH() and YEAR() functions.
SELECT SUM(amount) AS "Total Payments", MONTH(paymentDate) AS "Month"
FROM payments
WHERE YEAR(paymentDate)=2004
GROUP BY MONTH(paymentDate)
ORDER BY MONTH(paymentDate) ASC;

--Calculate the total payments made each day in December of 2004. 
--Display the day in a column named “Day” and total payments in a 
--column called “Total Payments”. Order the results by day in ascending order.
-- Note: you will have to use the MONTH(), DAY(), and YEAR() functions.
SELECT SUM(amount) AS "Total Payments", DAY(paymentDate) AS "Day"
FROM payments
WHERE  MONTH(paymentDate)=12 AND YEAR(paymentDate)=2004
GROUP BY DAY(paymentDate)
ORDER BY DAY(paymentDate) ASC;

--Calculate the total payments made by each customer in the database who 
--has made a payment. Display the customer name and the total payments in a 
--column named “Total Payments”. Order the results by total payments. 
--98 rows returned. The results below show the first 5 and last 5 results.
SELECT c.customerName, SUM(p.amount) AS "Total payments"
FROM customers c, payments p
WHERE c.customerNumber=p.customerNumber 
GROUP BY p.customerNumber
ORDER BY SUM(p.amount) DESC;

--Calculate and display the number of customers in each state. 
--Display the state name and and number of customers in each state in a column
-- called “Number of Customers in State”. Sort the results by the 
--Number of Customers in State.

--It seems like there's more than zero that have the a null state, I'm not sure what to do about it
SELECT COUNT(customerNumber) AS "Number of Customers in State", c.state 
FROM customers c
WHERE c.state IS NOT NULL
GROUP BY c.state
ORDER BY COUNT(customerNumber)  DESC;

--Which employees manage the most people? Develop a query to calculate the 
--number of people each employees manages. Display the employee number and 
--number of employees employees they manage in a column called 
--“Number of Reports”. 
--Hint: we know an employee manages another employee if 
--their employee number appears in the reportsTo column in the employee table.
SELECT reportsTo, COUNT(reportsTo) AS "Number of Reports"
FROM employees
GROUP BY reportsTo;

--Write a query to calculate the number of product lines in the database. 
--Display the result in a column called “Number of Lines”.
SELECT COUNT(*) as "Number of Product Lines"
FROM (SELECT COUNT(productLine), productLine
    FROM products
    GROUP BY productLine) products;

--Calculate the dollar value of each product in inventory. 
--You can calculate this by multiplying the quantity in stock by 
--the buy price. Display the product name, quantity in stock, buy price, 
--and in its dollar value in a column called “Dollar Value”. Sort the results 
--in descending order based on dollar value. 110 rows returned. 
--The results below show the first 5 and last 5 results.

SELECT productName,quantityInStock, buyPrice, SUM(buyPrice*quantityInStock) AS "Dollar Value"
FROM products
GROUP BY productCode
ORDER BY SUM(buyPrice*quantityInStock) DESC;

--
 



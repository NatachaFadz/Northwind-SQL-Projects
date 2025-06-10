use northwind;

-- Customer table
SELECT * from customers;

select customername, city, country
from customers;

-- Product Information
select productid, productname
from products;

select firstname, lastname, birthdate
from employees;

select customername, address, city
from customers;

-- Shows all the countries available
select country
from customers;

-- Distinct (different countries only once)
select DISTINCT country
from customers;

-- Count function will count the number of countries
select count(distinct country)
from customers;

select distinct city
from suppliers;

select count(distinct city)
from customers;

-- WHERE Clause
select*
from customers
where country='Mexico';
-- value from the table must be in " " or ' '

select*
from products
where productid=1;
-- if value is numeric, no need for quotations

select* from customers
where city='London';

select count(*)
from customers
where country='USA';

-- Product with price higher than 100
select* 
from products
where price > 100;

-- Write SQL query to return Customers with their customerid is equal to and greater than 15.
select*
from customers
where customerid >= 15;

-- Write SQL query to return order details where order quantity is less than 3.
select *
from order_details
where quantity < 3;

-- Write SQL query to find details of employees who were born after 1960-01-01.
select*
from employees
where birthdate > '1960-01-01'; 
-- all date values require quotations
------------------------------------------
-- AND, OR and NOT Operators
-- AND operator requires both conditions to be met
select*
from customers
where country='Germany' and city='Berlin';

select*
from suppliers
where country='Japan' and city='Tokyo';

-- Write SQL query to find customer from UK and London.
select*
from customers
where country='UK' and city='London';

-- Write SQL query to find customer from UK and US.
select*
from customers
where country= 'UK' or country='USA';

-- Write SQL query to find products with price is less than 5 and productid more than 10.
select*
from products
where price <5 and productid>10;

-------------------------------
-- OR Examples. OR operators returns result if either of the condition is true.

select*
from customers
where city='berlin' or city='stuttgart';

SELECT * 
FROM Customers
WHERE Country = 'Germany' OR Country = 'Spain';

-- Write SQL query to find customers from Portland or Kirkland.
select*
from customers
where city='portland' or city='kirkland';

-- Write SQL query to find orders before 1996-08-27 or after 1997-02-21.
SELECT * 
FROM ORDERS 
WHERE ORDERDATE < "1996-08-27" OR ORDERDATE > "1997-02-21";

----------------------------------------
-- ORDER BY Keyword (sorting results)
select* from customers
order by country;

-- Write SQL query to return product names and order by Price.
select productname from products
order by price;

-- Order by desc
SELECT ProductName, Price FROM Products
ORDER BY Price DESC;

---- ORDER BY several columns
select* from customers
order by country, customername;
-- first returns results by country then customername

-- Order of writing column name is important
select* from customers
order by customername, country;

-- Write SQL query to sort employess by lastname and birthdate in decreasing order.
select* from employees
order by lastname desc, birthdate desc;

-- Write an SQL query to retrieve all columns from the Customers table for customers located in the USA and sort them by CustomerName in ascending order.
SELECT * FROM Customers
where country = 'usa' 
order by customername;

------------------------
# LIMIT Clause (is used to specify the number of results to return)
select* from customers
limit 4;

-- Top 5 Cheapest products
SELECT * FROM Products
ORDER BY PRICE 
LIMIT 5;

---------------
# ADD a WHERE Clause
SELECT * FROM Customers
WHERE Country='Germany'
LIMIT 3;

SELECT * FROM Products
WHERE CategoryID=1
LIMIT 3;

-- 1)Write an SQL query to get the top 10 products from the Products table with a Price greater than 20, limiting the result to 10 rows.
select* from products
where price >20
limit 10;

-- 2) Write an SQL query to find the first 3 customer in the Customers table who live in 'London'.
select* from customers 
where city='London'
limit 3;

----------------
# MIN(), MAX(), AVG, SUM and COUNT Functions
SELECT MIN(Price) AS LowestPrice
FROM Products;

-- AS means aliasing/renaming your result set

SELECT MAX(Price) AS HighestPrice
FROM Products;

select min(orderdate) from orders;
select min(productname) from products;
select max(productname) from products;

--- number of products in products table
select count(productid)
from products;

-- AVG
SELECT AVG(Price)
FROM Products;

SELECT round(AVG(Price),2)
FROM Products;

-- SUM
SELECT SUM(Quantity)
FROM Order_Details;

-----------------------------

-- Write an SQL query to return the ProductName, Price, and ProductCategory of Bikes, ordered by Price in descending order and limited to 5 rows.
-- 1.start writing select and from keywords
-- 2.Write the name of the table 
-- 3. Do I need to use where clause ? Filtering
-- 4. Do I need to use sorting ? Order by
-- 5. What fields to return?
-- 6. Is there need to limit?

SELECT ProductName, Price, ProductCategory
FROM Products
Where ProductCategory = “Bikes”
Order by Price DESC
LIMIT 5;
 
----------------------------------

# LIKE Operator
select* from customers
where customername like 'a%';

select* from customers
where customername like '%a';

SELECT * FROM Customers
WHERE CustomerName LIKE "ma%";
 
select* from customers
where customername like '%or%';

-- Customer name including food
SELECT * FROM Customers
WHERE CustomerName LIKE '%food%';
 
SELECT * FROM Customers
WHERE CustomerName LIKE '%cheese%';

-- r in second position
SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';

-- r in second position
SELECT * FROM Customers
WHERE CustomerName LIKE '_t%';
 
SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';
 
SELECT * FROM Customers
WHERE ContactName LIKE 'a%o';

select* from customers
where customername like 'r__%';
-- underscore _ represents the numbers of characters/ ___ (3x underscores so we need at least 3 characters)

SELECT * FROM Customers 
WHERE Country LIKE '____%';
-- UK and USA are not returned as they have 2 and 3 characters

SELECT * FROM Customers WHERE Country LIKE '__%';
-- UK and USA returned as they have at lease 2 characters

-- Write an SQL query to find customers whose CustomerName does not start with 'a'.
SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'a%';

-- Write an SQL query to find all suppliers from countries that contain the substring 'land' (e.g., 'Finland', 'Poland') in the Country field.
select* from suppliers
where country like '%land%';

-- Write an SQL query to find all employees whose FirstName contains the letter 'n ' as the second character.
select* from employees
where firstname like '_n%';

-- Write an SQL query to find all shippers whose ShipperName contains the word 'Express'.
select* from shippers
where shippername like '%express%';

-- employee firstname including m and lastname containing a
select firstname, lastname
from employees 
where firstname like "%m%" and lastname like '%a%';
------------
# IN Operator
select* from customers
where country in ('germany', 'france', 'uk');
-- customers in UK or in Germany or in France

select* from customers
where country not in ('germany', 'france', 'uk');
-- customers outside of UK, Germany and France

#Subquery

select* from customers
where country in (select country from suppliers);
-- customers who are in the same country as suppliers

# Exercises

-- Write an SQL query to find all customers from either Berlin, 'Paris', or 'Madrid' in the Customers table.
SELECT * FROM Customers 
WHERE City  IN ('Berlin', 'Paris', 'Madrid');

-- Write an SQL query to find all orders that were shipped by ShipperID 1 or 3 from the Orders table.
select * from Orders where ShipperID in (1,3);

-- Write an SQL query to find all products that have UnitPrice is 10, 20, or 30.
SELECT * FROM Products WHERE UnitPrice IN (10, 20, 30);

-- Write an SQL query to find all customers who have placed an order. Use a subquery on the Orders table to match the customers. (Use subquery)
-- customer info in orders tables is customerid
-- this info will used to filter customers table
-- if cusomerid is in orders table, meaning this customer has placed an order
-- subquery will be used to find customerid in orders table
select* from customers
where customerid in (select customerid from orders);

------------
# BETWEEN Operator
select* from products
where price between 10 and 20;

select* from products
where price not between 10 and 20;

select * from products
where productname between "Konbu" and "Tofu";

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20
AND CategoryID NOT IN (1,2,3);

SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

-------
# Aliasing
select customerid as id, customername as customer
from customers;

------------------------------------------
# MySQL exercises using Northwind databases

-- Retrieve all columns from the "Customers" table. CORRECT
select* from customers

-- Retrieve only the "CustomerName" and "City" columns from the "Customers" table. CORRECT
select customername, city
from customers;

-- Retrieve distinct values of the "City" column from the "Customers" table. CORRECT
select distinct city from customers;

-- Retrieve all columns from the "Products" table where the "Price" is greater than 50. CORRECT
select* from products
where price > 50;

-- Retrieve all columns from the "Customers" table where the "Country" is either 'USA' or 'UK'. CORRECT
select* from customers
where country in ('usa', 'uk');

-- Retrieve all columns from the "Orders" table, sorted by the "OrderDate" in descending order. CORRECT
select* from orders
order by orderdate desc;

-- Retrieve all columns from the "Products" table where the "Price" is between 20 and 50, ordered by descending "Price". CORRECT
select* from products
where price between 20 and 50
order by price desc;

-- Retrieve all columns from the "Customers" table where the "Country" is 'USA' and "City" is either 'Portland' or 'Kirkland', ordered by ascending "CustomerName".
SELECT * FROM Customers
WHERE Country = 'USA' AND City IN ('Portland', 'Kirkland')
ORDER BY CustomerName ASC;

-- Retrieve all columns from the "Customers" table where the "Country" is 'UK' or "City" is 'London', ordered by descending "CustomerName".
SELECT * FROM Customers
WHERE Country = 'UK' OR City = 'London'
ORDER BY CustomerName DESC;

-- Retrieve all columns from the "Products" table where the "CategoryID" is 1 or 2, ordered by ascending "ProductName".
select* from products
where categoryid in (1,2)
order by productname asc;
-------------------------------------
# Northwind Database Basic Exercises 2

-- Find the total number of orders in the Orders table.
select count(orderid) as totalorders
from orders;

-- Count the number of customers who have placed orders.
select count(customerid) as totalcustomers
from orders;

-- Retrieve all orders where the order date is in July 1996.
select* from orders
where orderdate between '1996-07-01' and '1996-07-31';

select * 
from orders
where orderdate like '1996-07%';

-- Retrieve products with unit prices between 100 and 200.
select* from products
where price between 100 and 200;

-- Retrieve all columns from the Orders table for orders made by customers whose name starts with "A".
select * from orders
where customerid in (select customerid from customers where customername like "A%" );

-- Calculate the average unit price of products.
SELECT AVG(Price) avgprice
FROM Products;

-- Retrieve customers whose company names contain 'Food' anywhere in the name.
select customername, country, city
from customers
where customername like '%food%';

-- Get all employees whose last name starts with "S" and first name ends with "L"
select*
from employees
where lastname like 'S%' and firstname like '%L';

-- Find all orders made by customers with IDs 1, 3, and 5
select* from orders
where customerid in (1,3,5);

-- Find all products whose name contains "chocolate".
select* from products
where productname like '%chocolate%';

-- Find the maximum unit price of products. 
select max(price) as highestprice
from products;

-- Retrieve the top 5 most expensive products from the Products table.
select ProductID, ProductName, Price
from products
order by price desc 
limit 5;

-- Find all products whose names start with 'Ch'.
select* from products where productname like 'ch%';
---------------------------------------









use northwind;

-- Inner join supplier of each product
select products.productname as product, suppliers.suppliername as supplier
from products
inner join suppliers
on products.supplierid = suppliers.supplierid;

-- Supplier Tokyo Traders only
select products.productname as product, suppliers.suppliername as supplier
from products
inner join suppliers
on products.supplierid = suppliers.supplierid
where suppliername = "Tokyo Traders";

-- suppliers tokyo trader sort by product name
select products.productname as product, suppliers.suppliername as supplier
from products
inner join suppliers
on products.supplierid = suppliers.supplierid
where suppliername = "Tokyo Traders"
order by products.productname;


-- suppliers tokyo trader sort by product name
select products.productname as product, suppliers.suppliername as supplier
from suppliers
inner join products
on products.supplierid = suppliers.supplierid
where suppliername = "Tokyo Traders"
order by products.productname;

-- the position for right and left table doesnt make difference. Because this is inner join.

----------------------
# RIGHT Join
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
where orders.orderid is null
ORDER BY Orders.OrderID;

# LEFT join
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
-- all info about customer and only matching in orders
 
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
where orders.orderid is null
ORDER BY Customers.CustomerName;

-- Write SQL query to find name of the products which has never been ordered
-- if product has never been ordered, it will not have an orderid
select *
from products as p
left join order_details as od
on p.productid = od.productid
where od.orderid is null;

#CROSS/FULL/OUTER Join
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders
order by customername;

---------------
#GROUP BY statement
-- Number of customers from each country
select count(*), Country from customers
group by Country;

-- Count number of different cities in each country in customers table
select count(distinct city), country
from customers
group by country;

select count(distinct city), country
from customers
group by country;
order by count(distinct city) desc;

#GROUP BY with join
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders 
FROM Orders
LEFT JOIN Shippers 
ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;

-- total sales amount by each product (quantity * price)
-- join products to order_details table
select  p.productname, sum(od.quantity * p.price) as sales
from products as p
inner join order_details as od
on p.productid = od.productid
group by p.productname
order by sales desc;

--- Exercises
-- Write SQL query to list the number of customers in each country.
select count(customerid) as noofcust, Country
from customers
group by country
order by noofcust desc; 

-- Write a query to list each product category and the total quantity of products sold in that category.
select  c.CategoryName, count(CategoryName) as 'Quantity sold'
from products as p
inner join categories as c
on p.CategoryID = c.CategoryID
group by CategoryName;

-- Write a query to list each employee and the number of orders they have handled.
select e.employeeid, e.firstname,e.lastname, count(o.orderid) as ordercount 
from employees as e
inner join orders as o
on e.employeeid = o.employeeid
group by e.employeeid, e.firstname, e.lastname
order by ordercount ; 


----------------------------------
# Northwind SQL Joins  Exercises

-- Write SQL query to find supplier of each product
select productname, productid, suppliername
from products
join suppliers
on products.supplierid = suppliers.supplierid;

-- Write sql query to  find category of each product.
select productname, categoryname
from products
join categories
on products.categoryid = categories.categoryid;

-- Retrieve all products belonging to the meat/poultry category
select productname, categoryname
from products
join categories
on products.categoryid = categories.categoryid
where categoryname = 'meat/poultry';

-- Retrieve the order ID, order date, customer name, and employee name for all orders
select o.orderid, o.orderdate, c.customername, e.firstname, e.lastname
from orders as o
join employees as e
on o.employeeid = e.employeeid
join customers as c
on c.customerid = o.customerid;

-- Retrieve the product name, category name, and supplier name for all products.
select productname, categoryname, suppliername
from products as p
join suppliers as s
on p.supplierid = s.supplierid
join categories as c
on c.categoryid = p.categoryid;

-- Create a report for all the orders of 1996 and their Customers.
select year(orderdate), customername
from orders as o
inner join customers as c
on o.customerid = c.customerid
where year(orderdate) =1996;

-- Retrieve all categories along with the number of products in each category.
select count(productname) as totalproducts, categoryname
from products as p
join categories as c
on p.categoryid = c.categoryid
group by categoryname
order by totalproducts;

-- Retrieve all products with their prices and the quantity ordered for each product.
select price, sum(quantity) as totalquantity, p.productid, ProductName
from products as p
join order_details as od 
on p.productid = od.productid
group by productid;


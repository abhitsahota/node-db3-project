-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

 select ProductName, CategoryName from product
 join Category
 on product.CategoryId = Category.Id


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

Select id, CompanyName from order
join shipper
on order.shipvia = shipper.id
where OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

Select p.productname, od.quantity from orderdetail as od
join product as p
on p.id = od.productid
where od.orderid = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id as 'OrderID', c.CompanyName as 'Customer Company Name', e.LastName as 'Employee Last Name' from [order] as o
JOIN customer as c
ON o.customerid = c.Id
JOIN employee as e
ON o.EmployeeId = e.Id
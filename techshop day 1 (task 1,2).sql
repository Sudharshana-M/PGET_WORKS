--1
create table Customers 
(
CustomerID int primary key identity(1,1),
FirstName varchar(50),
LastName varchar(50),
Email varchar(100) unique,
Phone bigint,
Address varchar(200) 
);

--2
create table Products
(
ProductID int primary key identity(1,1),
ProductName varchar(100),
Description text  ,
Price decimal(10,2)  check (Price >0),
);

--3
create table Orders
(
OrderID int primary key identity(1,1),
CustomerID int ,
OrderDate datetime default getdate(),
TotalAmount decimal(10,2)  check(TotalAmount >=0),
foreign key (CustomerID) references Customers (CustomerID) 
);

--4
create table OrderDetails
(

OrderDetailID int Primary Key identity(1,1),
OrderID int ,
ProductID int,
Quantity int check (Quantity > 0),
foreign key (OrderID) references Orders(OrderID),
foreign key (ProductID) references Products(ProductID)
);

--5
create table Inventory
(
InventoryID int Primary Key identity(1,1),
ProductID int ,
QuantityInStock int check (QuantityInStock >0), 
LastStockUpdate datetime  default getdate(),
foreign key (ProductID) references Products(ProductID)
);





INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES
('sudha', 'sana ', 'sudha.sana@gmail.com', 9876543210, '123 Main St, NY'),
('dharshana', 'shana', 'dharshana.shana@gmail.com', 9876543211, '456 Oak St, CA'),
('sudharshana', 'maha', 'sudharshana.maha@gmail.com', 9876543212, '789 Pine St, TX'),
('kamal', 'hasan', 'kamal.hasan@gmail.com', 9876543213, '101 Maple St, FL'),
('vijay ', 'joshep', 'vijay.joshep@gmail.com', 9876543214, '202 Birch St, WA'),
('ajith ', 'kumar', 'ajith.kumar@gmail.com', 9876543215, '303 Cedar St, OR'),
('taylor', 'swift', 'taylor.swift@gmail.com', 9876543216, '404 Elm St, NV'),
('selena ', 'gomas', 'selena.gomas@gmail.com', 9876543217, '505 Aspen St, AZ'),
('harris', 'jairaj', 'harris.jairaj@gmail.com', 9876543218, '606 Willow St, CO'),
('uvan', 'shanker', 'uvan.shanker@gmail.com', 9876543219, '707 Spruce St, GA');




INSERT INTO Products (ProductName, Description, Price)
VALUES
('Laptop', 'High-performance gaming laptop', 1200.00),
('Smartphone', 'Latest model with 5G connectivity', 799.99),
('Headphones', 'Noise-canceling wireless headphones', 199.99),
('Smartwatch', 'Water-resistant with health tracking', 249.99),
('Tablet', '10-inch display with high resolution', 499.99),
('Monitor', '27-inch 4K UHD display', 349.99),
('Keyboard', 'Mechanical RGB gaming keyboard', 99.99),
('Mouse', 'Wireless ergonomic mouse', 49.99),
('Speakers', 'Bluetooth stereo speakers', 129.99),
('Printer', 'All-in-one inkjet printer', 179.99);



INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(1, '2025-03-01', 1399.99),
(2, '2025-03-02', 799.99),
(3, '2025-03-03', 999.99),
(4, '2025-03-04', 499.99),
(5, '2025-03-05', 1249.99),
(6, '2025-03-06', 699.99),
(7, '2025-03-07', 89.99),
(8, '2025-03-08', 299.99),
(9, '2025-03-09', 149.99),
(10, '2025-03-10', 199.99);




INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES
(1, 1, 1), 
(1, 3, 1), 
(2, 2, 1), 
(3, 5, 2), 
(4, 4, 1),
(5, 6, 1),
(6, 7, 1),
(7, 8, 2), 
(8, 9, 1),
(9, 10, 1);



INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate)
VALUES
(1, 50, '2025-02-01'),
(2, 100, '2025-02-02'),
(3, 75, '2025-02-03'),
(4, 60, '2025-02-04'),
(5, 80, '2025-02-05'),
(6, 40, '2025-02-06'),
(7, 90, '2025-02-07'),
(8, 120, '2025-02-08'),
(9, 55, '2025-02-09'),
(10, 30, '2025-02-10');



--TASK 2 


--1 Write an SQL query to retrieve the names and emails of all customers

select FirstName ,LastName ,Email from Customers;

--3 Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
select * from Customers 
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('maha','lakshmi', 'mahalakshmi@gmail.com', 9876543210 ,'123 Main Street, chennai');

--4 . Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.

update Products
set Price = Price * 1.10
where ProductID in (1,2,3,4,5,6,7,8,9,10);
select * from Products

--5 Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. 
--Allow users to input the order ID as a parameter
 
DELETE FROM OrderDetails
WHERE OrderID = 2;

DELETE FROM Orders
WHERE OrderID = 2;



 --6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.

 SELECT * FROM Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES
('raja', 'chola ', 'raja.chola@gmail.com', 1234509678, '3 Main St, swden')

 SELECT * FROM Orders 
 INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (13, '2025-03-011', 399.99);

SELECT * FROM Customers WHERE CustomerID = 13;

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. 
--Allow users to input the customer ID and new contact information.

update Customers
set Email= 'john@gmail.com', Address = '143,pine road,ny'
where CustomerID = 5;


--9. Write an SQL query to delete all orders and their associated order details for a specific
--customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID
--as a parameter.

DELETE FROM OrderDetails
WHERE OrderID IN (
    SELECT OrderID FROM Orders WHERE CustomerID = 1
);

DELETE FROM Orders
WHERE CustomerID = 1;


--10. Write an SQL query to insert a new electronic gadget product into the "Products" table,
--including product name, category, price, and any other relevant details.

INSERT INTO Products (ProductName, Description, Price)
VALUES
('ipad', 'High-performance', 2200.00);

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from
--"Pending" to "Shipped"). Allow users to input the order ID and the new status.

UPDATE Orders
SET OrderStatus = 'Pending'
WHERE OrderStatus IS NULL;


SELECT * FROM Orders;

UPDATE Orders
SET OrderStatus = 'Shipped'
WHERE OrderID = 3;



--12. Write an SQL query to calculate and update the number of orders placed by each customer
--in the "Customers" table based on the data in the "Orders" table.alter table Customers
add OrderCount int default 0;

update Customers
set OrderCount =(select count(*) from Orders where Orders.CustomerID = Customers.CustomerID
);

select CustomerID, OrderCount from Customers;











create table customers (
    customer_id int primary key identity,
    name varchar(100),
    email varchar(100) unique,
    password varchar(255)
);

create table products (
    product_id int primary key identity,
    name varchar(100),
    price decimal(10,2),
    description text,
    stockquantity int
);

create table cart (
    cart_id int primary key identity,
    customer_id int,
    product_id int,
    quantity int,
    foreign key (customer_id) references customers(customer_id),
    foreign key (product_id) references products(product_id)
);


create table orders (
    order_id int primary key identity(1,1),
    customer_id int,
    order_date datetime default current_timestamp,
    total_price decimal(10,2),
    shipping_address varchar(255),
    foreign key (customer_id) references customers(customer_id)
);

create table order_items (
    order_item_id int primary key identity(1,1),
    order_id int,
    product_id int,
    quantity int,
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);

insert into customers (name, email, password) values
('sudha sana', 'sudha.sana@gmail.com', 'password123'),
('dharshana shana', 'dharshana.shana@gmail.com', 'password456'),
('sudharshana maha', 'sudharshana.maha@gmail.com', 'password789'),
('kamal hasan', 'kamal.hasan@gmail.com', 'password111'),
('vijay joshep', 'vijay.joshep@gmail.com', 'password222'),
('ajith kumar', 'ajith.kumar@gmail.com', 'password333'),
('taylor swift', 'taylor.swift@gmail.com', 'password444'),
('selena gomas', 'selena.gomas@gmail.com', 'password555'),
('harris jairaj', 'harris.jairaj@gmail.com', 'password666'),
('uvan shanker', 'uvan.shanker@gmail.com', 'password777');



insert into products (name, price, description, stockquantity) values
('dress', 1500.00, 'women floral summer dress', 20),
('handbag', 2500.00, 'leather designer handbag', 15),
('shoes', 3000.00, 'men running sports shoes', 25),
('smartwatch', 5000.00, 'fitness tracker with heart rate monitor', 10),
('perfume', 1800.00, 'luxury long-lasting fragrance', 30),
('gaming console', 40000.00, 'next-gen gaming console with 1TB storage', 8),
('lipstick', 500.00, 'matte finish long-lasting lipstick', 50),
('sunglasses', 1200.00, 'polarized UV protection sunglasses', 22),
('wireless earbuds', 3500.00, 'noise-canceling Bluetooth earbuds', 18),
('travel backpack', 2200.00, 'waterproof 30L travel backpack', 12);


insert into cart (customer_id, product_id, quantity) values
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 2),
(5, 5, 1),
(6, 6, 3),
(7, 7, 1),
(8, 8, 2),
(9, 9, 1),
(10, 10, 2);


insert into orders (customer_id, total_price, shipping_address) values
(1, 750.00, '123 main st, new york'),
(2, 1000.00, '456 broadway, chicago'),
(3, 80.00, '789 sunset blvd, los angeles'),
(4, 400.00, '101 market st, san francisco'),
(5, 300.00, '202 beacon st, boston'),
(6, 120.00, '303 queen st, toronto'),
(7, 60.00, '404 king st, london'),
(8, 180.00, '505 collins st, melbourne'),
(9, 250.00, '606 shibuya, tokyo'),
(10, 90.00, '707 marina bay, singapore');


insert into order_items (order_id, product_id, quantity) values
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 2),
(5, 5, 1),
(6, 6, 3),
(7, 7, 1),
(8, 8, 2),
(9, 9, 1),
(10, 10, 2);

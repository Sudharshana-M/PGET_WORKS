create table users (
    userid int primary key,
    name varchar(255),
    email varchar(255) unique,
    password varchar(255),
    contactnumber varchar(20),
    address text
);

create table courier (
    courierid int primary key,
    sendername varchar(255),
    senderaddress text,
    receivername varchar(255),
    receiveraddress text,
    weight decimal(5, 2),
    status varchar(50),
    trackingnumber varchar(20) unique,
    deliverydate date
);

create table courierservices (
    serviceid int primary key,
    servicename varchar(100),
    cost decimal(8, 2)
);

create table employee (
    employeeid int primary key,
    name varchar(255),
    email varchar(255) unique,
    contactnumber varchar(20),
    role varchar(50),
    salary decimal(10, 2)
);

create table location (
    locationid int primary key,
    locationname varchar(100),
    address text
);

create table payment (
    paymentid int primary key,
    courierid int,
    locationid int,
    amount decimal(10, 2),
    paymentdate date,
    foreign key (courierid) references courier(courierid),
    foreign key (locationid) references location(locationid)
);

insert into users values (1, 'stephen perez', 'jerry37@gmail.com', 'u1HdLv3nhE', '295.862.8507', '41380 sara plains suite 516, new janestad, sd 79367');
insert into users values (2, 'james carter', 'qmitchell@hotmail.com', 'IR9h4XzKXL', '1-812-555-3669x493', '18816 anna course, port terrance, ga 31417');
insert into users values (3, 'timothy collins', 'waltersierra@mills.com', 'FBc9BgPlX9', '(519)577-0024', '336 emily burg, tommyfurt, ne 10490');
insert into users values (4, 'karen rodriguez', 'christopherryan@kim.com', 'vb2UdL8AYP', '255-315-1064', '25004 eric stream, south laurabury, hi 93923');
insert into users values (5, 'john reynolds', 'michael63@mcgee.org', 'mP4ZINmngC', '238.745.7195', '74191 franklyn mountains, new christine, nd 19989');
insert into users values (6, 'bradley stewart', 'pfletcher@hotmail.com', 'tNz0jNeKAc', '(631)302-6925', '5874 robert lodge apt. 781, north robyn, il 71117');
insert into users values (7, 'mary jenkins', 'stephen57@hotmail.com', 'hEUb2taLFP', '273-390-1757x724', '09061 dawn trail, katiefort, vt 37414');
insert into users values (8, 'carol thomas', 'waltonnicholas@gmail.com', 'xAeGeuTSFJ', '(582)324-2180x449', '914 nancy springs, west richard, mi 06127');
insert into users values (9, 'melissa henderson', 'mccoydebbie@yahoo.com', 'VuCl1hUUI6', '1-875-383-0144', '44240 thornton extensions, east adam, co 80294');
insert into users values (10, 'patrick holmes', 'wthomas@melton.com', 'xSMBDKcQKm', '275-303-0111x0975', '64871 brad lane suite 662, millstoneland, md 20545');


insert into courier values (
        1,
        'ronald taylor',
        '44288 roberts vista, robertmouth, sd 33083',
        'gregory thomas',
        '41080 torres parkway, juliaton, ks 06031',
        5.39,
        'cancelled',
        'trk000001',
        '2025-03-17'
    );
insert into courier values (
        2,
        'catherine brown',
        '94871 douglas track, williamstad, mt 27958',
        'dawn brown',
        '23044 foster plains, north jeffrey, ms 13238',
        5.6,
        'in transit',
        'trk000002',
        '2025-03-14'
    );
insert into courier values (
        3,
        'brian hill',
        '93882 francis drive, east alexander, la 94856',
        'terry howard',
        '5638 sandoval cape, west jonathan, ak 81346',
        21.33,
        'cancelled',
        'trk000003',
        '2025-03-17'
    );
insert into courier values (
        4,
        'heather castillo',
        '1494 dawn estates suite 496, west tiffany, ky 11042',
        'jacqueline mcdonald',
        '41907 daniel square apt. 204, new edward, il 55760',
        3.52,
        'in transit',
        'trk000004',
        '2025-03-25'
    );
insert into courier values (
        5,
        'willie mitchell',
        '30260 raymond islands, new richard, de 16748',
        'kristy stokes',
        '1887 taylor manors suite 699, new katherine, mt 67087',
        24.02,
        'cancelled',
        'trk000005',
        '2025-03-23'
    );
insert into courier values (
        6,
        'jennifer carter',
        '84538 jennifer loop, port willie, fl 82223',
        'robert johnson',
        '4634 rogers brook, west rebeccaview, sd 33168',
        2.96,
        'pending',
        'trk000006',
        '2025-03-30'
    );
insert into courier values (
        7,
        'robert peterson',
        '86701 roberts lights, michaelport, ne 69027',
        'ashley andrews',
        '35875 kristine forge, hannahside, vt 68230',
        14.96,
        'cancelled',
        'trk000007',
        '2025-03-31'
    );
insert into courier values (
        8,
        'katherine wright',
        '41739 hayes extension, new kimtown, or 57973',
        'mark warren',
        '9050 bryant lock, port christopherstad, ok 09779',
        2.84,
        'cancelled',
        'trk000008',
        '2025-03-20'
    );
insert into courier values (
        9,
        'brandy hill',
        '5449 rivers causeway, port jason, la 41863',
        'mark thomas',
        '8898 rebecca village, jenniferport, fl 94676',
        2.44,
        'pending',
        'trk000009',
        '2025-03-18'
    );
insert into courier values (
        10,
        'heather larson',
        '69369 barnes neck, julieport, tx 09802',
        'jonathan olson',
        '39973 green streets apt. 074, west nicholas, la 84071',
        4.82,
        'in transit',
        'trk000010',
        '2025-03-22'
    );


	insert into courierservices values (1, 'overnight', 926.81);
insert into courierservices values (2, 'express', 662.44);
insert into courierservices values (3, 'overnight', 505.96);
insert into courierservices values (4, 'standard', 739.06);
insert into courierservices values (5, 'standard', 779.44);
insert into courierservices values (6, 'economy', 508.2);
insert into courierservices values (7, 'economy', 790.18);
insert into courierservices values (8, 'economy', 317.89);
insert into courierservices values (9, 'standard', 819.8);
insert into courierservices values (10, 'express', 193.95);


insert into employee values (1, 'shawn lopez', 'smithmichael@russell.info', '1-776-229-2702', 'clerk', 29545.69);
insert into employee values (2, 'stephanie perez', 'clayton43@turner.org', '948-238-0793', 'driver', 40506.72);
insert into employee values (3, 'karen peters', 'maryknight@yahoo.com', '839-215-0376x102', 'clerk', 64731.3);
insert into employee values (4, 'scott carter', 'cmartin@yahoo.com', '649.885.5158x902', 'packer', 31293.28);
insert into employee values (5, 'danielle harmon', 'garciachristopher@gmail.com', '442-692-1459x34184', 'driver', 68796.86);
insert into employee values (6, 'natalie ellis', 'bobby25@davenport.com', '801-983-0383', 'clerk', 20900.24);
insert into employee values (7, 'michael peters', 'murphyamanda@yahoo.com', '869-685-0050x199', 'manager', 31466.08);
insert into employee values (8, 'ryan castillo', 'carrie62@martin.com', '865.911.0406x426', 'clerk', 62498.97);
insert into employee values (9, 'nicholas hall', 'jessicazimmerman@tyler.org', '(970)858-1153', 'packer', 27286.68);
insert into employee values (10, 'ashley ruiz', 'thomasjennifer@rodriguez.info', '515.905.1633x424', 'driver', 23568.1);




insert into location values (1, 'port john', '29545 julie fields, west andrew, nm 45757');
insert into location values (2, 'south james', '18007 ruiz vista, west tammy, mn 78547');
insert into location values (3, 'greenstad', '4289 walsh meadow, terrencechester, ut 32786');
insert into location values (4, 'rayburgh', '2280 anthony village, karenburgh, nh 09337');
insert into location values (5, 'north sherrifurt', '30351 castro wall, new kathleen, ar 23368');
insert into location values (6, 'kennethview', '14872 richards spring, new stephanie, ms 84440');
insert into location values (7, 'lopezfort', '48040 sanchez manors, christopherland, wa 96787');
insert into location values (8, 'clayville', '51815 eric terrace, natalieport, la 56704');
insert into location values (9, 'kennethchester', '30271 jennifer mission suite 222, south chadmouth, ak 20445');
insert into location values (10, 'brownville', '6160 castillo fort, port christopher, mt 15490');



insert into payment values (1, 2, 1, 920.41, '2025-03-21');
insert into payment values (2, 4, 10, 297.88, '2025-03-28');
insert into payment values (3, 7, 5, 645.73, '2025-03-24');
insert into payment values (4, 4, 3, 826.85, '2025-03-23');
insert into payment values (5, 1, 4, 930.23, '2025-03-30');
insert into payment values (6, 3, 8, 692.91, '2025-03-17');
insert into payment values (7, 8, 10, 347.42, '2025-03-15');
insert into payment values (8, 2, 6, 951.44, '2025-03-21');
insert into payment values (9, 5, 7, 903.78, '2025-03-14');
insert into payment values (10, 7, 3, 978.86, '2025-03-15');


--TASK 2
-- 1. List all customers:
SELECT * FROM users;

-- 2. List all orders for a specific customer (e.g., customer ID = 2):
SELECT * FROM courier WHERE sendername = (SELECT name FROM users WHERE userid = 2);

-- 3. List all couriers:
SELECT * FROM courier;

-- 4. List all packages for a specific order (e.g., order ID = 3):
-- Assuming 'courier_id' represents the order ID
SELECT * FROM courier WHERE courierid = 3;

-- 5. List all deliveries for a specific courier (e.g., courier ID = 5):
SELECT * FROM courier WHERE courierid = 5;

-- 6. List all undelivered packages:
SELECT * FROM courier WHERE status NOT IN ('delivered');

-- 7. List all packages that are scheduled for delivery today:
SELECT * FROM courier WHERE deliverydate = CURRENT_DATE;

-- 8. List all packages with a specific status (e.g., 'in transit'):
SELECT * FROM courier WHERE status = 'in transit';

-- 9. Calculate the total number of packages for each courier:
SELECT courierid, COUNT(*) AS total_packages
FROM courier
GROUP BY courierid;

-- 10. Find the average delivery time for each courier:
-- Assuming delivery time is the difference between CURRENT_DATE and delivery_date
-- 10. Find the average delivery time per sender:
-- Average number of days since delivery (positive values):
SELECT sendername, AVG(DATEDIFF(CURRENT_DATE, deliverydate)) AS avg_days_since_delivery
FROM courier
WHERE deliverydate IS NOT NULL
GROUP BY sendername;

-- 11. List all packages with a specific weight range (e.g., between 3 and 6 kg):
SELECT * FROM courier WHERE weight BETWEEN 3 AND 6;

-- 12. Retrieve employees whose names contain 'John':
SELECT * FROM employee WHERE name LIKE '%john%';

-- 13. Retrieve all courier records with payments greater than $50:
SELECT c.*
FROM courier c
JOIN payment p ON c.courierid = p.courierid
WHERE p.amount > 50;



--TASK 3 

-- Mapping table to relate couriers and employees (Assumption for Query 14)
CREATE TABLE courier_employee (
  id INT PRIMARY KEY AUTO_INCREMENT,
  courierid INT,
  employeeid INT,
  FOREIGN KEY (courierid) REFERENCES courier(courierid),
  FOREIGN KEY (employeeid) REFERENCES employee(employeeid)
);

-- 14. Find the total number of couriers handled by each employee:
CREATE TABLE courieremployee (
  id INT PRIMARY KEY AUTO_INCREMENT,
  courierid INT,
  employeeid INT,
  FOREIGN KEY (courierid) REFERENCES courier(courierid),
  FOREIGN KEY (employeeid) REFERENCES employee(employeeid)
);

-- 15. Calculate the total revenue generated by each location:
SELECT l.locationid, l.locationname, SUM(p.amount) AS total_revenue
FROM payment p
JOIN location l ON p.locationid = l.locationid
GROUP BY l.locationid, l.locationname;

-- 16. Find the total number of couriers delivered to each location:
SELECT l.locationid, l.locationname, COUNT(p.courierid) AS total_deliveries
FROM payment p
JOIN location l ON p.locationid = l.locationid
GROUP BY l.locationid, l.locationname;

-- 17. Find the courier with the highest average delivery time:
SELECT TOP 1 courierid, AVG(DATEDIFF(deliverydate, CURRENT_DATE)) AS avg_delivery_time
FROM courier
WHERE deliverydate IS NOT NULL
GROUP BY courierid
ORDER BY avg_delivery_time DESC


-- 18. Find locations with total payments less than a certain amount (e.g., 3000):
SELECT l.locationid, l.locationname, SUM(p.amount) AS total_payment
FROM payment p
JOIN location l ON p.locationid = l.locationid
GROUP BY l.locationid, l.locationname
HAVING SUM(p.amount) < 3000;

-- 19. Calculate total payments per location:
SELECT l.locationid, l.locationname, SUM(p.amount) AS total_payment
FROM payment p
JOIN location l ON p.locationid = l.locationid
GROUP BY l.locationid, l.locationname;

-- 20. Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = 2):
SELECT c.courierid, SUM(p.amount) AS total_payment
FROM payment p
JOIN courier c ON p.courierid = c.courierid
WHERE p.locationid = 2
GROUP BY c.courierid
HAVING SUM(p.amount) > 1000;

-- 21. Retrieve couriers who have received payments totaling more than $1000 after a certain date (PaymentDate > '2025-01-01'):
SELECT c.courierid, SUM(p.amount) AS total_payment
FROM payment p
JOIN courier c ON p.courierid = c.courierid
WHERE p.paymentdate > '2025-01-01'
GROUP BY c.courierid
HAVING SUM(p.amount) > 1000;

-- 22. Retrieve locations where the total amount received is more than $5000 before a certain date (PaymentDate < '2025-01-01'):
SELECT l.locationid, l.locationname, SUM(p.amount) AS total_payment
FROM payment p
JOIN location l ON p.locationid = l.locationid
WHERE p.paymentdate < '2025-01-01'
GROUP BY l.locationid, l.locationname
HAVING SUM(p.amount) > 5000;


--task 4

-- 23. Retrieve Payments with Courier Information
SELECT p.*, c.*
FROM payment p
INNER JOIN courier c ON p.courierid = c.courierid;

-- 24. Retrieve Payments with Location Information
SELECT p.*, l.*
FROM payment p
INNER JOIN location l ON p.locationid = l.locationid;

-- 25. Retrieve Payments with Courier and Location Information
SELECT p.*, c.*, l.*
FROM payment p
INNER JOIN courier c ON p.courierid = c.courierid
INNER JOIN location l ON p.locationid = l.locationid;

-- 26. List all payments with courier details
SELECT p.paymentid, p.amount, p.paymentdate, c.sendername, c.receivername, c.status
FROM payment p
JOIN courier c ON p.courierid = c.courierid;

-- 27. Total payments received for each courier
SELECT courierid, SUM(amount) AS total_payment
FROM payment
GROUP BY courierid;

-- 28. List payments made on a specific date
SELECT *
FROM payment
WHERE paymentdate = '2025-04-13'; -- change date as needed

-- 29. Get Courier Information for Each Payment
SELECT p.paymentid, c.*
FROM payment p
JOIN courier c ON p.courierid = c.courierid;

-- 30. Get Payment Details with Location
SELECT p.paymentid, p.amount, p.paymentdate, l.locationname
FROM payment p
JOIN location l ON p.locationid = l.locationid;

-- 31. Calculating Total Payments for Each Courier
SELECT c.courierid, c.sendername, SUM(p.amount) AS total_payment
FROM courier c
JOIN payment p ON c.courierid = p.courierid
GROUP BY c.courierid, c.sendername;

-- 32. List Payments Within a Date Range
SELECT *
FROM payment
WHERE paymentdate BETWEEN '2025-01-01' AND '2025-04-13'; -- update dates as needed

-- 33. All users and their courier records (Full Outer Join Simulation using UNION)
SELECT u.userid, u.name, c.courierid, c.sendername
FROM users u
LEFT JOIN courier c ON u.name = c.sendername
UNION
SELECT u.userid, u.name, c.courierid, c.sendername
FROM users u
RIGHT JOIN courier c ON u.name = c.sendername;

-- 34. All couriers and their services (Full Outer Join Simulation)
SELECT c.courierid, c.trackingnumber, s.servicename
FROM courier c
LEFT JOIN courierservices s ON c.courierid = s.serviceid
UNION
SELECT c.courierid, c.trackingnumber, s.servicename
FROM courier c
RIGHT JOIN courierservices s ON c.courierid = s.serviceid;

-- 35. Employees and their payments (Full Outer Join Simulation)
SELECT e.employeeid, e.name, p.paymentid, p.amount
FROM employee e
LEFT JOIN courieremployee ce ON e.employeeid = ce.employeeid
LEFT JOIN payment p ON ce.courierid = p.courierid
UNION
SELECT e.employeeid, e.name, p.paymentid, p.amount
FROM employee e
RIGHT JOIN courieremployee ce ON e.employeeid = ce.employeeid
RIGHT JOIN payment p ON ce.courierid = p.courierid;

-- 36. All users and all courier services (Cross Join)
SELECT u.name, s.servicename
FROM user u
CROSS JOIN courierservices s;

-- 37. All employees and all locations (Cross Join)
SELECT e.name AS employee_name, l.locationname
FROM employee e
CROSS JOIN location l;

-- 38. Couriers with sender information
SELECT courierid, sendername, senderaddress
FROM courier;

-- 39. Couriers with receiver information
SELECT courierid, receivername, receiveraddress
FROM courier;

-- 40. Couriers with service details (if available)
SELECT c.*, s.servicename, s.cost
FROM courier c
LEFT JOIN courierservices s ON c.courierid = s.serviceid;

-- 41. Employees and number of couriers assigned to each
SELECT e.employeeid, e.name, COUNT(ce.courierid) AS total_couriers
FROM employee e
LEFT JOIN courieremployee ce ON e.employeeid = ce.employeeid
GROUP BY e.employeeid, e.name;

-- 42. Locations and total payment amount received
SELECT l.locationid, l.locationname, SUM(p.amount) AS total_payment
FROM location l
LEFT JOIN payment p ON l.locationid = p.locationid
GROUP BY l.locationid, l.locationname;

-- 43. Couriers sent by the same sender
SELECT *
FROM courier
WHERE sendername IN (
  SELECT sendername
  FROM courier
  GROUP BY sendername
  HAVING COUNT(*) > 1
);

-- 44. Employees who share the same role
SELECT *
FROM employee
WHERE role IN (
  SELECT role
  FROM employee
  GROUP BY role
  HAVING COUNT(*) > 1
);

-- 45. Payments for couriers sent from the same location
SELECT p.*
FROM payment p
JOIN courier c ON p.courierid = c.courierid
WHERE senderaddress IN (
  SELECT senderaddress
  FROM courier
  GROUP BY senderaddress
  HAVING COUNT(*) > 1
);

-- 46. Couriers sent from the same location
SELECT *
FROM courier
WHERE senderaddress IN (
  SELECT senderaddress
  FROM courier
  GROUP BY senderaddress
  HAVING COUNT(*) > 1
);

-- 47. Employees and the number of couriers they have delivered
SELECT e.employeeid, e.name, COUNT(ce.courierid) AS delivered_couriers
FROM employee e
JOIN courieremployee ce ON e.employeeid = ce.employeeid
JOIN courier c ON ce.courierid = c.courierid
WHERE c.status = 'Delivered'
GROUP BY e.employeeid, e.name;

-- 48. Couriers with payment amount greater than courier service cost
SELECT p.courierid, p.amount, s.cost
FROM payment p
JOIN courierservices s ON p.courierid = s.serviceid
WHERE p.amount > s.cost;


--task 5 

-- 49. Couriers with weight greater than average weight
SELECT *
FROM courier
WHERE weight > (
  SELECT AVG(weight)
  FROM courier
);

-- 50. Employees with salary greater than average
SELECT *
FROM employee
WHERE salary > (
  SELECT AVG(salary)
  FROM employee
);

-- 51. Total cost of services where cost is less than max
SELECT SUM(cost) AS total_cost
FROM courierservices
WHERE cost < (
  SELECT MAX(cost)
  FROM courierservices
);

-- 52. Couriers that have been paid for
SELECT *
FROM courier
WHERE courierid IN (
  SELECT courierid
  FROM payment
);

-- 53. Locations where the max payment amount was made
SELECT locationid, amount
FROM payment
WHERE amount = (
  SELECT MAX(amount)
  FROM payment
);

-- 54. Couriers whose weight is greater than all those sent by a specific sender
SELECT *
FROM courier
WHERE weight > ALL (
  SELECT weight
  FROM courier
  WHERE sendername = 'SenderName' -- replace with actual sender name
);

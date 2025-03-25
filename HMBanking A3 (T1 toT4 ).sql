--ASSIGNMENT 3 

CREATE TABLE customers (
    customer_id INT PRIMARY KEY identity,
    first_name VARCHAR(50) ,
    last_name VARCHAR(50) ,
    dob DATE,
    email VARCHAR(100) UNIQUE ,
    phone_number VARCHAR(15) UNIQUE ,
    address TEXT 
);

CREATE TABLE accounts (
    account_id INT  PRIMARY KEY identity,
    customer_id INT,
    account_type varchar(50) check(account_type in ('savings', 'current', 'zero_balance')),
    balance DECIMAL(10,2)check (balance >= 0),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY identity ,
    account_id INT,
    transaction_type varchar(50) check( transaction_type in ('deposit', 'withdrawal', 'transfer')),
    amount DECIMAL(10,2) CHECK (amount > 0),
    transaction_date date default getdate(),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);



--TASK 2

INSERT INTO customers (first_name, last_name, dob, email, phone_number, address) VALUES
('Max', 'Smith', '2001-05-21', 'max.smith@email.com', '9876543210', '123 Tech Street, Delhi'),
('Sudharshana', 'Rao', '2002-08-14', 'sudharshana.rao@email.com', '9876543211', '456 Innovate Lane, Bangalore'),
('Mohsin', 'Ali', '2000-12-05', 'mohsin.ali@email.com', '9876543212', '789 Quantum Blvd, Mumbai'),
('Varsha', 'Patel', '2001-03-22', 'varsha.patel@email.com', '9876543213', '321 Logic Road, Chennai'),
('Elumalai', 'Krishnan', '1980-11-17', 'elumalai.krishnan@email.com', '9876543214', '654 Mentor Ave, Hyderabad'),
('Ravi', 'Kumar', '1995-07-10', 'ravi.kumar@email.com', '9876543215', '102 Digital Street, Pune'),
('Priya', 'Sharma', '1998-09-25', 'priya.sharma@email.com', '9876543216', '204 Cyber Park, Kolkata'),
('Arjun', 'Verma', '1993-06-18', 'arjun.verma@email.com', '9876543217', '305 AI Boulevard, Delhi'),
('Neha', 'Das', '1999-11-30', 'neha.das@email.com', '9876543218', '401 ML Road, Bangalore'),
('Karthik', 'Reddy', '1997-02-15', 'karthik.reddy@email.com', '9876543219', '501 IoT Colony, Hyderabad');

INSERT INTO accounts (customer_id, account_type, balance) VALUES
(1, 'savings', 15000.00),
(2, 'current', 25000.00),
(3, 'zero_balance', 5000.00),
(4, 'savings', 30000.00),
(5, 'current', 45000.00),
(6, 'savings', 12000.00),
(7, 'current', 18000.00),
(8, 'zero_balance', 4000.00),
(9, 'savings', 22000.00),
(10, 'current', 35000.00);


INSERT INTO transactions (account_id, transaction_type, amount, transaction_date) VALUES
(1, 'deposit', 5000.00, GETDATE()),
(2, 'withdrawal', 2000.00, GETDATE()),
(3, 'deposit', 10000.00, GETDATE()),
(4, 'transfer', 1500.00, GETDATE()),
(5, 'withdrawal', 5000.00, GETDATE()),
(6, 'deposit', 7000.00, GETDATE()),
(7, 'withdrawal', 3000.00, GETDATE()),
(8, 'deposit', 8000.00, GETDATE()),
(9, 'transfer', 2500.00, GETDATE()),
(10, 'withdrawal', 6000.00, GETDATE());

--1. Write a SQL query to retrieve the name, account type and email of all customers.
SELECT c.first_name, c.last_name, a.account_type, c.email
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id;



---2. Write a SQL query to list all transaction corresponding customer.

SELECT c.first_name, c.last_name, t.transaction_id, t.transaction_type, t.amount, t.transaction_date
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id  
JOIN transactions t ON a.account_id = t.account_id  
ORDER BY c.customer_id, t.transaction_date;

--3. Write a SQL query to increase the balance of a specific account by a certain amount.


UPDATE accounts
SET balance = balance + 10000
WHERE account_id = 1; 

select *from accounts



--4. Write a SQL query to Combine first and last names of customers as a full_name.


SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customers;


--5. Write a SQL query to remove accounts with a balance of zero where the account
type is savings.


DELETE FROM accounts
WHERE balance = 0 AND account_type = 'savings';
select account_id , account_type,balance  from accounts 




--6. Write a SQL query to Find customers living in a specific city.
SELECT * FROM customers
WHERE address LIKE '%Hyderabad%'; 



--7. Write a SQL query to Get the account balance for a specific account.

select balance from  accounts
where account_id='4'



--8. Write a SQL query to List all current accounts with a balance greater than $1,000.


select *  from  accounts
where account_type= 'current' and balance >1000


--9. Write a SQL query to Retrieve all transactions for a specific account.

select *from transactions 
where amount ='5000'



--10. Write a SQL query to Calculate the interest accrued on savings accounts based on a
given interest rate.

SELECT account_id, balance, 
       balance * 0.05 AS interest_accrued
FROM accounts
WHERE account_type = 'savings';



--11. Write a SQL query to Identify accounts where the balance is less than a specified
overdraft limit.
SELECT * 
FROM accounts 
WHERE balance < -500;  




--12. Write a SQL query to Find customers not living in a specific city.


SELECT * 
FROM customers 
WHERE address NOT LIKE '%Hyderabad%'; 







--Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins:


--1. Write a SQL query to Find the average account balance for all customers.


select avg(balance) as average_balance 
from accounts;



--2. Write a SQL query to Retrieve the top 10 highest account balances.

select top 10* from accounts 
order by balance desc 


--3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.


select sum(amount) as total_deposits 
from transactions 
where transaction_type = 'deposit' and transaction_date = '2025-03-01';



--4. Write a SQL query to Find the Oldest and Newest Customers.


select top 1 * from customers 
order by dob asc 


select top 1 * from customers 
order by dob desc 




--5. Write a SQL query to Retrieve transaction details along with the account type.

select t.transaction_id, t.account_id, a.account_type, t.transaction_type, t.amount, t.transaction_date
from transactions t
join accounts a on t.account_id = a.account_id;



--6. Write a SQL query to Get a list of customers along with their account details.

select c.customer_id, c.first_name, c.last_name, c.email, a.account_id, a.account_type, a.balance
from customers c
join accounts a on c.customer_id = a.customer_id;



--7. Write a SQL query to Retrieve transaction details along with customer information for a
specific account.

select c.first_name, c.last_name, c.email, t.transaction_id, t.transaction_type, t.amount, t.transaction_date
from transactions t
join accounts a on t.account_id = a.account_id
join customers c on a.customer_id = c.customer_id
where t.account_id ='1';




---8. Write a SQL query to Identify customers who have more than one account.


select c.customer_id, c.first_name, c.last_name, count(a.account_id) as account_count
from customers c
join accounts a on c.customer_id = a.customer_id
group by c.customer_id, c.first_name, c.last_name
having count(a.account_id) > 1;



--9. Write a SQL query to Calculate the difference in transaction amounts between deposits and
withdrawals.


select 
    account_id,  
    sum(case when transaction_type = 'deposit' then amount else 0 end) -  
    sum(case when transaction_type = 'withdrawal' then amount else 0 end) as transaction_difference  
from transactions  
group by account_id;


--10. Write a SQL query to Calculate the average daily balance for each account over a specified
period.




select account_id, avg(balance) as avg_daily_balance
from accounts
where account_id in (select distinct account_id from transactions where transaction_date between '2024-01-01' and '2024-12-31')
group by account_id;




--11. Calculate the total balance for each account type.

select account_type, sum(balance) as total_balance
from accounts
group by account_type;




--12. Identify accounts with the highest number of transactions order by descending order.


select account_id, count(transaction_id) as total_transactions
from transactions
group by account_id
order by total_transactions desc;

--13. List customers with high aggregate account balances, along with their account types.


select c.customer_id, c.first_name, c.last_name, a.account_type, sum(a.balance) as total_balance
from customers c
join accounts a on c.customer_id = a.customer_id
group by c.customer_id, c.first_name, c.last_name, a.account_type
having sum(a.balance) > 50000
order by total_balance desc;




--14. Identify and list duplicate transactions based on transaction amount, date, and account.


select account_id, transaction_date, amount, count(*) as duplicate_count
from transactions
group by account_id, transaction_date, amount
having count(*) > 1;







Tasks 4: Subquery and its type:
1. Retrieve the customer(s) with the highest account balance.

select customer_id, first_name, last_name, balance
from customers
join accounts on customers.customer_id = accounts.customer_id
where balance = (select max(balance) from accounts);


2. Calculate the average account balance for customers who have more than one account.


select avg(balance) as avg_balance
from accounts
where customer_id in (
    select customer_id  from accounts group by customer_id
    having count(account_id) > 1
);





3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.


select account_id, transaction_id, amount
from transactions
where amount > (select avg(amount) from transactions);



4. Identify customers who have no recorded transactions.


select customer_id, first_name, last_name
from customers
where customer_id not in (select distinct customer_id from transactions);

5. Calculate the total balance of accounts with no recorded transactions.

select sum(balance) as total_balance_no_transactions
from accounts
where account_id not in (select distinct account_id from transactions);






6. Retrieve transactions for accounts with the lowest balance.




select transaction_id, account_id, amount
from transactions
where account_id in (
    select account_id
    from accounts
    where balance = (select min(balance) from accounts)
	);

7. Identify customers who have accounts of multiple types.



select customer_id, first_name, last_name
from customers
where customer_id in (
    select customer_id from accounts  group by customer_id
    having count(distinct account_type) > 1
);








8. Calculate the percentage of each account type out of the total number of accounts.



select account_type, 
       (count(account_id) * 100.0) / (select count(*) from accounts) as percentage
from accounts
group by account_type;

9. Retrieve all transactions for a customer with a given customer_id.



select transaction_id, account_id, amount, transaction_date
from transactions
where account_id in (select account_id from accounts where customer_id = :customer_id);




10. Calculate the total balance for each account type, including a subquery within the SELECT
clause.

select account_type, 
       (select sum(balance) from accounts a2 where a1.account_type = a2.account_type) as total_balance
from accounts a1
group by account_type;

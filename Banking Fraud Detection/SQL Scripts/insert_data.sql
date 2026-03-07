-- Customers
INSERT INTO customers (customer_id, name, email, city, signup_date) VALUES
(1,'Alice','alice@gmail.com','New York','2022-01-10'),
(2,'Bob','bob@gmail.com','Los Angeles','2022-03-15'),
(3,'Charlie','charlie@gmail.com','Chicago','2022-05-20');

-- Accounts
INSERT INTO accounts (account_id, customer_id, account_type, balance, open_date) VALUES
(1,1,'Savings',5000.00,'2022-01-11'),
(2,2,'Checking',12000.00,'2022-03-16'),
(3,3,'Savings',8000.00,'2022-05-21');

-- Transactions
INSERT INTO transactions (transaction_id, account_id, transaction_date, amount, transaction_type, status) VALUES
(1,1,'2024-03-01 10:05:00',3000.00,'Debit','Completed'),
(2,1,'2024-03-01 11:10:00',2500.00,'Debit','Completed'),
(3,2,'2024-03-01 09:00:00',200.00,'Debit','Completed'),
(4,3,'2024-03-01 15:30:00',9000.00,'Debit','Completed'),
(5,2,'2024-03-02 12:00:00',15000.00,'Debit','Completed'),
(6,3,'2024-03-02 16:00:00',500.00,'Credit','Completed');
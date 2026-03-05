-- Customers
INSERT INTO customers VALUES
(1,'Alice','alice@gmail.com','New York','2023-01-10'),
(2,'Bob','bob@gmail.com','Los Angeles','2023-03-15'),
(3,'Charlie','charlie@gmail.com','Chicago','2023-05-20'),
(4,'David','david@gmail.com','Houston','2023-02-25'),
(5,'Eva','eva@gmail.com','Phoenix','2023-04-05');

-- Products
INSERT INTO products VALUES
(1,'Laptop','Electronics',1000.00,50),
(2,'Headphones','Electronics',100.00,200),
(3,'Shoes','Fashion',150.00,150),
(4,'T-Shirt','Fashion',25.00,300),
(5,'Coffee Maker','Home Appliances',80.00,100);

-- Orders
INSERT INTO orders VALUES
(1,1,'2024-01-05',1100.00,'Delivered'),
(2,2,'2024-01-10',150.00,'Delivered'),
(3,3,'2024-01-15',175.00,'Cancelled'),
(4,1,'2024-02-01',80.00,'Delivered'),
(5,4,'2024-02-05',25.00,'Delivered');

-- Order_Items
INSERT INTO order_items VALUES
(1,1,1,1,1000.00),
(2,1,2,1,100.00),
(3,2,3,1,150.00),
(4,3,4,1,25.00),
(5,3,3,1,150.00),
(6,4,5,1,80.00),
(7,5,4,1,25.00);

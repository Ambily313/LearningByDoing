Create database Practice;
use practice

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    region VARCHAR(20),
    signup_date DATE
);

INSERT INTO customers VALUES
(1, 'Alice Johnson', 'alice@gmail.com', 'North', '2024-01-05'),
(2, 'Bob Smith', 'bob@yahoo.com', 'South', '2024-02-15'),
(3, 'Charlie Lee', 'charlie@gmail.com', 'East', '2023-12-28'),
(4, 'Diana King', 'diana@hotmail.com', 'West', '2024-01-20'),
(5, 'Ethan Brown', 'ethan@gmail.com', 'North', '2024-03-01');


PRIMARYCREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(20),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 800.00),
(102, 'Smartphone', 'Electronics', 500.00),
(103, 'Desk Chair', 'Furniture', 150.00),
(104, 'Coffee Maker', 'Appliances', 80.00),
(105, 'Headphones', 'Electronics', 120.00),
(106, 'Office Desk', 'Furniture', 200.00);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(1001, 1, '2024-01-10', 'Completed'),
(1002, 2, '2024-02-17', 'Completed'),
(1003, 3, '2024-03-05', 'Pending'),
(1004, 1, '2024-03-15', 'Completed'),
(1005, 4, '2024-04-01', 'Completed'),
(1006, 5, '2024-04-03', 'Completed'),
(1007, 2, '2024-04-15', 'Completed');

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 105, 2),
(3, 1002, 103, 1),
(4, 1003, 102, 1),
(5, 1004, 104, 3),
(6, 1005, 106, 1),
(7, 1006, 101, 1),
(8, 1006, 102, 2),
(9, 1007, 105, 1);


CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),
    region VARCHAR(20),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO sales VALUES
(1, 101, '2024-01-10', 1, 800.00, 'North'),
(2, 105, '2024-01-10', 2, 240.00, 'North'),
(3, 103, '2024-02-17', 1, 150.00, 'South'),
(4, 102, '2024-03-05', 1, 500.00, 'East'),
(5, 104, '2024-03-15', 3, 240.00, 'North'),
(6, 106, '2024-04-01', 1, 200.00, 'West'),
(7, 101, '2024-04-03', 1, 800.00, 'North'),
(8, 102, '2024-04-03', 2, 1000.00, 'North'),
(9, 105, '2024-04-15', 1, 120.00, 'South');


CREATE TABLE logins (
    login_id INT PRIMARY KEY,
    customer_id INT,
    login_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO logins VALUES
(1, 1, '2024-01-06'),
(2, 1, '2024-01-10'),
(3, 2, '2024-02-16'),
(4, 2, '2024-02-17'),
(5, 3, '2023-12-29'),
(6, 3, '2024-01-02'),
(7, 4, '2024-01-21'),
(8, 4, '2024-01-22'),
(9, 5, '2024-03-02');



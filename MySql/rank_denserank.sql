use revision

create table sales (
id int primary key auto_increment,
department varchar(50),
sales_amount int );

INSERT INTO sales (department, sales_amount) VALUES
('Electronics', 5000),
('Clothing', 3000),
('Grocery', 7000),
('Electronics', 8000),
('Clothing', 4500),
('Grocery', 7000),
('Furniture', 6000),
('Electronics', 5000),
('Clothing', 3000),
('Furniture', 6000);


select * , rank() over (order by sales_amount desc) as salesrank,
dense_rank() over (order by sales_amount desc) as sales_denserank,
row_number() over (order by sales_amount desc) as sales_rownumber,
from sales;

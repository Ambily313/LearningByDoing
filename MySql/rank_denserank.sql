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
row_number() over (order by sales_amount desc) as sales_rownumber
from sales;
-- 1. Retrieve the sales records along with a ranking based on the sales_amount in descending order.

select *, rank() over ( order by sales_amount desc) as sales_rank
from sales

-- 2.Assign a unique rank to each sale within each department, ordering by sales_amount in descending order.

select  department, sales_amount, row_number() over (partition by department order by sales_amount desc) sales_dept
from sales;

-- 3. Find the highest-ranked sales record for each department.

with sales_ranking as(
select  *,dense_rank() over (partition by department order by sales_amount desc)  as sales_rank
from sales)
select * from sales_ranking 
where  sales_rank=1

-- 4. Identify the second-highest sales_amount across all departments.

with sales_ranking as(
select  *,dense_rank() over ( order by sales_amount desc)  as sales_rank
from sales)

select * from sales_ranking 
where  sales_rank=2

-- 5.Generate a list where sales with the same sales_amount receive the same rank, but the next rank is not skipped.

select  *,dense_rank() over ( order by sales_amount desc)  as sales_rank
from sales

-- 6.Rank all sales transactions but ensure that no two sales have the same rank, even if they have the same sales_amount.

select  *, row_number() over (  order by sales_amount desc)  as sales_rank
from sales

-- 7. Find the top 3 sales transactions in each department based on sales_amount.

with sales_ranking as(
select  *, row_number()  over ( partition by department order by sales_amount desc)  as sales_rank
from sales)
select * from sales_ranking where sales_rank <=3

-- 8 . Assign sequential numbers to each row, ordering them first by department (alphabetically) and then by sales_amount (highest to lowest).
 
 select * , row_number () over (order by department, sales_amount desc) as sales_rank
 from sales 
 
 
-- 9.Identify and return the lowest-ranked sales record in each department.

with sales_ranking as(
select * ,dense_rank () over (partition by department order by sales_amount asc) as sales_rank
 from sales)
 select * from sales_ranking where sales_rank =1
 
-- 10.Retrieve sales data where the assigned rank is exactly 3 (third position) for each department.
with sales_ranking as(
select * , row_number () over (partition by department order by sales_amount desc) as sales_rank
 from sales)
 select * from sales_ranking where sales_rank =3

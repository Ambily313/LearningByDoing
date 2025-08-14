use practice

select * from customers;
select * from logins;
select * from orders;
select * from order_items;
select * from products;
select * from sales;


-- Q: Retrieve all rows from the orders table where order_date is in 2024 and status is 'Completed'

select * from orders where( status='Completed' and year(order_date)=2024 );

-- Q: Find the top 5 most expensive products from the products table.

select * from  products 
order by price desc
limit 5

-- Q: Count how many orders each customer has placed in the orders table. Show customer_id and order_count.

select c.customer_id,c.name,count(o.customer_id) as order_count
from customers c
left join orders o on c.customer_id=o.customer_id
group by c.customer_id,c.name;

-- Count the number of distinct customers who placed an order in January 2024

select count(distinct c.customer_id)  as customer_count
from customers c
 join orders o on c.customer_id=o.customer_id
where year(o.order_date)=2024 and month(o.order_date)=1;

-- Q: From the sales table, find the total sales amount for each region, but split into columns online_sales and offline_sales.

select 
    region,
    sum(case when sales_channel='online' then total_amount else 0 end) as online_sales,
	sum(case when sales_channel='offline' then total_amount else 0 end ) as offline_sales
 from sales
 group by region
 order by region


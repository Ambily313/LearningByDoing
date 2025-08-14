select * from customers;
select * from logins;
select * from orders;
select * from order_items;
select * from products;


-- Q: Retrieve all rows from the orders table where order_date is in 2024 and status is 'Completed'

select * from orders where( status='Completed' and year(order_date)=2024 );

-- Q: Find the top 5 most expensive products from the products table.

select * from  products 
order by price desc
limit 5

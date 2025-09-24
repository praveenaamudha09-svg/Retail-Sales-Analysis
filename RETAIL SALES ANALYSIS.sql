create database retail;
use retail;
select* from brands;
select *from categories;
select* from customers;
select *from order_items;
select *from orders;
select * from products;
select * from staff;
select * from stocks;
select * from stores;


#task 3 Join orders, order_items, and products to display detailed line items. 
select * from retail.order_items as a
inner join retail.orders as b
on a.order_id = b.order_id
inner join retail.products as c
on c.product_id = a. product_id;


#task 4  Write a query to group sales (total_price) by each store_id. 

select b.store_id, sum(a.total_price) as totalprice from retail.order_items as a 
inner join retail.orders as b
on a.order_id = b. order_id
group by b.store_id;

#task 5  Use ORDER BY and LIMIT to get the top 5 most sold products by quantity. 

select b.product_id,b.product_name, count(a.quantity) as total_sold
from order_items as a
inner join products as b on a.product_id=b.product_id
group by b.product_id,b.product_name
order by total_sold desc limit 5;


#task 6
select a.customer_id,sum(b.total_price)as total_revenue,count(b.order_id)as total_orders,sum(b.item_id) as total_items
from orders as a
inner join order_items as b
on a.order_id=b.order_id
group by a.customer_id;

#task7
select c.customer_id,c.first_name,sum(b.total_price) as total_revenue,
case
when sum(b.total_price) < 500 then"low"
when sum(b.total_price) < 4000 then "medium"
else "high"
end as segment
from orders as a
inner join order_items as b
on a.order_id=b.order_id
inner join customers as c
on a.customer_id=c.customer_id
group by c.customer_id,c.first_name
order by total_revenue;



#task 8
select a.order_id,c.first_name,Sum(b.total_price)as total_revenue
from retail.orders as a
inner join retail.order_items as b
on a.order_id=b.order_id
inner join retail.staff as c
on a.staff_id=c.staff_id
group by a.order_id,c.first_name;




#task 9
select a.product_name,b.quantity
from products as a
inner join stocks as b
on a.product_id=b.product_id
where quantity <10;


#task 10
create table segement_customer(
segement_id int primary key,
customer_id int,
total_spent varchar(80),
total_orders int ,
total_items int,
segment varchar(80));
select*from segement_customer;



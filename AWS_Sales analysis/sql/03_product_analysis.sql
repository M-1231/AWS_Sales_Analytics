-- Revenue by Category 
select CategoryName,
round(sum(sales),2) as Revenue 
from sales_master 
group by CategoryName
order by Revenue desc;

-- Quantity Sold by Category
select CategoryName, sum(OrderQuantity) as Units_sold
from sales_master
group by CategoryName 
order by units_sold desc;

-- Revenue by Subcategory
select SubCategoryName,
round(sum(sales),2) as Revenue
from sales_master
group by SubCategoryName
order by Revenue desc;

-- Top 10 Products by revenue 
select ProductName, CategoryName,
round(sum(sales),2) as revenue
from sales_master
group by ProductName, CategoryName
order by Revenue desc 
limit 10;

-- Top 10 Products by Quantity 
select ProductName,
sum(Orderquantity) as units_sold
from sales_master
group by ProductName
order by Units_sold desc
limit 10;

-- Product Revenue ranking
select ProductName,
round(sum(sales),2) as Revenue,
rank() over(order by sum(sales) desc) as revenue_rank
from sales_master
group by ProductName;

-- Revenue Contribution
select ProductName,
round(sum(sales),2) as revenue,
round(sum(sales)/(select sum(sales) from sales_master)*100,2) as Revenue_Contribution_pct
from sales_master 
group by ProductName
order by revenue desc
limit 10;

-- Top Products by Country
select Country,Productname,round(sum(sales),2) as Revenue
from sales_master
group by Country,ProductName
order by Revenue desc;

-- Category Profitability
select CategoryName,
round(sum(Profit_After_Discount),2) as Profit
from sales_master
group by CategoryName
order by Profit desc;

-- Average Selling Price by Category
select CategoryName, 
round(avg(RelatedPrice),2) as Avg_Price
from sales_master
group by CategoryName 
order by Avg_Price desc;

-- Top Product within each Category
with product_revenue as (
select  CategoryName,ProductName,
round(sum(sales),2) as Revenue,
rank() over(partition by CategoryName order by sum(sales) desc) as rnk
from sales_master
group by ProductName,CategoryName
order by Revenue desc)
select * from product_revenue 
where rnk=1;

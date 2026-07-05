-- Profit by Category

select CategoryName,round(sum(profit_after_discount),2) as Profit 
from sales_master
group by categoryName
order by profit desc;

-- Profit by Country
select Country,round(sum(profit_after_discount),2) as Profit 
from sales_master
group by Country
order by profit desc;

-- Profit by Occupation
select Occupation,round(sum(profit_after_discount),2) as Profit 
from sales_master
group by Occupation
order by profit desc;

-- Top 10 Most Profitable Products
select ProductName,round(sum(profit_after_discount),2) as Profit 
from sales_master
group by ProductName
order by profit desc
limit 10;

-- Profit Margin by category
select CategoryName,round(sum(profit_after_discount),2) as Profit,
round(sum(sales),2) as revenue,
round(sum(profit_after_discount)/ sum(sales)*100,2) as Profit_Margin_Pct
from sales_master
group by categoryName
order by profit_margin_pct desc;

-- Profit per Customer by Occupation
select Occupation,round(sum(profit_after_discount),2) as Profit,
count(distinct CustomerKey) as customers,
round(sum(profit_after_discount)/count(distinct CustomerKey),2) as profit_per_customer 
from sales_master
group by Occupation
order by profit_per_customer desc;

-- Most Profitable Country Within Each Continent
with country_profit as (
select Continent,Country,
round(sum(profit_after_discount),2) as Profit,
rank() over(partition by Continent order by sum(profit_after_discount) desc) as rnk
from sales_master
group by Continent,Country
)
select * from country_profit 
where rnk=1;

-- Product Profit Contribution
select ProductName,
round(sum(profit_after_discount),2) as profit,
round(sum(profit_after_discount)/(select sum(profit_after_discount) from sales_master)*100,2) as Profit_Contry
from sales_master
group by ProductName
order by Profit_Contry desc;
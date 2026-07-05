-- Revenue by Occupation 
select Occupation, round(sum(sales),2) as revenue 
from sales_master
group by Occupation order by Revenue desc;

-- Customers by Occupation
select Occupation, count(distinct CustomerKey) as Customers 
from sales_master
group by Occupation
order by Customers desc;

-- Revenue per Customer by Occupation 
select Occupation,
round(sum(sales),2) as Revenue,
count(distinct CustomerKey) as Customers ,
round(round(sum(sales),2)/count(distinct CustomerKey),2) as Revenue_per_customer
from sales_master
group by Occupation
order by Revenue_per_Customer desc;

-- Revenue by Gender
select Gender,round(sum(sales),2) as revenue
from sales_master
group by Gender;

-- Revenue by Education level
select EducationLevel,round(sum(sales),2) as revenue
from sales_master
group by EducationLevel;

-- Top 10 CUstomers by Revenue 
select CustomerKey,
FullName,round(sum(sales),2) as Revenue
from sales_master
group by CustomerKey,FullName
order by Revenue desc
limit 10;

-- Customer Segmentation by AgeGroup

select 
     case
         when CurrentAge between 46 and 55 then '46-55'
         when CurrentAge between 56 and 65 then '56-65'
         when CurrentAge between 66 and 75 then '66-75'
         else '75+'
         end as AgeGroup,
         round(sum(sales),2) as Revenue 
from sales_master
group by AgeGroup; 

-- High Value Customers 
select CustomerKey,FullName,
round(sum(sales),2) as Revenue 
from sales_master
group by CustomerKey,FullName
having sum(sales)>5000
order by revenue desc; 
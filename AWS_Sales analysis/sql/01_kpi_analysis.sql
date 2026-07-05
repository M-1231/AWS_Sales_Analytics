use aws_sales;
CREATE table product_master AS

SELECT

p.*,

ps.SubcategoryName,

pc.CategoryName

FROM products p

LEFT JOIN product_subcat ps
ON p.ProductSubcategoryKey =
   ps.ProductSubcategoryKey

LEFT JOIN product_cat pc
ON ps.ProductCategoryKey =
   pc.ProductCategoryKey;


CREATE table sales_master AS

SELECT

s.*,

c.FullName,
c.Gender,
c.AnnualIncome,
c.EducationLevel,
c.Occupation,
c.CurrentAge,

p.ProductName,
p.ProductCost,
p.ProductPrice,
p.Profit_After_Discount,
p.SubcategoryName,
p.CategoryName,

t.Region,
t.Country,
t.Continent

FROM aws_sales_csv s

LEFT JOIN customers c
ON s.CustomerKey = c.CustomerKey

LEFT JOIN product_master p
ON s.ProductKey = p.ProductKey

LEFT JOIN territories t
ON s.TerritoryKey = t.SalesTerritoryKey;

select count(*) from sales_master;
-- Total Revenue

SELECT
    ROUND(SUM(Sales),2) AS Total_Revenue
FROM sales_master;

-- Total Orders
select count(distinct ordernumber) as Total_Orders 
from sales_master;

-- Total Customers

SELECT
    COUNT(DISTINCT CustomerKey) AS Total_Customers
FROM sales_master;

-- Total Units Sold

SELECT
    SUM(OrderQuantity) AS Total_Units_Sold
FROM sales_master;

-- OrderYear

set sql_safe_updates=0;
ALTER table sales_master
ADD COLUMN OrderYear INT;

UPDATE sales_master
SET OrderYear = YEAR(STR_TO_DATE(OrderDate, '%d-%b-%y'));

-- Revenue Trend by Year

select OrderYear, round(sum(sales),2) as revenue
from sales_master
group by OrderYear
order by OrderYear;

-- Year over year growth

with yearly_sales as
( select OrderYear,sum(sales) as revenue from sales_master
group by OrderYear)
select OrderYear,Revenue,
Lag(Revenue) over (order by OrderYear) as Previous_Year_Revenue,
round((Revenue-lag(revenue) over(order by OrderYear))/lag(revenue) over (order by OrderYear)*100,2) 
as growth_percentage
from yearly_sales;

-- Revenue by Country
SELECT
    Country,
    ROUND(SUM(Sales),2) AS Revenue
FROM sales_master
GROUP BY Country
ORDER BY Revenue DESC;

-- Profit by Country
SELECT
    Country,
    ROUND(SUM(Profit_After_Discount),2) AS Profit
FROM sales_master
GROUP BY Country
ORDER BY Profit DESC;
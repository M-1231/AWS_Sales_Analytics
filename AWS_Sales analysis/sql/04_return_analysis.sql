-- Most Returned Products 
select p.ProductName,
sum(r.returnquantity) as Total_returns 
from returns r 
join products p
on r.ProductKey=p.ProductKey
group by p.productname
order by Total_returns desc
limit 10;

-- Returns by Category
select pc.CategoryName,
sum(r.returnquantity) as Total_Returns 
from returns r
join products p on r.Productkey=p.Productkey
join product_subcat ps on p.ProductSubcategoryKey=ps.ProductSubcategoryKey
join product_cat pc on ps.ProductCategoryKey=pc.ProductCategoryKey
group by pc.CategoryName
order by Total_returns desc;

-- Returns by Country
select t.Country,
sum(r.returnquantity) as Total_returns 
from returns r 
join territories t on t.SalesTerritoryKey=r.TerritoryKey
group by t.Country
order by Total_returns desc;

-- Product Return Rate 
with product_sales as (
select ProductKey,
ProductName,
sum(OrderQuantity) as Sold_qty
from sales_master
group by ProductKey,ProductName
),
product_returns as (
select ProductKey,
sum(ReturnQuantity) as Return_Qty
from returns 
group by ProductKey
)
select ps.ProductName,
ps.Sold_Qty,
coalesce(pr.Return_Qty,0) as Return_Qty,
round(coalesce(pr.Return_Qty,0)/ps.Sold_qty*100,2) as Return_Rate
from product_sales ps 
join product_returns pr
on ps.ProductKey=pr.ProductKey
order by Return_Rate desc;

-- Return Rate (Products with Meaningful Sales)
with product_sales as (
select ProductKey,
ProductName,
sum(OrderQuantity) as Sold_qty
from sales_master
group by ProductKey,ProductName
),
product_returns as (
select ProductKey,
sum(ReturnQuantity) as Return_Qty
from returns 
group by ProductKey
)
select ps.ProductName,
ps.Sold_Qty,
coalesce(pr.Return_Qty,0) as Return_Qty,
round(coalesce(pr.Return_Qty,0)/ps.Sold_qty*100,2) as Return_Rate
from product_sales ps 
join product_returns pr
on ps.ProductKey=pr.ProductKey
where ps.Sold_qty>=100
order by Return_Rate desc;

-- Return Rate by Category
with sales_category as (
select CategoryName,
sum(OrderQuantity) as Sold_Qty
from sales_master
group by CategoryName
),
return_category as (
select pc.categoryname,
sum(r.returnquantity) as Return_qty
from returns r
join products p on r.ProductKey=p.ProductKey
join product_subcat ps on ps.ProductSubcategoryKey=p.ProductSubcategoryKey
join product_cat pc on pc.ProductCategoryKey=ps.ProductCategoryKey
group by pc.CategoryName
)
select s.CategoryName,
s.Sold_Qty,r.Return_qty,
round(r.Return_qty/s.Sold_qty*100,2) as Return_Rate
from sales_category s
join return_category r
on s.CategoryName=r.CategoryName
order by Return_Rate desc;

-- Highest Returned Product in Each Category
with category_returns as (
select pc.CategoryName,
p.ProductName,
sum(r.returnquantity) as Return_qty,
rank() over(partition by pc.CategoryName order by sum(r.returnQuantity) desc) as rnk
from returns r
join products p on r.ProductKey=p.ProductKey
join product_subcat ps on ps.ProductSubcategoryKey=p.ProductSubcategoryKey
join product_cat pc on pc.ProductCategoryKey=ps.ProductCategoryKey
group by pc.CategoryName,p.ProductName
)
select * from category_returns 
where rnk=1; 
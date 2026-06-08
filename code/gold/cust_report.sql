USE [DataWarehouse]
GO

/****** Object:  View [gold].[cust_report]    Script Date: 09-06-2026 00:29:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create view  [gold].[cust_report] as
WITH customer_spending AS (
SELECT
c.cust_key,
SUM(f.sales) AS total_spending,
MIN(order_date) AS first_order,
MAX(order_date) AS last_order,
DATEDIFF (month, MIN(order_date), MAX(order_date)) AS lifespan,
SUM(f.Quantity) as Total_Quantity,
count(distinct Order_Num) AS total_Orders,
count(prd_key) as total_Products,
SUM(f.Price) as Total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.cust_key = c.cust_key
GROUP BY c.cust_key
)

SELECT 
cs.cust_key,
c.firstname + ' ' + c.lastname as Name_,
datediff(year,c.birth_date,c.create_date) as age,
CASE 
	WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
	WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
	ELSE 'New'
END customer_segment,
lifespan,
case
	when datediff(year,c.birth_date,c.create_date) <= 30then 'Below 30'
	when datediff(year,c.birth_date,c.create_date) between 30 and 55 then '30-55'
	else 'Above 55'
end age_category,
total_Orders,
Total_Quantity,
Total_sales,
last_order,
DATEDIFF (month, last_order, getdate()) as recency,
case
	when Total_sales = 0 then 0 
	else Total_sales/total_Orders
end as Avg_Order_value,
case
	when lifespan = 0 then 0
	else Total_sales/lifespan
end as Avg_Monthly_Spend
FROM customer_spending as cs
LEFT JOIN gold.dim_customers c
ON cs.cust_key = c.cust_key











GO



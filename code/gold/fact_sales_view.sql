USE [DataWarehouse]
GO

/****** Object:  View [gold].[fact_sales]    Script Date: 09-06-2026 00:33:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [gold].[fact_sales] as 

SELECT 
[sls_ord_num] Order_Num,
pr.prd_key,
cu.cust_key,
[sls_order_dt] Order_date,
[sls_ship_dt] Ship_date,
[sls_due_dt] Due_date,
[sls_sales] Sales,
[sls_quantity] Quantity,
[sls_price] Price
  FROM [DataWarehouse].[silver].[crm_sales_details] sd
left join gold.dim_products pr
on sd.sls_prd_key = pr.product_num
left join gold.dim_customers cu
on sd.sls_cust_id = cu.cust_id
GO



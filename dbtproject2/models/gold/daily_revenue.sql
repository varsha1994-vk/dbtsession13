{{
  config(
      materialized='table',
      schema='gold'
        )
}}

WITH CTE_revenue AS(
    SELECT
         * FROM SESSION13.SESSION13SCH_silver.silver_orders
)

SELECT order_date,
sum(amount) as total_revenue
 FROM CTE_revenue group by order_date
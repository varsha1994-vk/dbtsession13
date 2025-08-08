{{
  config(
      materialized='table',
      schema='silver'
        )
}}

WITH CTE_ORDERS AS(
    SELECT
         * FROM SESSION13.SESSION13SCH_bronze.RAW_ORDERS
)

SELECT order_id,
customer_id,
try_to_date(order_date) as order_date,
amount
 FROM CTE_ORDERS
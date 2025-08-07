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

SELECT * FROM CTE_ORDERS
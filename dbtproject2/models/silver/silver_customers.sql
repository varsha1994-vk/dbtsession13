{{
  config(
      materialized='table',
      schema='silver'
        )
}}

WITH CTE_customer AS(
    SELECT
         * FROM SESSION13.SESSION13SCH_bronze.RAW_CUSTOMERS
)

SELECT * FROM CTE_CUSTOMER
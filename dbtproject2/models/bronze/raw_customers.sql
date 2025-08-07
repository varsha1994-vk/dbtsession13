{{
  config(
      materialized='table',
      schema='bronze'
        )
}}

WITH CTE_customer AS(
    SELECT
         * FROM SESSION13.SESSION13SCH.CUSTOMERS
)

SELECT * FROM CTE_CUSTOMER
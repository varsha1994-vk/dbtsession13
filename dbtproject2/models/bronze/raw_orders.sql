{{
  config(
      materialized='table',
      schema='bronze'
        )
}}

WITH CTE_ORDERS AS(
    SELECT
         * FROM SESSION13.SESSION13SCH.ORDERS
)

SELECT * FROM CTE_ORDERS
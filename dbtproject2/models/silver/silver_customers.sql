{{
  config(
      materialized='table',
      schema='silver'
        )
}}

WITH CTE_customer AS(
    SELECT * FROM SESSION13.SESSION13SCH_bronze.RAW_CUSTOMERS
)

SELECT CUSTOMER_ID,
    initcap(name) as name,
    age,
    initcap(city) as city,
    CASE WHEN age >18 THEN 'ADULT' ELSE 'MINOR' END AS AGE_GROUP
    FROM CTE_CUSTOMER
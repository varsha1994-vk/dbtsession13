WITH CTE_customer AS (
    SELECT
         * FROM SESSION13.SESSION13SCH.CUSTOMERS
)

{% if var('run_mode', 'incremental') == 'initial' %}

{{ config(
    materialized='table',
    schema='bronze'
) }}

SELECT * FROM CTE_CUSTOMER

{% else %}

{{ config(
    materialized='incremental',
    schema='bronze'
) }}

SELECT * FROM CTE_CUSTOMER
WHERE customer_id > (
    SELECT MAX(customer_id)
    FROM SESSION13.SESSION13SCH_BRONZE.RAW_CUSTOMERS
)

{% endif %}
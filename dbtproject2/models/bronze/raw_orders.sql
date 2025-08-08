WITH CTE_orders AS (
    SELECT
         * FROM SESSION13.SESSION13SCH.ORDERS)
{{
 config(
schema='BRONZE'
 )
}}

{% if var('run_mode', 'incremental') == 'initial' %}
  {{ config(schema='BRONZE',materialized='table') }}

  SELECT * FROM CTE_ORDERS
{% else %}

  {{ config(materialized='incremental') }}

  SELECT * FROM CTE_ORDERS
  WHERE order_id > (SELECT MAX(order_id) FROM SESSION13.SESSION13SCH_BRONZE.RAW_ORDERS)

{% endif %}
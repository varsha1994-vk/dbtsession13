{% snapshot orders_snapshot%}
{{
  config(
    target_schema='BRONZE',
    unique_key='order_id',
    strategy='timestamp',
    updated_at='updated_at',
    invalidate_hard_deletes=True
  )
}}

SELECT * FROM SESSION13.SESSION13SCH_BRONZE.RAW_ORDERS
{% endsnapshot %}

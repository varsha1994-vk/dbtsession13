{% snapshot customers_snapshot %}
{{
  config(
    target_schema='BRONZE',
    unique_key='customer_id',
    strategy='check',
    check_cols=['name','age', 'city']
  )
}}

SELECT * FROM session13.session13sch_bronze.RAW_CUSTOMERS

{% endsnapshot %}
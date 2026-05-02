{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

select
    o.order_id,
    c.customer_sk,
    o.order_date,
    o.amount,
    o.status,
    o.updated_at
from {{ ref('stg_orders') }} o
left join {{ ref('dim_customers') }} c
on o.customer_id = c.customer_id

{% if is_incremental() %}
where o.updated_at > (select max(updated_at) from {{ this }})
{% endif %}
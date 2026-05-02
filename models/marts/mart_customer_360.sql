{{ config(materialized='table') }}

select
    c.customer_id,
    c.first_name,
    c.last_name,
    coalesce(o.total_orders,0) as total_orders,
    coalesce(o.total_amount,0) as total_amount
from {{ ref('stg_customers') }} c
left join {{ ref('int_customer_orders') }} o
on c.customer_id = o.customer_id
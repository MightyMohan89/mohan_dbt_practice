select
    customer_id,
    count(*) as total_orders,
    sum(amount) as total_amount
from {{ ref('stg_orders') }}
where status = 'completed'
group by customer_id
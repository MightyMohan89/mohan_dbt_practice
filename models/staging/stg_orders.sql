select
    order_id,
    customer_id,
    order_date,
    amount,
    status,
    updated_at
from {{ source('raw', 'orders') }}
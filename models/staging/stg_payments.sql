select
    payment_id,
    order_id,
    payment_method,
    amount as payment_amount,
    payment_date
from {{ source('raw', 'payments') }}
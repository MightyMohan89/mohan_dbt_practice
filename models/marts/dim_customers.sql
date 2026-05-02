{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_sk,
    customer_id,
    first_name,
    last_name,
    email,
    dbt_valid_from,
    dbt_valid_to
from {{ ref('customers_snapshot') }}
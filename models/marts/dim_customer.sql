
select
    customer_key,
    customer_name,
    customer_address,
    customer_phone,
    account_balance,
    market_segment,
    customer_nation_name,
    customer_region_name
from {{ ref('int_customer') }}
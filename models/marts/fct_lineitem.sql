
with order_items as (
    select * from {{ ref('int_order_items') }}
)

select
    order_key,
    part_key,
    supplier_key,
    customer_key,
    cast(to_char(ship_date, 'YYYYMMDD') as integer) as date_key,
    line_number,
    order_status,
    order_priority,
    ship_mode,
    return_flag,
    quantity,
    extended_price,
    discount,
    tax,
    revenue,
    net_amount
from order_items
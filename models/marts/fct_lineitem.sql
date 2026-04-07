
with order_items as (
    select * from {{ ref('int_order_items') }}
),

date as (
    select * from {{ ref('dim_date') }}
),

supplier as (
    select * from {{ ref('dim_supplier') }}
),

customer as (
    select * from {{ ref('dim_customer') }}
),

part as (
    select * from {{ ref('dim_part') }}
)

select
    order_key,
    s.supplier_key,
    s.supplier_name,
    c.customer_key,
    c.customer_name,
    d.date_key as ship_full_date,
    d.year as ship_year,
    d.quarter as ship_quarter,
    d.month as ship_month,
    p.part_key,
    p.part_name,
    p.part_type,
    p.material_category as part_material_category,
    line_number,
    order_status,
    order_priority_rank,
    order_priority_label,
    ship_mode,
    return_flag,
    available_quantity,
    unit_supply_cost,
    quantity,
    extended_price,
    discount,
    tax,
    revenue,
    net_amount,
    gross_margin
from order_items oi
left join date d
    on cast(to_char(ship_date, 'YYYYMMDD') as integer) = d.date_key
left join supplier s
    on oi.supplier_key = s.supplier_key
left join customer c
    on oi.customer_key = c.customer_key
left join part p
    on oi.part_key = p.part_key
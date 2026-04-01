
with lineitems as (
    select * from {{ ref('stg_TPCH__LINEITEM') }}
),

orders as (
    select * from {{ ref('stg_TPCH__ORDERS') }}
),

int_order_items as (
    select
        li.l_orderkey as order_key,
        li.l_partkey as part_key,
        li.l_suppkey as supplier_key,
        li.l_linenumber as line_number,
        li.l_quantity as quantity,
        li.l_extendedprice as extended_price,
        li.l_discount as discount,
        li.l_tax as tax,
        li.l_shipdate as ship_date,
        li.l_shipmode as ship_mode,
        li.l_returnflag as return_flag,
        o.o_custkey      as customer_key,
        o.o_orderstatus  as order_status,
        SPLIT_PART(o.o_orderpriority, '-', 1) as order_priority_rank,
        SPLIT_PART(o.o_orderpriority, '-', 2) as order_priority_label,
        SPLIT_PART(o.o_clerk, '#', 2) as clerk,
        li.l_extendedprice * (1 - li.l_discount)             as revenue,
        li.l_extendedprice * (1 - li.l_discount) * (1 + li.l_tax) as net_amount
    from lineitems li
    inner join orders o on li.l_orderkey = o.o_orderkey
)

select * from int_order_items
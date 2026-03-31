
with customers as (
    select * from {{ ref('stg_TPCH__CUSTOMER') }}
),

nations as (
    select * from {{ ref('stg_TPCH__NATION') }}
),

regions as (
    select * from {{ ref('stg_TPCH__REGION') }}
),

int_customer as (
    select
        c.c_custkey as customer_key,
        c.c_name as customer_name,
        c.c_address as customer_address,
        c.c_phone as customer_phone,
        c.c_acctbal as account_balance,
        c.c_mktsegment as market_segment,
        n.n_name    as customer_nation_name,
        r.r_name    as customer_region_name
    from customers c
    left join nations  n 
        on c.c_nationkey  = n.n_nationkey
    left join regions  r 
        on n.n_regionkey = r.r_regionkey
)

select * from int_customer
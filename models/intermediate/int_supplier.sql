
with suppliers as (
    select * from {{ ref('stg_TPCH__SUPPLIER') }}
),

nations as (
    select * from {{ ref('stg_TPCH__NATION') }}
),

regions as (
    select * from {{ ref('stg_TPCH__REGION') }}
),

enriched as (
    select
        s.s_suppkey as supplier_key,
        SPLIT_PART(s.s_name, '#', 2) as supplier_name,
        s.s_address as supplier_address,
        s.s_phone as supplier_phone,
        s.s_acctbal as supplier_account_balance,
        s.s_comment as supplier_comment,
        n.n_name as supplier_nation_name,
        r.r_name as supplier_region_name,

    from suppliers s
    left join nations n 
        on s.s_nationkey  = n.n_nationkey
    left join regions r 
        on n.n_regionkey = r.r_regionkey
)

select * from enriched
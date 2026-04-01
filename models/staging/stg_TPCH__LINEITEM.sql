with 

source as (

    select * from {{ source('TPCH', 'LINEITEM') }}

),

renamed as (

    select
        l_comment
        , l_commitdate
        , l_discount
        , l_extendedprice
        , l_linenumber
        , l_linestatus
        , l_orderkey
        , l_partkey
        , l_quantity
        , l_receiptdate
        , l_returnflag
        , l_shipdate
        , l_shipinstruct
        , l_shipmode
        , l_suppkey
        , l_tax

    from source

)

select * from renamed
with 

source as (

    select * from {{ source('TPCH', 'PARTSUPP') }}

),

renamed as (

    select
        ps_partkey
        , ps_suppkey
        , ps_availqty
        , ps_supplycost
        , ps_comment

    from source

)

select * from renamed
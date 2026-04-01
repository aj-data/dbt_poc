with 

source as (

    select * from {{ source('TPCH', 'NATION') }}

),

renamed as (

    select
        n_nationkey
        , n_name
        , n_regionkey
        , n_comment

    from source

)

select * from renamed
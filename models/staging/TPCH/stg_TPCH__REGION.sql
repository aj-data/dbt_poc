with 

source as (

    select * from {{ source('TPCH', 'REGION') }}

),

renamed as (

    select
        r_regionkey
        , r_name
        , r_comment

    from source

)

select * from renamed

with parts as (
    select * from {{ ref('stg_TPCH__PART') }}
)

select
    p_partkey    as part_key,
    p_name       as part_name,
    p_mfgr       as manufacturer,
    p_brand      as brand,
    p_type       as part_type,
    split_part(p_type, ' ', 1) as material_category,
    p_size       as size,
    p_container  as container,
    p_retailprice as retail_price
from parts
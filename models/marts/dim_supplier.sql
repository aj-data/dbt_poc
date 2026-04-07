
with supplier as (
    select * from {{ ref('int_supplier') }}
)

select
    supplier_key,
    supplier_name,
    supplier_address,
    supplier_phone,
    supplier_account_balance,
    supplier_nation_name,
    supplier_region_name,
    supplier_comment
from supplier
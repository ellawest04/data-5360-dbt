{{ config(
    materialized = 'table', 
    schema = "dw_ecosystems"
)}}

select 
    product_id as product_key, 
    product_id, 
    product_name, 
    product_type, 
    price
from {{ source('eco_landing', 'product')}} 
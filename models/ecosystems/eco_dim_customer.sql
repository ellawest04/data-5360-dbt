{{ config(
    materialized = 'table', 
    schema = "dw_ecosystems"
)}}

select 
    customer_id as customer_key, 
    customer_id, 
    customer_first_name, 
    customer_last_name, 
    customer_phone,
    customer_address,
    customer_city,
    customer_state, 
    customer_zip, 
    customer_country
from {{ source('eco_landing', 'customer')}} 
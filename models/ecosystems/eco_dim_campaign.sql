{{ config(
    materialized = 'table', 
    schema = "dw_ecosystems"
)}}

select 
    campaign_id AS campaign_key,
    campaign_id, 
    campaign_name, 
    campaign_discount
from {{ source('eco_landing', 'promotional_campaign')}} 
{{ config( 
    materialized = 'table', 
    schema = 'dw_ecosystems'
)}}

select 
    ol.order_id AS order_key, 
    c.customer_key, 
    d.date_key,  
    p.product_key, 
    cp.campaign_key, 
    ol.quantity, 
    ol.discount, 
    ol.price_after_discount

from {{ source("eco_landing", "order_line") }} ol
inner join {{ source("eco_landing", "orders")}} o 
    on ol.order_id = o.order_id
inner join {{ ref('eco_dim_date')}} d
    on cast(o.order_timestamp as date) = d.date_day
inner join {{ ref('eco_dim_customer') }} c
    on o.customer_id = c.customer_id
inner join {{ ref('eco_dim_campaign')}} cp
    on ol.campaign_id = cp.campaign_id
inner join {{ ref('eco_dim_product')}} p
    on ol.product_id = p.product_id

{{ config( 
    materialized = 'table', 
    schema = 'dw_ecosystems'
)}}

select 
    c.customer_id AS customer_key, 
    d.date_key,
    cp.campaign_key,
    e.email_key,
    me.eventtype


from {{ source("email_landing", "marketing_emails") }} me
inner join {{ source("eco_landing", "customer") }} c
    on me.customerid = c.customer_id
inner join {{ ref('eco_dim_campaign')}} cp
    on me.campaignid = cp.campaign_id
inner join {{ ref('eco_dim_date')}} d
    on cast(me.sendtimestamp as date) = d.date_day
inner join {{ ref('eco_dim_email')}} e
    on me.emailid = e.emailid

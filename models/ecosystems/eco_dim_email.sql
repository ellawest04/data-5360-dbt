{{ config(
    materialized = 'table', 
    schema = "dw_ecosystems"
)}}

select 
    emailid AS email_key, 
    emailid, 
    subscriberemail AS email_name,
    sendtimestamp,
from {{ source('email_landing', 'marketing_emails')}} 
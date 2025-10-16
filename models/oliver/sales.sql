{{ config(
    materialized='table',
    schema='dw_oliver'
) }}

select
    c.customer_key,
    c.first_name as customer_firstname,
    c.last_name as customer_lastname,
    e.employee_key,
    e.first_name as employee_firstname,
    e.last_name as employee_lastname,
    p.product_key,
    p.product_name,
    s.store_key,
    s.store_name,
    d.date_key,
    d.date_day,
    f.quantity,
    f.unit_price,
    f.dollas_sold
from {{ ref('fact_sales') }} f
inner join {{ ref('oliver_dim_customer') }} c
    on f.customer_key = c.customer_key
inner join {{ ref('oliver_dim_employee') }} e
    on f.employee_key = e.employee_key
inner join {{ ref('oliver_dim_product') }} p
    on f.product_key = p.product_key
inner join {{ ref('oliver_dim_store') }} s
    on f.store_key = s.store_key
inner join {{ ref('oliver_dim_date') }} d
    on f.date_key = d.date_key

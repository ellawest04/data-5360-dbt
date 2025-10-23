{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

with src as (
    select
        employee_id,
        PARSE_JSON(certification_json):certification_name::STRING AS certification_name,
        PARSE_JSON(certification_json):certification_cost::FLOAT AS certification_cost,
        PARSE_JSON(certification_json):certification_awarded_date::DATE AS certification_awarded_date
    from {{ source('oliver_landing', 'employee_certifications') }}
)

select
    employee_id,
    certification_name,
    certification_cost,
    certification_awarded_date
from src

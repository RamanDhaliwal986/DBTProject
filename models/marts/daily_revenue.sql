{{ config(
    materialized='table',
    database='ANALYTICS',
    schema='MARTS'
) }}

select
    transaction_date,
    sum(amount) as total_revenue,
    count(distinct customer_id) as unique_customers
from {{ ref('stg_transactions') }}
group by transaction_date
with stg_dim_customers as (
  SELECT
    customer_id as nk_customer_id,
    customer_first_name as cust_first_name,
    customer_family_name as cust_family_name,
    customer_gender as cust_gender,
    customer_birth_date as cust_birth_date,
    customer_country as cust_country,
    customer_phone_number as cust_phone_number
  from {{ref("pactravel_stg_customers")}}
),
dim_customers as (
  select 
    nk_customer_id,
    cust_first_name,
    cust_family_name,
    cust_first_name || " " || cust_family_name as cust_full_name,
    cust_gender,
    cust_birth_date,
    cust_country,
    cust_phone_number,
    {{dbt_date.now()}} as updated_at
  from stg_dim_customers
)
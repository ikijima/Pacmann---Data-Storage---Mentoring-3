with stg_dim_hotels as (
  select 
    hotel_id as nk_hotel_id,
    hotel_name as hotel_name,
    hotel_address as hotel_address,
    city as hotel_city,
    country as hotel_country,
    hotel_score as hotel_score
  from {{ref("pactravel_stg_hotels")}}
),
dim_hotels as (
  select nk_hotel_id,
    hotel_name,
    hotel_address,
    hotel_city,
    hotel_country,
    hotel_score,
    {{dbt_date.now()}} as updated_at
  from stg_dim_hotels
)

select * from dim_hotels
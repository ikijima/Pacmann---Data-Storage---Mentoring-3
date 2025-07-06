with stg_dim_airports as (
  SELECT
    airport_id as nk_airport_id,
    airport_name as airport_name,
    city as airport_city,
    latitude as airport_lat,
    longitude as airport_lng
  FROM ({{ref("pactravel_stg_airports")}})
),
dim_aiports as (
  select 
    nk_airport_id,
    airport_name,
    airport_city,
    airport_lat,
    airport_lng,
    {{dbt_date.now()}} as updated_at
  from stg_dim_airports
)

select * from dim_airports;
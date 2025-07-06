with stg_dim_airlines as (
    select
        airline_id as nk_airline_id,
        airline_name as airline_name,
        country as airline_country,
        airline_iata as airline_iata,
        airline_icao as airline_icao,
        alias as airline_alias
    from {{ref("pactravel_stg_airlines")}}
),
dim_airlines as (
    select
      nk_airline_id,
      airline_name,
      airline_country,
      airline_iata,
      airline_icao,
      airline_alias,
      {{dbt_date.now()}} as updated_at
    from stg_dim_aircrafts
)

select * from dim_airlines;
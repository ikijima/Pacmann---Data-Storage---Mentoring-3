with stg_dim_aircrafts as (
    select
        aircraft_id as nk_aircraft_id,
        aircraft_name as aircraft_name,
        aircraft_iata as aircraft_iata,
        aircraft_icao as aircraft_icao
    from {{ref("pactravel_stg_aircrafts")}}
),
dim_aircrafts as (
    select
      nk_aircraft_id,
      aircraft_name,
      aircraft_iata,
      aircraft_icao,
      {{dbt_date.now()}} as updated_at
    from stg_dim_aircrafts
)

select * from dim_aircrafts;
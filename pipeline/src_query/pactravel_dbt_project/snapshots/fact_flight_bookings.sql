with stg_fact_flight_bookings as (
  select 
    trip_id as nk_flight_trip_id,
    customer_id as nk_customer_id,
    flight_number as flight_number,
    airline_id as nk_airline_id,
    aircraft_id as nk_aircraft_id,
    airport_src as airport_src,
    airport_dst as airport_dst,
    departure_time as flight_dep_time,
    departure_date as flight_dep_date,
    flight_duration as flight_duration,
    travel_class as flight_travel_class,
    seat_number as flight_seat_number,
    price as flight_price
  from {{ref("pactravel_stg_flight_bookings")}}
),
fact_flight_bookings as (
  select 
    nk_flight_trip_id,
    nk_customer_id,
    flight_number,
    nk_airline_id,
    nk_aircraft_id,
    airport_src,
    airport_dst,
    flight_dep_time,
    flight_dep_date,
    flight_duration,
    flight_travel_class,
    flight_seat_number
  from stg_fact_flight_bookings
)

select * from fact_flight_bookings;
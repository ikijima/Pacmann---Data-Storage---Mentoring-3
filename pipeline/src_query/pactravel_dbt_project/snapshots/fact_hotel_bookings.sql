with stg_fact_hotel_bookings as (
  SELECT 
    trip_id as nk_hotel_trip_id,
    customer_id as nk_customer_id,
    hotel_id as nk_hotel_id,
    check_in_date as hotel_check_in_date,
    check_out_date as hotel_check_out_date,
    price as hotel_price,
    breakfast_included as hotel_breakfast
  from {{ref("pactravel_stg_hotel_bookings")}}
),
fact_hotel_bookings as (
  SELECT  
    nk_hotel_trip_id,
    nk_customer_id,
    nk_hotel_id,
    hotel_check_in_date,
    hotel_check_out_date,
    hotel_price,
    hotel_breakfast
  from stg_fact_hotel_bookings
)

select * fact_hotel_bookings;
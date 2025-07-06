WITH hotel_booking_count AS (
    SELECT 
        EXTRACT(YEAR FROM check_in_date) AS year,
        EXTRACT(MONTH FROM check_in_date) AS month,
        EXTRACT(DAY FROM check_in_date) AS day,
        COUNT(trip_id) AS hotel_trip_count
    FROM {{ ref('stg_hotel_bookings') }}
    GROUP BY 1, 2, 3
),

flight_booking_count AS (
    SELECT 
        EXTRACT(YEAR FROM departure_date) AS year,
        EXTRACT(MONTH FROM departure_date) AS month,
        EXTRACT(DAY FROM departure_date) AS day,
        COUNT(trip_id) AS flight_trip_count
    FROM {{ ref('stg_flight_bookings') }}
    GROUP BY 1, 2, 3
),
fact_daily_trip_count as (
  SELECT 
      COALESCE(hbc.year, fbc.year) AS year,
      COALESCE(hbc.month, fbc.month) AS month,
      COALESCE(hbc.day, fbc.day) AS day,
      COALESCE(hbc.hotel_trip_count, 0) AS hotel_trip_count,
      COALESCE(fbc.flight_trip_count, 0) AS flight_trip_count,
      {{ dbt_date.now() }} AS updated_at
  FROM hotel_booking_count hbc
  FULL OUTER JOIN flight_booking_count fbc
      ON hbc.year = fbc.year AND hbc.month = fbc.month AND hbc.day = fbc.day
  ORDER BY 1, 2, 3
)

select * from fact_daily_trip_count;

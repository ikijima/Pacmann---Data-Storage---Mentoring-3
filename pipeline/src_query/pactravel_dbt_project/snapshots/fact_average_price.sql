{{ config(
    materialized = 'table',
    tags = ['fact', 'flights', 'avg_price']
) }}

with fact_average_price as (
    SELECT 
        ap.airport_name AS airport_depart, 
        ap2.airport_name AS airport_arriv, 
        al.airline_name, 
        ROUND(AVG(fb.price), 2) AS avg_price
    FROM {{ ref('stg_flight_bookings') }} fb
    JOIN {{ ref('stg_airlines') }} al 
        ON fb.airline_id = al.airline_id
    JOIN {{ ref('stg_airports') }} ap 
        ON fb.airport_src = ap.airport_id
    JOIN {{ ref('stg_airports') }} ap2 
        ON fb.airport_dst = ap2.airport_id
    GROUP BY 1, 2, 3
    ORDER BY 1, 2, 3
)

select * from fact_average_price;

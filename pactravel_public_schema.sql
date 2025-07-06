CREATE TABLE public.aircrafts (
    aircraft_name character varying,
    aircraft_iata character varying,
    aircraft_icao character varying,
    aircraft_id character varying NOT NULL
);

CREATE TABLE public.airlines (
    airline_id integer NOT NULL,
    airline_name character varying,
    country character varying,
    airline_iata character varying,
    airline_icao character varying,
    alias character varying
);

CREATE TABLE public.airports (
    airport_id integer NOT NULL,
    airport_name character varying,
    city character varying,
    latitude double precision,
    longitude double precision
);

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    customer_first_name character varying,
    customer_family_name character varying,
    customer_gender character varying,
    customer_birth_date date,
    customer_country character varying,
    customer_phone_number bigint
);

CREATE TABLE public.flight_bookings (
    trip_id integer NOT NULL,
    customer_id integer,
    flight_number character varying(32) NOT NULL,
    airline_id integer,
    aircraft_id character varying(32),
    airport_src integer,
    airport_dst integer,
    departure_time time without time zone,
    departure_date date,
    flight_duration character varying(32),
    travel_class character varying(32),
    seat_number character varying(32) NOT NULL,
    price integer
);

CREATE TABLE public.hotel (
    hotel_id integer NOT NULL,
    hotel_name character varying,
    hotel_address character varying,
    city character varying,
    country character varying,
    hotel_score double precision
);

CREATE TABLE public.hotel_bookings (
    trip_id integer NOT NULL,
    customer_id integer,
    hotel_id integer,
    check_in_date date,
    check_out_date date,
    price integer,
    breakfast_included boolean
);
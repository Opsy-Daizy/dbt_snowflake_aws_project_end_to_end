{{
  config( materialized = 'incremental',
    unique_key = 'booking_id')
    }}

    select
        booking_id,
        listing_id,
        booking_date,
        {{multiply('nights_booked', 'booking_amount', 2)}} + cleaning_fee + service_fee  as total_amount,
        booking_status,
        created_at
    from {{ ref('bronze_bookings') }}
    {# {% if is_incremental() %}
        where created_at > (select max(created_at) from {{ this }})
    {% endif %} #}
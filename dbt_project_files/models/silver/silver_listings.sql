{{
  config(
    materialized = 'incremental',
    unique_key = 'listing_id'
    )
}}

    select
        listing_id,
        host_id,
        property_type,
        room_type,
        city,
        country
        accommodates,
        bedrooms,
        bathrooms,
        price_per_night,
        {{ tag('price_per_night') }} as price_per_night_tag,
        created_at
    from {{ ref('bronze_listings') }}
    {# {% if is_incremental() %}
        where created_at > (select max(created_at) from {{ this }})
    {% endif %} #}

{% set nights_booked = 10 %}
{% set flag = 1 %}

select * from {{ ref('bronze_bookings') }}
{% if flag == 1  %}
    where NIGHTS_BOOKED > {{nights_booked}}
{% else %}
    where NIGHTS_BOOKED = {{nights_booked}}
{% endif %}